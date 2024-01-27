local adventsofgo = require("personal.adventsofgo.cmd")
local function handle_cmd()
  adventsofgo.load_autocmd()
end
vim.api.nvim_create_user_command('AdventsOfGo', handle_cmd, {
  bang = true,
  desc = "Activate auto 'go run %' on save of .go files",

})
