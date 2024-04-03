# curl-impersonate-java

### Java binding for curl-impersonate
模仿浏览器tls/ja3/http2 指纹识别


### 思路
- 下到最新https://github.com/lwthiker/curl-impersonate
- 根据curl_cffi的makefile先把新的curl.h弄到本地
- CurlWrapper作为实现类, curl_wrapper.c作为桥调用curl-impersonate的函数

