return {
  'IbrahimShahzad/KamaiZen',
  tag = 'v0.1.0', -- or tag = 'v0.0.5'
  build = 'go build',
  opts = {
    settings = {
      kamaizen = {
        enableDeprecatedCommentHint = true, -- to enable hints for '#' comments
        enableDiagnostics = true, -- to enable/disable diagnostics
        KamailioSourcePath = '/home/red/work/kamailio/',
        loglevel = 3,
      },
    },
  },
}
