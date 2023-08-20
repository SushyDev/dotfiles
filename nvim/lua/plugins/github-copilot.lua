return {
  'zbirenbaum/copilot.lua',
  config = function()
    require('copilot').setup{
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-L>"
        }
      }
    }
  end
}
