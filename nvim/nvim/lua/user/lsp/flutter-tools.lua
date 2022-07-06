local status_ok, ftools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

local M = {}
M.setup = function(attach, capabilities)
  ftools.setup({
    dev_tools = {
      autostart = true,
      auto_open_browser = true,
    },
    dev_log = {
      enabled = true,
      open_cmd = "tabe",
    },
    outline = {
      open_cmd = "50vnew",
      auto_open = true,
    },
    lsp = {
      on_attach = attach,
      capabilities = capabilities
    }
  })
end

return M
