#!/bin/bash

HTTP_PROXY="http://aproxy.corproot.net:8080/"
HTTPS_PROXY="http://aproxy.corproot.net:8080/"
NO_PROXY="localhost,127.0.0.1/32,**.swisscom.com,.swisscom.ch,.corproot.net,.sharedtcs.net,*.docker.internal,172.17.178.5"

_usage() {
    cat <<EOF
Usage: corp [OPTIONS] [COMMAND]

Corprate commands.

Options:
  -h, --help           Show this help message and exit.

Commands:
  ap                   Enable proxy settings.
  dp                   Disable proxy settings.
EOF
}

_ap() {
    # System
    export http_proxy="$HTTP_PROXY"
    export https_proxy="$HTTPS_PROXY"
    export no_proxy="$NO_PROXY"

    # Git
    git config --global http.proxy "$HTTP_PROXY"
    git config --global https.proxy "$HTTPS_PROXY"
    git config --global http.noProxy "$NO_PROXY"


    echo "Proxy enabled:"
    echo "  HTTP Proxy: $http_proxy"
    echo "  HTTPS Proxy: $https_proxy"
    echo "  No Proxy: $no_proxy"
}

_dp() {
    # System
    unset http_proxy https_proxy no_proxy

    # Git
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset http.noProxy
    echo "Proxy disabled."
}

main() {
    if [ $# -eq 0 ]
    then
        _usage
        exit 1
    fi

    case "$1" in
        -h|--help) _usage; exit 0 ;;
        ap) _ap ;;
        dp) _dp ;;
        *) echo "Error: Unknown command '$1'"; _usage; exit 1 ;;
    esac
}

main "$@"
