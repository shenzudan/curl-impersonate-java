#!/bin/bash
# 这是上游 libcurl-impersonate 的版本
VERSION="0.6.1"
BASE_URL="https://github.com/lwthiker/curl-impersonate/releases/download/v$VERSION"
LINKER_NAME="libcurl-impersonate"
PACKAGE_NAME="$LINKER_NAME-v$VERSION"
# 获取当前系统的架构信息

if [ ! -d PACKAGE_NAME ]; then
  arch=$(uname -m)
  # 根据架构选择对应的文件名
  case $arch in
    aarch64)
      filename="$PACKAGE_NAME.aarch64-linux-gnu.tar.gz"
      ;;
    armv7l)
      filename="$PACKAGE_NAME.arm-linux-gnueabihf.tar.gz"
      ;;
    x86_64)
      if [[ "$(uname -s)" == "Darwin" ]]; then
        filename="$PACKAGE_NAME.x86_64-macos.tar.gz"
      else
        filename="$PACKAGE_NAME.x86_64-linux-gnu.tar.gz"
      fi
      ;;
    *)
      echo "Unsupported architecture: $arch"
      exit 1
      ;;
  esac

  curl -L "$BASE_URL/$filename" -o $filename
  echo $PACKAGE_NAME
  mkdir -p "$PACKAGE_NAME"
  if tar -xf "$filename" -C "$PACKAGE_NAME"; then
    echo "Successfully extracted $filename to $PACKAGE_NAME"
  else
    rm -rf $PACKAGE_NAME
    echo "Failed to extract $filename"
    exit 1
  fi
  rm -rf "$filename"
  ln -sf "$PACKAGE_NAME" "$LINKER_NAME";
fi



