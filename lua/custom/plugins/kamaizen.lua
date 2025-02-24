return {
  'IbrahimShahzad/KamaiZen',
  branch = 'master', -- or branch = 'master'
  build = 'go build',
  opts = {
    settings = {
      kamaizen = {
        enableDeprecatedCommentHint = true, -- to enable hints for '#' comments
        enableDiagnostics = true, -- to enable/disable diagnostics
        KamailioSourcePath = '/path/to/kamailio', -- or use current dir vim.fn.getcwd()
        loglevel = 3,
      },
    },
  },
}
