#!/bin/bash
# 定义JNI头文件路径
JNI_INCLUDE="-I$JAVA_HOME/include"

# 根据操作系统设置动态库后缀和附加编译参数
case "$(uname -s)" in
    Linux*)
        JNI_INCLUDE+=" -I$JAVA_HOME/include/linux"
        LIB_SUFFIX=".so"
        ;;
    Darwin*)
        JNI_INCLUDE+=" -I$JAVA_HOME/include/darwin"
        LIB_SUFFIX=".dylib"
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        JNI_INCLUDE+=" -I$JAVA_HOME/include/win32"
        LIB_SUFFIX=".dll"
        ;;
    *)
        echo "Unsupported OS $(uname -s)"
        exit 1
        ;;
esac

gcc $JNI_INCLUDE -o libcurlwrapper$LIB_SUFFIX -shared -fPIC *.c -lcurl

gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/$(uname -s)" -o libcurlwrapper.so -shared -fPIC com_stanwind_CurlWrapper.c -lcurl

#mv libcurlwrapper.so ../libs/
mv libcurlwrapper.* ../libs/libcurl-impersonate/
