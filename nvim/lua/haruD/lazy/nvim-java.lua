return {
    {
        "nvim-java/nvim-java",
        config = function()
            require("java").setup({
                root_markers = {
                    "settings.gradle",
                    "settings.gradle.kts",
                    "pom.xml",
                    "build.gradle",
                    "mvnw",
                    "gradlew",
                    "build.gradle",
                    "build.gradle.kts",
                    ".git",
                },

                java_home = "/Users/harudaylnu/Library/Java/JavaVirtualMachines/corretto-21.0.8/Contents/Home",

                -- jdtls = {
                --     version = "v1.43.0",
                -- },

                lombok = {
                    version = "nightly",
                },

                java_test = {
                    enable = true,
                    version = "0.40.1",
                },

                spring_boot_tools = {
                    enable = false,
                    -- version = "1.55.1",
                },

                jdk = {
                    auto_install = true,
                    -- version = "17.0.2",
                },

                notifications = {
                    dap = true,
                },

                verification = {
                    invalid_order = true,
                    duplicate_setup_calls = true,
                    invalid_mason_registry = false,
                },

                mason = {
                    registries = {
                        "github:nvim-java/mason-registry",
                    },
                },
            })

            -- Configure jdtls with project-specific Java runtimes
            vim.lsp.config('jdtls', {
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-21",
                                    path = "/Users/harudaylnu/Library/Java/JavaVirtualMachines/corretto-21.0.8/Contents/Home/",
                                    default = true,
                                },
                                {
                                    name = "JavaSE-17",
                                    path = "/Users/harudaylnu/Library/Java/JavaVirtualMachines/corretto-17.0.16/Contents/Home/",
                                },
                                {
                                    name = "JavaSE-11",
                                    path = "/Users/harudaylnu/Library/Java/JavaVirtualMachines/corretto-11.0.28/Contents/Home/",
                                },
                            },
                        },
                    },
                },
            })

            -- Enable jdtls LSP
            vim.lsp.enable('jdtls')
        end,
    },
}

