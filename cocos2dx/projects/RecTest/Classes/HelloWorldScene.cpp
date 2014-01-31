#include "HelloWorldScene.h"
#include "KLRInterface.h"

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

    CCSize  visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();
    CCSize  size = CCDirector::sharedDirector()->getWinSize();

    CCLabelTTF* label = CCLabelTTF::create("Lobi Rec SDK", "Arial", 54);

    // add the label as a child to this layer
    this->addChild(label, 1);

    label->setPosition(ccp(origin.x + visibleSize.width/2,
                            origin.y + visibleSize.height - label->getContentSize().height));

    {
        CCMenuItemFont *record = CCMenuItemFont::create("Record", this, menu_selector(HelloWorld::recStartCallback));
        CCMenuItemFont *stop   = CCMenuItemFont::create("Stop", this, menu_selector(HelloWorld::recStopCallback));
        CCMenuItemFont *share  = CCMenuItemFont::create("Share", this, menu_selector(HelloWorld::openShareViewCallback));
        CCMenuItemFont *web    = CCMenuItemFont::create("Web", this, menu_selector(HelloWorld::openWebViewCallback));

        record->setFontSizeObj(48);
        record->setFontName("Arial");
        stop->setFontSizeObj(48);
        stop->setFontName("Arial");
        share->setFontSizeObj(48);
        share->setFontName("Arial");
        web->setFontSizeObj(48);
        web->setFontName("Arial");

        CCMenu* menu = CCMenu::create(record, stop, share, web, NULL);
        menu->alignItemsHorizontallyWithPadding(20);
        menu->setPosition(ccp(size.width/2, size.height/2 -50));
        
        addChild(menu, 1);
    }

    {
        CCMenuItemFont *reset = CCMenuItemFont::create("Reset Account", this, menu_selector(HelloWorld::resetAccountCallback));
        reset->setFontSizeObj(32);
        reset->setFontName("Arial");
        CCMenu* menu = CCMenu::create(reset, NULL);
        menu->setPosition(ccp(size.width -200, 40));
        addChild(menu, 1);
    }

    return true;
}


void HelloWorld::onEnter()
{
    CCLayer::onEnter();

    emitter = new CCParticleSystemQuad();
    emitter->initWithTotalParticles(300);

    emitter->setTexture(CCTextureCache::sharedTextureCache()->addImage("star.png"));

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
    emitter->setStartSize(30.0f);
    emitter->setStartSizeVar(00.0f);
    emitter->setEndSize(kParticleStartSizeEqualToEndSize);
    
    // emits per second
    emitter->setEmissionRate(emitter->getTotalParticles()/emitter->getLife());
    
    // additive
    emitter->setBlendAdditive(false);
    
    CCSize s = CCDirector::sharedDirector()->getWinSize();
    emitter->setPosition( ccp(s.width / 2, s.height / 2) );
  
    this->addChild(emitter);
    
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
        emitter->setPosition( ccpSub(location, pos) );
    }
}

void HelloWorld::recStartCallback(CCObject* pSender)
{
    KLRInterface::startCapturing();
}

void HelloWorld::recStopCallback(CCObject* pSender)
{
    KLRInterface::stopCapturing();
}

void HelloWorld::openWebViewCallback(CCObject* pSender)
{
    KLRInterface::openWebViewController();
}

void HelloWorld::openShareViewCallback(CCObject* pSender)
{
    KLRInterface::openPostViewController();
}

void HelloWorld::resetAccountCallback(CCObject* pSender)
{
    KLRInterface::resetAccount();
}
