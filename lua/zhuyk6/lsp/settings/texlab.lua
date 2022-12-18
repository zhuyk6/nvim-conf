-- https://github.com/latex-lsp/texlab/wiki/Configuration

local opts = {
    settings = {
        texlab = {
            rootDirectory = ".",
            auxDirectory = "./build/",
            bibtexFormatter = "texlab",
            build = {
                -- https://github.com/latex-lsp/texlab/wiki/Tectonic
                executable = "tectonic",
                args = {
                    "-X",
                    "compile",
                    "%f",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                    "--outdir",
                    "./build/"
                },
                forwardSearchAfter = true,
                onSave = true,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    },
    single_file_support = true,
}

return opts
