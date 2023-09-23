local M = {}

function M.contains(table, val)
  for index, value in ipairs(table) do
    if value == val then
      return true
    end
  end

  return false
end

return M
