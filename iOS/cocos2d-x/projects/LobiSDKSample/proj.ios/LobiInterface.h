//
//  LobiInterface.h
//  RecTest
//
//  Created by takahashi-kohei on 2014/01/28.
//
//

#ifndef __cocos2dx__KLMCaptureInterface__
#define __cocos2dx__KLMCaptureInterface__

namespace LobiInterface
{
    void presentProfile();
    void presentChat();
    
    void presentRanking();
    void sendRanking();
    
    void recStart();
    void recStop();
    bool isRecording();
    void recPause();
    void recResume();
    bool isPause();

    void presentShare();
    void wipePostion(float x, float y);
}

#endif
