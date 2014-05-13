#include "KLRInterface.h"
#include "KLMVideoCapture.h"
#include <cocos2d.h>

using namespace cocos2d;

void KLRInterface::startCapturing(int headflag) {
    if (!KLMVideoCapture::isSupported()) {
        CCLOG("LobiRec: not supported");
        return;
    }

    if (headflag == 1) {
        CCLOG("LobiRec: enabled without mic input");
        KLMVideoCapture::setMicEnable(false);
    } else if (headflag == 2) {
        CCLOG("LobiRec: enabled with mic input");
        KLMVideoCapture::setMicEnable(true);
    } else if (headflag) {
        CCLOG("LobiRec: Camera input is not supported on Android.");
        KLMVideoCapture::setMicEnable(true);
    } else {
        CCLOG("LobiRec: disabled");
        return;
    }
    KLMVideoCapture::setCapturePerFrame(3);
    KLMVideoCapture::setMicVolume(0.7f);
    KLMVideoCapture::setGameSoundVolume(1.4f);
    KLMVideoCapture::startCapturing();
}

void KLRInterface::stopCapturing() {    
    KLMVideoCapture::stopCapturing();
}


void KLRInterface::openPostViewController() {
    CCLOG("openPostViewController");
    if (!KLMVideoCapture::isCapturing() && KLMVideoCapture::hasMovie()) {
        KLMVideoCapture::presentLobiPostWithTitle(
            "Title",
            "Description",
            100,  // score
            "Category");
    }
}
void KLRInterface::openWebViewController() {
    CCLOG("openWebViewController");
    if (!KLMVideoCapture::isCapturing()) {
        KLMVideoCapture::presentLobiPlay();
    }
}

