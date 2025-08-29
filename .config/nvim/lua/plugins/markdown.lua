local function tprint(tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2
    for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent)
        if (type(k) == "number") then
            toprint = toprint .. "[" .. k .. "] = "
        elseif (type(k) == "string") then
            toprint = toprint .. k .. "= "
        end
        if (type(v) == "number") then
            toprint = toprint .. v .. ",\r\n"
        elseif (type(v) == "string") then
            toprint = toprint .. "\"" .. v .. "\",\r\n"
        elseif (type(v) == "table") then
            toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
        else
            toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
        end
    end
    toprint = toprint .. string.rep(" ", indent - 2) .. "}"
    return toprint
end

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
        {
            'jbyuki/nabla.nvim',

            dependencies = {
                "nvim-neo-tree/neo-tree.nvim",
            },
            lazy = true,

            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "latex" },
                    auto_install = true,
                    sync_install = false,
                })

                require("nabla").enable_virt()
            end,

            keys = function()
                return {
                    {
                        "<leader>p",
                        function()
                            require("nabla").popup()
                        end,
                        desc = "NablaPopUp",
                    },
                }
            end,
        },
    }, ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        custom_handlers = {
            latex = {
                parse = function(ctx)
                    local Node = require('render-markdown.lib.node')
                    local Marks = require('render-markdown.lib.marks')
                    local Context = require('render-markdown.request.context')

                    local nabla_ascii = require('nabla.ascii')
                    local nabla_latex = require('nabla.latex')

                    local ctx2 = Context.get(ctx.buf)
                    local node = Node.new(ctx2.buf, ctx.root)

                    local text = string.sub(node.text, 2, #node.text - 1)

                    local latex = nabla_latex.parse_all(text)

                    -- print(tprint(latex))

                    local converted_text = nabla_ascii.to_ascii(latex.exps, 1)

                    local marks = Marks.new(ctx2, true)

                    local config = { ---@type render.md.base.Config
                        enabled = true,
                        render_modes = false,
                    }

                    local drawing = {}
                    for row in vim.gsplit(tostring(converted_text), '\n') do
                        table.insert(drawing, { row, 'RenderMarkdownMath' })
                    end

                    if #drawing >= 3 then
                        marks:add(config, 'virtual_lines', node.start_row, 0, {
                            virt_lines = { { table.remove(drawing, #drawing) } },
                            virt_lines_above = false,
                        })
                    end

                    marks:over(config, true, node, {
                        virt_text = { table.remove(drawing) },
                        virt_text_pos = 'inline',
                        conceal = '',
                    })

                    while #drawing > 0 do
                        -- local line = {} ---@type render.md.mark.Text
                        local thing = table.remove(drawing)
                        marks:add(config, 'virtual_lines', node.start_row, 0, {
                            virt_lines = { { thing } },
                            virt_lines_above = true,
                        })
                    end

                    return marks:get()
                end
            },
        },
    },
}
