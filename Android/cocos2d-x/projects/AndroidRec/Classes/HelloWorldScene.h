#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"

USING_NS_CC;

class HelloWorld : public cocos2d::CCLayer
{
protected:
    cocos2d::CCParticleSystem *emitter;

public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();
    
    void onEnter();

    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    
    void recStartCB(CCObject* pSender);
    void recStopCB(CCObject* pSender);
    void presentShareCB(CCObject* pSender);

    void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent);
    void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent);
    void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent);

    // implement the "static node()" method manually
    CREATE_FUNC(HelloWorld);
};

#endif // __HELLOWORLD_SCENE_H__
