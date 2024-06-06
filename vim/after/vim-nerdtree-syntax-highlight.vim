let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
" you can add these colors to your .vimrc to help customizing
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" 色の定義
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let s:cyan = "689FB9"
let s:violet = "692FB6"
let s:darkRed = "AE400F"
let s:darkGreen = "8FAA51"
let s:darkPurple =  "834F76"


" デフォルト色設定をオフにするためのVAR
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor = {}

" ファイルタイプごとの色設定
let g:NERDTreeExtensionHighlightColor['html'] = s:orange
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow
let g:NERDTreeExtensionHighlightColor['jsx'] = s:darkBlue
let g:NERDTreeExtensionHighlightColor['ts'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['tsx'] = s:lightPurple
let g:NERDTreeExtensionHighlightColor['json'] = s:brown
let g:NERDTreeExtensionHighlightColor['md'] = s:purple
let g:NERDTreeExtensionHighlightColor['rb'] = s:salmon
let g:NERDTreeExtensionHighlightColor['py'] = s:green
let g:NERDTreeExtensionHighlightColor['go'] = s:aqua
let g:NERDTreeExtensionHighlightColor['java'] = s:red
let g:NERDTreeExtensionHighlightColor['php'] = s:violet
let g:NERDTreeExtensionHighlightColor['sh'] = s:darkOrange
let g:NERDTreeExtensionHighlightColor['vim'] = s:pink
let g:NERDTreeExtensionHighlightColor['c'] = s:cyan
let g:NERDTreeExtensionHighlightColor['cpp'] = s:darkGreen
let g:NERDTreeExtensionHighlightColor['h'] = s:darkRed
let g:NERDTreeExtensionHighlightColor['hpp'] = s:darkPurple

" 正確な一致のファイルの色設定
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['README.md'] = s:yellow
let g:NERDTreeExactMatchHighlightColor['LICENSE'] = s:white

" パターンマッチによる色設定
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
let g:NERDTreePatternMatchHighlightColor['.*_test\.py$'] = s:rspec_red
let g:NERDTreePatternMatchHighlightColor['.*_test\.js$'] = s:rspec_red

" デフォルトの色設定（フォルダとファイル）
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
let g:WebDevIconsDefaultFileSymbolColor = s:blue
