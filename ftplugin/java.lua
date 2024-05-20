local home = os.getenv("HOME")
local jdtls = require("jdtls")

local root_markers = {"gradlew", ".git"}
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- local nnoremap = function (rhs, lhs, bufopts, desc)
--   bufopts.desc = desc
--   vim.keymap.set("n", rhs, lhs, bufopts)
-- end

local on_attach = function(client, bufnr)
  -- Regular Neovim LSP client keymappings
  -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
  -- nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
  -- nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  -- nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
  -- nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
  -- nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  -- nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  -- nnoremap("<space>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts, "List workspace folders")
  -- nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  -- nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
  -- nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
  -- vim.keymap.set("v", "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
  --   { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
  -- nnoremap("<space>f", function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
  --
  -- -- Java extensions provided by jdtls
  -- nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  -- nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
  -- nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
  -- vim.keymap.set("v", "<space>em", [[<ESC><CMD>lua require("jdtls").extract_method(true)<CR>]],
  --   { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  -- on_attach = on_attach,  -- We pass our on_attach keybindings to the configuration map
  root_dir = root_dir, -- Set the root directory to our found root_marker
  -- Here you can configure eclipse.jdt.ls specific settings
  -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      format = {
        settings = {
          -- Use Google Java style guidelines for formatting
          -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
          -- and place it in the ~/.local/share/eclipse directory
          -- url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          -- profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },  -- Use fernflower to decompile library code
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*", "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = home .. ".sdkman/candidates/java/8.0.412-zulu"
          },
        }
      }
    }
  },
  cmd = {
    home .. "/.sdkman/candidates/java/current/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
    -- "-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",

    -- The jar file is located where jdtls was installed. This will need to be updated
    -- to the location where you installed jdtls
    "-jar", home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.aarch64_1.2.900.v20240129-1338.jar",

    -- The configuration for jdtls is also placed where jdtls was installed. This will
    -- need to be updated depending on your environment
    "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",

    -- Use the workspace_folder defined above to store data for this project
    "-data", workspace_folder,
  },
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)

