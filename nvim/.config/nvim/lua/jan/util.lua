local M = {}

function M.cwd()
  return vim.loop.fs_realpath(vim.loop.cwd() or "") or ""
end

---@param opts? {relative: "cwd"|"root", modified_hl: string?}
function M.pretty_path(opts)
  opts = vim.tbl_extend("force", {
    relative = "cwd",
    modified_hl = "Constant",
  }, opts or {})

  return function(self)
    local path = vim.fn.expand("%:p") --[[@as string]]

    if path == "" then
      return ""
    end
    local root = vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
    local cwd = M.cwd()

    if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
      path = path:sub(#cwd + 2)
    else
      path = path:sub(#root + 2)
    end

    local sep = package.config:sub(1, 1)
    local parts = vim.split(path, "[\\/]")
    if #parts > 3 then
      parts = { parts[1], "…", parts[#parts - 1], parts[#parts] }
    end

    if opts.modified_hl and vim.bo.modified then
      parts[#parts] = M.format(self, parts[#parts], opts.modified_hl)
    end

    return table.concat(parts, sep)
  end
end

function M.find_root_dir(pattern)
  return vim.fs.dirname(vim.fs.find(pattern, { upward = true })[1])
end

return M
