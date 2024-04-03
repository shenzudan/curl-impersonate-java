#!/bin/bash

# 这是上游 libcurl-impersonate 的版本
VERSION="0.6.1"
CURL_VERSION="curl-8.1.1"

# 下载和解压 curl 源代码
if [ ! -d "$CURL_VERSION" ]; then
  curl -L "https://curl.se/download/$CURL_VERSION.tar.xz" -o "$CURL_VERSION.tar.xz"
  tar -xf "$CURL_VERSION.tar.xz"
fi

# 下载和解压 curl-impersonate 补丁文件
if [ ! -d "curl-impersonate-$VERSION/chrome/patches" ]; then
  curl -L "https://github.com/yifeikong/curl-impersonate/archive/refs/tags/v$VERSION.tar.gz" -o "curl-impersonate-$VERSION.tar.gz"
  tar -xf "curl-impersonate-$VERSION.tar.gz"
fi

# 对 curl 源代码应用补丁并进行预处理
cd "$CURL_VERSION"
for p in ../curl-impersonate-$VERSION/chrome/patches/curl-*.patch; do
  patch -p1 < "$p"
done

mkdir -p ../include/curl
cp -R include/curl/* ../include/curl/

# 创建哨兵文件

cd ..
