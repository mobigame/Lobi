#ifndef __KLM_VIDEO_CAPTURE__
#define __KLM_VIDEO_CAPTURE__


class KLMVideoCapture {
public:
    static void startCapturing();
    static void stopCapturing();
    static void setLiveWipeStatus(int status);
    static void setWipeSquareSize(int wipeSize);
    static void setWipePosition(int x, int y);
    static void setMicEnable(bool enabled);
    static void setMicVolume(double volume);
    static void setGameSoundVolume(double volume);
    static void setHideFaceOnPreview(bool hidden);
    static void setPreventSpoiler(bool enabled);
    static void setCapturePerFrame(int frames);
    static bool hasMovie();
    static bool isSupported();
    static bool isCapturing();
    static void presentLobiPostWithTitle(
        const char* title,
        const char* postDescription,
        const long postScore,
        const char* postCategory);
    static void presentLobiPlay();
};


#endif // __KLM_VIDEO_CAPTURE__
