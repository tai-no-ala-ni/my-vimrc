let g:denops#server#deno_args =['-q','--no-lock','-A']
let g:denops_disable_version_check = 1
" deno --help | grep -- \"--unstable\" 2>&1 | xargs echo | sed -e 's/--unstable//' 
"let g:denops#server#deno_args =['-q','--no-lock','--unstable-bare-node-builtins','--unstable-byonm','--unstable-sloppy-imports','--unstable-broadcast-channel','--unstable-cron','--unstable-ffi','--unstable-fs','--unstable-http','--unstable-kv','--unstable-net','--unstable-temporal','--unstable-unsafe-proto','--unstable-webgpu','--unstable-worker-options','-A']
