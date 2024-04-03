package com.stanwind;

import java.net.MalformedURLException;

/**
 * ${NAME} ${description}
 *
 * @author : stan
 * @version : 1.0
 * @date :  2024/4/3 11:09
 **/
public class Main {
    public static void main(String[] args) throws MalformedURLException {
        CurlWrapper curl = new CurlWrapper();
        String s = curl.curlVersion();
        System.out.println(s);
    }
}
