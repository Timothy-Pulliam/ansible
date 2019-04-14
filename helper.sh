#!/bin/bash

clean() {
  find ./ -name *.retry -exec rm -f {} +;
}

case "$1" in
  clean )
    clean
    ;;
  * )
    echo "Usage: $0 {clean}"
    exit 1
    ;;
esac
