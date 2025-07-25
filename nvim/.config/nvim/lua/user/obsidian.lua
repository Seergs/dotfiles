local ok, obsidian = pcall(require, "obsidian")
if not ok then
    print("Obsidian not ready")
    return
end

local path = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes"

obsidian.setup({
  workspaces = {
    {
      name = "Notes",
      path = path
    }
  },
  notes_subdir = "00-09 System/01 Inbox",
  new_notes_location = "00-09 System/01 Inbox",
  note_id_func = function (title)
      return title
  end
})
