# Load Antigen
source $HOME/.dotfiles/zsh/antigen.zsh

# Load Antigen configurations
antigen init $HOME/.dotfiles/zsh/.antigenrc

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Common shell functions
alias tf='tail -f'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias ka9='killall -9'
alias k9='kill -9'

# Zippin
alias gz='tar -zcvf'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Commerce Cloud
alias cg='cd ~/dev/source; source env.sh; cd commerce;'
alias sp='gradle tomcat-oracle-cc-admin -PbuildOnly=true --offline'

alias shit="sudo /usr/local/McAfee/AntiMalware/VSControl stopoas"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home
export CLOUD_CLIENT_ROOT=/Users/bnapier/dev/source

function startvm() {
  VBoxManage startvm $1 --type=headless
}

function stopvm() {
  VBoxManage controlvm $1 poweroff
}

function savevm() {
  VBoxManage controlvm $1 savestate
  VBoxManage snapshot $1 take $2
}

function restorevm() {
  VBoxManage controlvm $1 poweroff
  VBoxManage snapshot $1 restore $2
  VBoxManage startvm $1 --type=headless
}

function deletesh() {
  VBoxManage snapshot $1 delete $2
}

function runningvms() {
  VBoxManage list runningvms
}

# export NO_PROXY=127.0.0.1,localhost,*.local,*.us.oracle.com,blogs.oracle.com,/var/run/docker.sock,*.oraclecorp.com,slc12krx.us.oracle.com
# export ALL_PROXY=http://www-proxy.uk.oracle.com:80
# export HTTPS_PROXY=http://www-proxy.uk.oracle.com:80
# export HTTP_PROXY=http://www-proxy.uk.oracle.com:80

function run() {

  killall -9 java;

  cd ~/dev/source/commerce/Dynamo/Endeca/Assembler/lib;

  rm -rf /Users/bnapier/dev/source/commerce/Dynamo/Endeca/Index/lib;
  rm -rf /Users/bnapier/dev/source/commerce/Dynamo/Endeca/Assembler/lib;

  startvm CloudXE;

  cd ~/dev/source;

  source env.sh;

  cd commerce;

  chmod +x ../gradlew && gradlew t-o-a -x toolsui:admin:eslint -x toolsui:common:eslint -x Dynamo:Client:Admin:installSSE@oracle-commerce-cloud/punchout-lib -x Dynamo:Client:Admin:installSSE@oracle-commerce-cloud/purchase-order-app -x Dynamo:Client:Admin:installSSE@oracle-commerce-cloud/purchase-order-lib -x Dynamo:Client:Admin:zipSSE@oracle-commerce-cloud/punchout-app -x Dynamo:Client:Admin:zipSSE@oracle-commerce-cloud/punchout-lib -x Dynamo:Client:Admin:zipSSE@oracle-commerce-cloud/purchase-order-app -x Dynamo:Client:Admin:zipSSE@oracle-commerce-cloud/purchase-order-lib -x toolsui:common:eslint -x toolsui:admin:eslint -x toolsui:common:installESLint -x toolsui:common:installNodeSass -x toolsui:common:installJetScss -x toolsui:admin:compileAppScss -x :toolsui:common:compileJetScss -x :toolsui:common:compileJetScssRtl -x toolsui:admin:compileAppScssRtl -x toolsui:common:compileCcScss -x toolsui:common:compileCcaScss -x Dynamo:Client:Admin:installOotbSse -x toolsui:common:compileCcScssRtl -x toolsui:common:compileCcaScssRtl -x toolsui:common:compileFrameworkScss -x toolsui:common:compileFrameworkScssRtl -x cc:runMetadataCatalogParser -x cc:compileSwaggerMetadataCatalogConcatenator -x cc:runSwaggerMetadataCatalogConcatenator -x toolsui:admin:compileAppCca -x toolsui:admin:compileAppCcaRtl -x toolsui:common:compileCcaSingles -x toolsui:common:nodeSetup;
}

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
