-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}

M.options = {
   mouse = "",
   tabstop = 2,
}


M.plugins = {
    options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   status = {
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      dashboard = true,
   },
}

return M

-- this will replace lspconfig's default config with the file custom/lspconfig.lua
-- make sure you do :PackerCompile or :PackerSync after this since the packer_compiled.vim or packer_compiled.lua present in the ~/.config/nvim/plugin dir needs to update the paths!
