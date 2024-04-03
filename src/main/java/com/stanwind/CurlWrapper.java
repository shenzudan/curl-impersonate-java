package com.stanwind;

import java.io.File;
import java.net.URL;

/**
 * CurlWrapper
 *
 * @author : stan
 * @version : 1.0
 * @date :  2024/4/3 12:25
 **/
public class CurlWrapper {
    public static final String LIB_PATH = "libcurl-impersonate";
    public static final String LIB_NAME = "libcurl-impersonate-chrome";
    public static final String LIB_WRAPPER_NAME = "libcurlwrapper";

    static {
        // 根据操作系统加载相应的动态库
        String os = System.getProperty("os.name").toLowerCase();
        String libSuffix;

        if (os.contains("win")) {
            libSuffix = ".dll";
        } else if (os.contains("mac")) {
            libSuffix = ".dylib";
        } else {
            libSuffix = ".so";
        }

        // 获取当前类的类加载器
        ClassLoader classLoader = CurlWrapper.class.getClassLoader();
        // 获取类路径的根路径
        String resource = classLoader.getResource(LIB_PATH).getPath();
        System.out.println(resource);
        System.load(resource + File.separator + LIB_NAME + libSuffix);
        System.load(resource +File.separator+ LIB_WRAPPER_NAME + libSuffix);
        System.out.println("load curl-impersonate successfully!");
    }

    public native String curlVersion();
}
