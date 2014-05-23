#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"

using namespace cocos2d;

class HelloWorld : public CCLayer
{
protected:
    cocos2d::CCParticleSystem *emitter;

public:

    virtual bool init();
    
    static CCScene* scene();

    void onEnter();

    void presentProfileCB(CCObject* pSender);
    void presentChatCB(CCObject* pSender);

    void presentRankingCB(CCObject* pSender);
    void sendRankingCB(CCObject* pSender);

    void recStartCB(CCObject* pSender);
    void recStopCB(CCObject* pSender);
    void presentShareCB(CCObject* pSender);

    void recPauseCB(CCObject* pSender);
    void recResumeCB(CCObject* pSender);

    void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent);
    void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent);
    void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent);

    // implement the "static node()" method manually
    CREATE_FUNC(HelloWorld);
};

#endif // __HELLOWORLD_SCENE_H__
