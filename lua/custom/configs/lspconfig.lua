local util = require 'lspconfig.util'
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local function get_typescript_server_path(root_dir)

  local global_ts = util.path.join(vim.fn.stdpath('data'), 'mason', 'packages', 'typescript-language-server', 'node_modules', 'typescript', 'lib')
  -- local global_ts = '/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  on_new_config = function (new_config, new_root_dir)
    new_config.init_options.tsserver = {
      path = get_typescript_server_path(new_root_dir)
    }
  end
}


require'lspconfig'.volar.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}
