SOURCE_PATH=$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
)

[ -f $SOURCE_PATH/tools.sh ] && source $SOURCE_PATH/tools.sh
[ -f $SOURCE_PATH/cb/init.sh ] && source $SOURCE_PATH/cb/init.sh

[ -f $SOURCE_PATH/corp.sh ] && alias corp="$SOURCE_PATH/corp.sh"
[ -f $SOURCE_PATH/projectscan.sh ] && alias projectscan="$SOURCE_PATH/projectscan.sh"
