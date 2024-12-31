SOURCE_PATH=$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
)

source $SOURCE_PATH/tools.sh

source $SOURCE_PATH/cb/init.sh
alias corp="corp.sh"
