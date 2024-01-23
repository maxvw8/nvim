local set = vim.opt

set.errorbells = false
set.fileencoding = 'UTF-8'
set.fileformat = 'unix' -- Set unix line endings
set.fileformats = 'unix,mac,dos'
set.path = { '.', vim.fn.expand('~') .. '/.config/nvim', vim.fn.expand('~') .. '/.config/nvim/lua' }

-- Undo, backups and history
set.swapfile = false
set.backup = false
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.undofile = true
set.undolevels = 1000 -- Use many mucho levels of undo
set.writebackup = false
-- numbers
set.number = true
set.relativenumber = true
-- tabs
set.expandtab = true    -- Use spaces instead of tabs
set.shiftwidth = 2      -- When reading, tabs are 2 spaces
set.softtabstop = 2     -- In insert mode, tabs are 2 spaces
set.tabstop = 2
set.smartindent = true

set.colorcolumn = { 80 } -- Make a mark for columns 80 and 120
set.cursorline = true
set.diffopt:append('vertical')
set.equalalways = false
-- set.foldenable = true     -- Enable folding
-- set.foldlevelstart = 99   -- Open most folds by default
-- set.foldmethod = 'indent' -- Fold based on indent level
-- set.foldnestmax = 10      -- 10 nested fold max
-- set.gdefault = true       -- Search everything, not just the current line
-- set.grepprg = "rg --vimgrep"
set.ignorecase = true
-- set.inccommand = 'nosplit'
-- set.laststatus = 2
set.linebreak = true
-- set.list = false
-- set.modelines = 1
set.ruler = true
set.scrolloff = 7 -- Keep the cursor visible within 1 lines when scrolling
set.shiftround = false
set.showmatch = true
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.tagcase = 'followscs' -- Follow smartcase and ignorecase when doing tag search
set.updatetime = 300
set.wrap = true
set.wrapmargin = 0
set.wrapscan = true
