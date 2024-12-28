SOURCE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)

echo $SOURCE_PATH/cb/init.sh
source $SOURCE_PATH/cb/init.sh
alias corp="corp.sh"
