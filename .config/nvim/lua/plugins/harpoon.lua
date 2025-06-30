return {
  'ThePrimeagen/harpoon',
  version = '*',
  keys = {
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
    {
      '<leader>1',
      function()
        require('harpoon.ui').nav_file(1)
      end,
      desc = 'Jump to mark 1',
    },
    {
      '<leader>2',
      function()
        require('harpoon.ui').nav_file(2)
      end,
      desc = 'Jump to mark 2',
    },
    {
      '<leader>3',
      function()
        require('harpoon.ui').nav_file(3)
      end,
      desc = 'Jump to mark 3',
    },
    {
      '<leader>4',
      function()
        require('harpoon.ui').nav_file(4)
      end,
      desc = 'Jump to mark 4',
    },
    {
      '<leader>5',
      function()
        require('harpoon.ui').nav_file(5)
      end,
      desc = 'Jump to mark 5',
    },
    {
      '<leader>6',
      function()
        require('harpoon.ui').nav_file(6)
      end,
      desc = 'Jump to mark 6',
    },
    {
      '<leader>7',
      function()
        require('harpoon.ui').nav_file(7)
      end,
      desc = 'Jump to mark 6',
    },
    {
      '<leader>8',
      function()
        require('harpoon.ui').nav_file(8)
      end,
      desc = 'Jump to mark 6',
    },
    {
      '<leader>9',
      function()
        require('harpoon.ui').nav_file(9)
      end,
      desc = 'Jump to mark 6',
    },
    {
      '<leader>0',
      function()
        require('harpoon.ui').nav_file(0)
      end,
      desc = 'Jump to mark 6',
    },
  },

  opts = {
    menu = {
      width = 60,
    },
  },
}
