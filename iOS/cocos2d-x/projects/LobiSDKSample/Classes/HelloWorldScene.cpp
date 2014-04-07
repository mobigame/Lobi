#include "HelloWorldScene.h"
#include "LobiInterface.h"
#include "SimpleAudioEngine.h"

using namespace CocosDenshion;
USING_NS_CC;

CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    if ( !CCLayer::init() )
    {
        return false;
    }

    setTouchEnabled( true );

    CCEGLView::sharedOpenGLView()->setDesignResolutionSize(320, 568, kResolutionShowAll);
    CCSize  visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();
    CCSize  size = CCDirector::sharedDirector()->getWinSize();

    CCLabelTTF* label = CCLabelTTF::create("Lobi SDK", "Arial", 32);
    label->setPosition(ccp(origin.x + visibleSize.width/2,
                           origin.y + visibleSize.height*3/4));
    this->addChild(label, 1);
    
    CCMenuItemFont::setFontName("Arial");
    CCMenuItemFont::setFontSize(16);
    {

        CCMenuItemFont *profile = CCMenuItemFont::create("プロフィール表示", this, menu_selector(HelloWorld::presentProfileCB));
        CCMenuItemFont *chatGroup   = CCMenuItemFont::create("チャットグループ表示", this, menu_selector(HelloWorld::presentChatCB));

        CCMenu* menu = CCMenu::create(profile, chatGroup, NULL);
        menu->alignItemsHorizontallyWithPadding(20);
        menu->setPosition(ccp(size.width/2, size.height/2));
        addChild(menu, 1);
    }

    {
        CCMenuItemFont *rankingList = CCMenuItemFont::create("ランキング表示", this, menu_selector(HelloWorld::presentRankingCB));
        CCMenuItemFont *sendRanking = CCMenuItemFont::create("ランキング送信", this, menu_selector(HelloWorld::sendRankingCB));
        
        CCMenu* menu = CCMenu::create(rankingList, sendRanking, NULL);
        menu->alignItemsHorizontallyWithPadding(20);
        menu->setPosition(ccp(size.width/2, size.height/2 -50));
        addChild(menu, 1);
    }

    {
        CCMenuItemFont *recStart = CCMenuItemFont::create("録画開始", this, menu_selector(HelloWorld::recStartCB));
        CCMenuItemFont *recStop   = CCMenuItemFont::create("録画停止", this, menu_selector(HelloWorld::recStopCB));
        CCMenuItemFont *share   = CCMenuItemFont::create("動画シェア", this, menu_selector(HelloWorld::presentShareCB));
        
        CCMenu* menu = CCMenu::create(recStart, recStop, share, NULL);
        menu->alignItemsHorizontallyWithPadding(20);
        menu->setPosition(ccp(size.width/2, size.height/2 -100));
        addChild(menu, 1);
    }

    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("track.mp3", true);
    
    return true;
}


void HelloWorld::onEnter()
{
    CCLayer::onEnter();

    emitter = new CCParticleSystemQuad();
    emitter->initWithTotalParticles(100);

    emitter->setTexture(CCTextureCache::sharedTextureCache()->addImage("nuko.png"));

    emitter->setDuration(-1);
    
    // gravity
    emitter->setGravity(CCPointZero);
    
    // angle
    emitter->setAngle(90);
    emitter->setAngleVar(360);
    
    // speed of particles
    emitter->setSpeed(160);
    emitter->setSpeedVar(20);
    
    // radial
    emitter->setRadialAccel(-120);
    emitter->setRadialAccelVar(0);
    
    // tagential
    emitter->setTangentialAccel(30);
    emitter->setTangentialAccelVar(0);
    
    // emitter position
    emitter->setPosition( ccp(160,240) );
    emitter->setPosVar(CCPointZero);
    
    // life of particles
    emitter->setLife(3);
    emitter->setLifeVar(1);
    
    // spin of particles
    emitter->setStartSpin(0);
    emitter->setStartSpinVar(0);
    emitter->setEndSpin(0);
    emitter->setEndSpinVar(2000);
    
    // color of particles
    ccColor4F startColor = {0.5f, 0.5f, 0.5f, 1.0f};
    emitter->setStartColor(startColor);
    
    ccColor4F startColorVar = {0.5f, 0.5f, 0.5f, 1.0f};
    emitter->setStartColorVar(startColorVar);
    
    ccColor4F endColor = {0.1f, 0.1f, 0.1f, 0.2f};
    emitter->setEndColor(endColor);
    
    ccColor4F endColorVar = {0.1f, 0.1f, 0.1f, 0.2f};
    emitter->setEndColorVar(endColorVar);
    
    // size, in pixels
    emitter->setStartSize(100.0f);
    emitter->setStartSizeVar(00.0f);
    emitter->setEndSize(kParticleStartSizeEqualToEndSize);
    
    // emits per second
    emitter->setEmissionRate(emitter->getTotalParticles()/emitter->getLife());
    
    // additive
    emitter->setBlendAdditive(false);
    
    CCSize s = CCDirector::sharedDirector()->getWinSize();
    emitter->setPosition( ccp(s.width / 2, s.height / 2) );
  
    this->addChild(emitter, -1);
    
    scheduleUpdate();
}

void HelloWorld::ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent)
{
    ccTouchesEnded(pTouches, pEvent);
}

void HelloWorld::ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent)
{
    return ccTouchesEnded(pTouches, pEvent);
}

void HelloWorld::ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent)
{
    CCTouch *touch = (CCTouch*)pTouches->anyObject();
    CCPoint location = touch->getLocation();
    CCPoint pos = CCPointZero;
    if (emitter != NULL)
    {
        LobiInterface::wipePostion(ccpSub(location, pos).x, ccpSub(location, pos).y);
        emitter->setPosition( ccpSub(location, pos) );
    }
}

void HelloWorld::presentProfileCB(CCObject* pSender)
{
    LobiInterface::presentProfile();
}

void HelloWorld::presentChatCB(CCObject* pSender)
{
    LobiInterface::presentChat();
}

void HelloWorld::presentRankingCB(CCObject* pSender)
{
    LobiInterface::presentRanking();
}

void HelloWorld::sendRankingCB(CCObject* pSender)
{
    LobiInterface::sendRanking();
}

void HelloWorld::recStartCB(CCObject* pSender)
{
    LobiInterface::recStart();
}

void HelloWorld::recStopCB(CCObject* pSender)
{
    LobiInterface::recStop();
}

void HelloWorld::presentShareCB(CCObject* pSender)
{
    LobiInterface::presentShare();
}

