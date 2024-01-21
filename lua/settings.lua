
local set = vim.opt

set.errorbells = false
set.fileencoding = 'UTF-8'
set.fileformat = 'unix' -- Set unix line endings
set.fileformats = 'unix,mac,dos'
set.path = {'.', vim.fn.expand('~') .. '/.config/nvim', vim.fn.expand('~') .. '/.config/nvim/lua'}

set.wildmenu = true
set.wildmode = "longest,list:longest"
set.wildignore:append({'.hg', '.git', '.svn'})                          -- Version control files
set.wildignore:append({'*.aux', '*.out', '*.toc'})                      -- LaTeX intermediate files
set.wildignore:append({'*.jpg', '*.bmp', '*.gif', '*.png', '*.jpeg'})   -- Binary images
set.wildignore:append({'*.o', '*.obj', '*.exe', '*.dll', '*.manifest'}) -- Compiled object files
set.wildignore:append({'*.spl'})                                        -- Compiled spelling word lists
set.wildignore:append({'*.sw?'})                                        -- Vim swap files
set.wildignore:append({'*.DS_Store'})                                   -- macOS noise
set.wildignore:append({'*.luac'})                                       -- Lua byte code
set.wildignore:append({'migrations'})                                   -- Django migrations
set.wildignore:append({'go/pkg'})                                       -- Go static files
set.wildignore:append({'go/bin'})                                       -- Go bin files
set.wildignore:append({'go/bin-vagrant'})                               -- Go bin-vagrant files
set.wildignore:append({'*.pyc'})                                        -- Python byte code
set.wildignore:append({'*.orig'})                                       -- Merge resolution files
set.wildignore:append({'node_modules'})                                 -- Node.js modules

-- Undo, backups and history
set.backup = false
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.undofile = true
set.undolevels = 1000 -- Use many mucho levels of undo
set.writebackup = false

set.background = 'dark'
set.cmdheight = 2 -- Give more space for displaying messages.
set.colorcolumn = { 80, 120 } -- Make a mark for columns 80 and 120
set.copyindent = true -- Copy the previous indentation on autoindenting
set.cursorline = true
set.diffopt:append('vertical')
set.equalalways = false
set.expandtab = true -- Use spaces instead of tabs
set.foldenable = true -- Enable folding
set.foldlevelstart = 99 -- Open most folds by default
set.foldmethod = 'indent' -- Fold based on indent level
set.foldnestmax = 10 -- 10 nested fold max
set.gdefault = true -- Search everything, not just the current line
set.grepprg = "rg --vimgrep"
set.ignorecase = true
set.inccommand = 'nosplit'
set.laststatus = 2
set.linebreak = true
set.list = false
set.modelines = 1
set.number = true
set.numberwidth = 4
set.relativenumber = true
set.ruler = true
set.scrolloff = 7 -- Keep the cursor visible within 1 lines when scrolling
set.shiftround = false
set.shiftwidth = 2 -- When reading, tabs are 2 spaces
set.showmatch = true
set.smartcase = true
set.softtabstop = 2 -- In insert mode, tabs are 2 spaces
set.splitbelow = true
set.splitright = true
set.tabstop = 2
set.tagcase = 'followscs' -- Follow smartcase and ignorecase when doing tag search
set.textwidth = 0 -- Turn off hard word wrapping
set.updatetime = 300
set.wrap = true
set.wrapmargin = 0
set.wrapscan = true

vim.cmd [[
" Make background transparent
highlight Normal guibg=none ctermbg=none gui=none
highlight NonText guibg=none ctermbg=none gui=none
highlight SignColumn guibg=none ctermbg=none gui=none
highlight EndOfBuffer guibg=none ctermbg=none gui=none

" SignColumn
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
]]

