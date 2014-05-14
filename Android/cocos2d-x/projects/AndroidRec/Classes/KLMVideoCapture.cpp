#include "KLMVideoCapture.h"
#include <jni.h>
#include <cocos2d.h>
#include <platform/android/jni/JniHelper.h>

#define CLASS_NAME "com/kayac/lobi/rec/cocos2dx/LobiRecCocos2dx"

#define CALL_STATIC_VOID_METHOD(methodName,signature,...)     \
    JniMethodInfo t; \
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, methodName, signature)) { \
        t.env->CallStaticVoidMethod(t.classID, t.methodID, __VA_ARGS__); \
        t.env->DeleteLocalRef(t.classID); \
    }


using namespace cocos2d;

void KLMVideoCapture::startCapturing() {
    CALL_STATIC_VOID_METHOD("startRecording", "()V", NULL);
}
void KLMVideoCapture::stopCapturing() {
    CALL_STATIC_VOID_METHOD("stopRecording", "()V", NULL);
}
void KLMVideoCapture::setLiveWipeStatus(int status) {
    CALL_STATIC_VOID_METHOD("setLiveWipeStatus", "(I)V", status);
}
void KLMVideoCapture::setWipeSquareSize(int wipeSize) {
    CALL_STATIC_VOID_METHOD("setWipeSquareSize", "(I)V", wipeSize);
}
void KLMVideoCapture::setWipePosition(int x, int y) {
    CALL_STATIC_VOID_METHOD("setWipePosition", "(II)V", x, y);
}
void KLMVideoCapture::setMicEnable(bool enabled) {
    CALL_STATIC_VOID_METHOD("setMicEnable", "(Z)V", enabled);
}
void KLMVideoCapture::setMicVolume(double volume) {
    CALL_STATIC_VOID_METHOD("setMicVolume", "(D)V", volume);
}
void KLMVideoCapture::setGameSoundVolume(double volume) {
    CALL_STATIC_VOID_METHOD("setGameSoundVolume", "(D)V", volume);
}
void KLMVideoCapture::setHideFaceOnPreview(bool hidden) {
    CALL_STATIC_VOID_METHOD("setHideFaceOnPreview", "(Z)V", hidden);
}
void KLMVideoCapture::setPreventSpoiler(bool enabled) {
    CALL_STATIC_VOID_METHOD("setPreventSpoiler", "(Z)V", enabled);
}
void KLMVideoCapture::setCapturePerFrame(int frames) {
    CALL_STATIC_VOID_METHOD("setCapturePerFrame", "(I)V", frames);
}
bool KLMVideoCapture::hasMovie() {
    bool ret = false;
    JniMethodInfo t;
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "hasMovie", "()Z")) {
        ret = t.env->CallStaticBooleanMethod(t.classID, t.methodID, NULL);
        t.env->DeleteLocalRef(t.classID);
    }
    return ret;
}
bool KLMVideoCapture::isSupported() {
    bool ret = false;
    JniMethodInfo t;
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "isSupported", "()Z")) {
        ret = t.env->CallStaticBooleanMethod(t.classID, t.methodID, NULL);
        t.env->DeleteLocalRef(t.classID);
    }
    return ret;
}
bool KLMVideoCapture::isCapturing() {
    bool ret = false;
    JniMethodInfo t;
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "isCapturing", "()Z")) {
        ret = t.env->CallStaticBooleanMethod(t.classID, t.methodID, NULL);
        t.env->DeleteLocalRef(t.classID);
    }
    return ret;
}
void KLMVideoCapture::presentLobiPostWithTitle(
    const char* title,
    const char* postDescription,
    const long postScore,
    const char* postCategory
) {
    JniMethodInfo t;
    if (JniHelper::getStaticMethodInfo(
            t, CLASS_NAME, "openPostVideoActivity",
            "("
            "Ljava/lang/String;"
            "Ljava/lang/String;"
            "J"
            "Ljava/lang/String;"
            ")Z"
            )) {

        jstring jtitle = t.env->NewStringUTF(title);
        jstring jpostDescription = t.env->NewStringUTF(postDescription);
        jstring jpostCategory = t.env->NewStringUTF(postCategory);

        t.env->CallStaticBooleanMethod(
            t.classID, t.methodID, 
            jtitle,
            jpostDescription,
            postScore,
            jpostCategory,
            0,
            0);
        
        t.env->DeleteLocalRef(jtitle);
        t.env->DeleteLocalRef(jpostDescription);
        t.env->DeleteLocalRef(jpostCategory);
        
        t.env->DeleteLocalRef(t.classID);
    } else {
        CCLOG("failed to find method named openPostVideoActivity");
    }
}
void KLMVideoCapture::presentLobiPlay() {
    JniMethodInfo t;
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "openLobiPlayActivity", "()Z")) {
        t.env->CallStaticBooleanMethod(t.classID, t.methodID, NULL);
        t.env->DeleteLocalRef(t.classID);
    }
}
