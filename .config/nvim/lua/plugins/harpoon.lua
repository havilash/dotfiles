return {
  'ThePrimeagen/harpoon',
  version = '*',
  keys = function()
    local keys = {
      {
        '<leader>ha',
        function()
          require('harpoon.mark').add_file()
        end,
        desc = '[H]arpoon [a]dd file',
      },
      {
        '<leader>hm',
        function()
          require('harpoon.ui').toggle_quick_menu()
        end,
        desc = '[H]arpoon [m]enu',
      },

      -- {
      --   '<leader>]',
      --   function()
      --     require('harpoon.ui').nav_next()
      --   end,
      --   desc = 'Go to next mark',
      -- },
      -- {
      --   '<leader>[',
      --   function()
      --     require('harpoon.ui').nav_prev()
      --   end,
      --   desc = 'Go to previous mark',
      -- },
    }

    for i = 0, 9 do
      local key = {
        '<leader>' .. i,
        function()
          require('harpoon.ui').nav_file(i)
        end,
        desc = '[H]arpoon to mark [' .. i .. ']',
      }
      table.insert(keys, key)
    end

    return keys
  end,
  opts = {
    menu = {
      width = 60,
    },
  },
}
