abbr l exa --long --header --git
abbr lt exa --long --header --git --tree
abbr b bit
abbr c bat
abbr cat bat
abbr ca 'code --add .'
abbr gco 'git checkout'
abbr gcob 'git checkout -b'
abbr gcom 'git checkout master;
abbr gl 'glances --theme-white'
abbr k kubectl
abbr kcc 'kubectl config current-context'
abbr v nvim

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -x GOPATH /Users/ggilmore/dev/go

defaults write org.eyebeam.SelfControl MaxBlockLength 90
defaults write org.eyebeam.SelfControl BlockLengthInterval 2

set -x BAT_THEME 'GitHub'
set -g fish_user_paths "/usr/local/opt/postgresql@11/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths

set -x FZF_DEFAULT_COMMAND 'fd --type f'

# Setup direnv
eval (direnv hook fish)

# Setup asdf - must be last
source /usr/local/opt/asdf/asdf.fish
