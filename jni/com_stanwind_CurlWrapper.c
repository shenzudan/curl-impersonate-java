#include <jni.h>
#include "include/curl/curl.h"
#include "com_stanwind_CurlWrapper.h"

JNIEXPORT jstring JNICALL Java_com_stanwind_CurlWrapper_curlVersion
  (JNIEnv *env, jobject) {
   const char *version = curl_version();
   return (*env)->NewStringUTF(env, version);
}
