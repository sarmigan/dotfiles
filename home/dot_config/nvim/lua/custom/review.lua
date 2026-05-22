local M = {}
local review_buf = nil

local function get_or_create_buf()
  if review_buf and vim.api.nvim_buf_is_valid(review_buf) then
    return review_buf
  end
  review_buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(review_buf, "review-notes")
  vim.bo[review_buf].filetype = "markdown"
  return review_buf
end

-- Append a reference to the current line/selection to the review buffer
function M.add_note(start_line, end_line)
  local buf = get_or_create_buf()
  local file = vim.fn.expand("%:.")

  -- Default to current line if no range passed
  start_line = start_line or vim.fn.line(".")
  end_line = end_line or start_line

  local code = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local ref = string.format("%s:%d%s", file, start_line,
    end_line ~= start_line and ("-" .. end_line) or "")

  local entry = { "", "### " .. ref, "```" }
  vim.list_extend(entry, code)
  table.insert(entry, "```")
  table.insert(entry, "> ")

  local line_count = vim.api.nvim_buf_line_count(buf)
  vim.api.nvim_buf_set_lines(buf, line_count, line_count, false, entry)

  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, buf)
  local new_count = vim.api.nvim_buf_line_count(buf)
  vim.api.nvim_win_set_cursor(0, { new_count, 2 })
  vim.cmd("startinsert!")
end

-- Copy the entire review buffer to clipboard
function M.copy()
  if not (review_buf and vim.api.nvim_buf_is_valid(review_buf)) then
    vim.notify("No review buffer", vim.log.levels.WARN)
    return
  end
  local lines = vim.api.nvim_buf_get_lines(review_buf, 0, -1, false)
  local text = table.concat(lines, "\n")

  if #vim.trim(text) == 0 then
    vim.notify("Review buffer is empty", vim.log.levels.WARN)
    return
  end

  vim.fn.setreg("+", text)
  vim.fn.setreg('"', text)
  vim.notify("Review copied to clipboard")
end

-- Clear the review buffer
function M.clear()
  if not (review_buf and vim.api.nvim_buf_is_valid(review_buf)) then
    vim.notify("No review buffer", vim.log.levels.WARN)
    return
  end
  vim.api.nvim_buf_set_lines(review_buf, 0, -1, false, {})
  vim.notify("Review cleared")
end

return M
