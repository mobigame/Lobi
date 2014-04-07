//
//  RRViewController.m
//  GLKitTest
//
//  Created by takahashi-kohei on 2014/01/25.
//  Copyright (c) 2014年 RaftRiders Inc. All rights reserved.
//

#import "RRViewController.h"
#import <LobiCore/LobiCore.h>
#import <LobiRec/LobiRec.h>
#import <LobiRanking/LobiRanking.h>
#import <LobiChat/LobiChat.h>

#define BUFFER_OFFSET(i) ((char *)NULL + (i))

// Uniform index.
enum
{
    UNIFORM_MODELVIEWPROJECTION_MATRIX,
    UNIFORM_NORMAL_MATRIX,
    NUM_UNIFORMS
};
GLint uniforms[NUM_UNIFORMS];

// Attribute index.
enum
{
    ATTRIB_VERTEX,
    ATTRIB_NORMAL,
    NUM_ATTRIBUTES
};

GLfloat gCubeVertexData[216] = 
{
    // Data layout for each line below is:
    // positionX, positionY, positionZ,     normalX, normalY, normalZ,
    0.5f, -0.5f, -0.5f,        1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, -0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, -0.5f,          1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, 0.5f,         1.0f, 0.0f, 0.0f,
    
    0.5f, 0.5f, -0.5f,         0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 1.0f, 0.0f,
    0.5f, 0.5f, 0.5f,          0.0f, 1.0f, 0.0f,
    0.5f, 0.5f, 0.5f,          0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 1.0f, 0.0f,
    
    -0.5f, 0.5f, -0.5f,        -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, -0.5f,       -1.0f, 0.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         -1.0f, 0.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, -0.5f,       -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        -1.0f, 0.0f, 0.0f,
    
    -0.5f, -0.5f, -0.5f,       0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, -0.5f,        0.0f, -1.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, -1.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, -0.5f,        0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         0.0f, -1.0f, 0.0f,
    
    0.5f, 0.5f, 0.5f,          0.0f, 0.0f, 1.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    0.5f, -0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    0.5f, -0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, 0.0f, 1.0f,
    
    0.5f, -0.5f, -0.5f,        0.0f, 0.0f, -1.0f,
    -0.5f, -0.5f, -0.5f,       0.0f, 0.0f, -1.0f,
    0.5f, 0.5f, -0.5f,         0.0f, 0.0f, -1.0f,
    0.5f, 0.5f, -0.5f,         0.0f, 0.0f, -1.0f,
    -0.5f, -0.5f, -0.5f,       0.0f, 0.0f, -1.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 0.0f, -1.0f
};

@interface RRViewController () {
    GLuint _program;
    
    GLKMatrix4 _modelViewProjectionMatrix;
    GLKMatrix3 _normalMatrix;
    float _rotation;
    
    GLuint _vertexArray;
    GLuint _vertexBuffer;
    
    GLint _frameBuffer;
}
@property (strong, nonatomic) EAGLContext *context;
@property (strong, nonatomic) GLKBaseEffect *effect;

- (void)setupGL;
- (void)tearDownGL;

@end

@implementation RRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;

    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){0, 240, 160, 44};
        [button setTitle:@"プロフィール表示" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentProfile) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){160, 240, 160, 44};
        [button setTitle:@"チャットグループ表示" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentChat) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){0, 290, 160, 44};
        [button setTitle:@"ランキング表示" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentRanking) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){160, 290, 160, 44};
        [button setTitle:@"ランキング送信" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(sendRanking) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){0, 340, 106, 44};
        [button setTitle:@"録画開始" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(startCapture) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){106, 340, 106, 44};
        [button setTitle:@"録画終了" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(stopCapture) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = (CGRect){212, 340, 106, 44};
        [button setTitle:@"動画シェア" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(showPostViewController) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    [self setupGL];

    [LobiRec setCurrentContext:self.context withGLView:self.view];
    [LobiCore setRootViewController:self];
}


- (void)dealloc
{    
    [self tearDownGL];

    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    if ([self isViewLoaded] && ([[self view] window] == nil)) {
        self.view = nil;
        
        [self tearDownGL];
        
        if ([EAGLContext currentContext] == self.context) {
            [EAGLContext setCurrentContext:nil];
        }
        self.context = nil;
    }

    // Dispose of any resources that can be recreated.
}

- (void)setupGL
{
    [EAGLContext setCurrentContext:self.context];
    
    self.effect = [[GLKBaseEffect alloc] init];
    self.effect.light0.enabled = GL_TRUE;
    self.effect.light0.diffuseColor = GLKVector4Make(1.0f, 0.4f, 0.4f, 1.0f);
    
    glEnable(GL_DEPTH_TEST);
    
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(gCubeVertexData), gCubeVertexData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 24, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribNormal);
    glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE, 24, BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
    
    glDeleteBuffers(1, &_vertexBuffer);
    glDeleteVertexArraysOES(1, &_vertexArray);
    
    self.effect = nil;
    
    if (_program) {
        glDeleteProgram(_program);
        _program = 0;
    }
}

#pragma mark - GLKView and GLKViewController delegate methods
- (void)update
{
    float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    
    self.effect.transform.projectionMatrix = projectionMatrix;
    
    GLKMatrix4 baseModelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, -4.0f);
    baseModelViewMatrix = GLKMatrix4Rotate(baseModelViewMatrix, _rotation, 0.0f, 1.0f, 0.0f);
    
    // Compute the model view matrix for the object rendered with GLKit
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, -1.5f);
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, _rotation, 1.0f, 1.0f, 1.0f);
    modelViewMatrix = GLKMatrix4Multiply(baseModelViewMatrix, modelViewMatrix);
    
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    
    // Compute the model view matrix for the object rendered with ES2
    modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, 1.5f);
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, _rotation, 1.0f, 1.0f, 1.0f);
    modelViewMatrix = GLKMatrix4Multiply(baseModelViewMatrix, modelViewMatrix);
    
    _normalMatrix = GLKMatrix3InvertAndTranspose(GLKMatrix4GetMatrix3(modelViewMatrix), NULL);
    
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
    
    _rotation += self.timeSinceLastUpdate * 0.5f;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    if (_frameBuffer == 0) {
        glGetIntegerv(GL_FRAMEBUFFER_BINDING, &_frameBuffer);
        [LobiRec createFramebuffer:_frameBuffer];
    }
    
    [LobiRec prepareFrame];
    
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glBindVertexArrayOES(_vertexArray);

    // Render the object with GLKit
    [self.effect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLES, 0, 36);
    
    [LobiRec appendFrame:_frameBuffer];
}

- (void)startCapture
{
    static int const offset   = 20;
    static int const wipesize = 100;
    
    // ゲームに自撮りワイプを表示します。
    [LobiRec sharedInstance].liveWipeStatus = KLVWipeStatusInCamera;
    // ワイプのサイズを指定します。
    [LobiRec sharedInstance].wipeSquareSize  = wipesize;
    
    // ワイプのX座標を指定します。
    [LobiRec sharedInstance].wipePositionX   = offset;
    
    // ワイプのX座標を指定します。
    [LobiRec sharedInstance].wipePositionY   = offset;
    
    // 実況録音にマイク仕様を許可します。
    [LobiRec sharedInstance].micEnable       = YES;

    // 実況録音のマイクボリュームを指定します。
    [LobiRec sharedInstance].micVolume       = 1;
    
    // 実況録音のゲームボリュームを指定します。
    [LobiRec sharedInstance].gameSoundVolume = 1;
    
    // ゲーム画面のワイプを非表示にする場合、YESを指定します。
    [LobiRec sharedInstance].hideFaceOnPreview = NO;
    
    // ゲーム録画にモザイクを掛ける場合 YESを指定します。
    [LobiRec sharedInstance].preventSpoiler    = NO;

    // フレームのキャプチャ単位を設定します。
    [LobiRec sharedInstance].capturePerFrame   = 1;
    
    // 録画開始します。
    [LobiRec startCapturing];
}

- (void)stopCapture
{
    [LobiRec stopCapturing];
}

- (void)showPostViewController
{
    if (![LobiRec sharedInstance].isCapturing && [LobiRec hasMovie])
    {
        // プレイ動画シェア画面の表示
        [LobiRec presentLobiPostWithTitle:@"プレイ動画をシェアします！"
                           postDescrition:@"神懸ったこの華麗なプレイ。やばい。"
                                postScore:100
                             postCategory:nil
                           prepareHandler:^{

                           } afterHandler:^{
                               
                           }];
    }
}


- (void)presentProfile
{
    [LobiCore presentProfile];
}

- (void)presentChat
{
    [LobiChat presentGroupList];
}

- (void)presentRanking
{
    [LobiRanking presentRanking];
}

- (void)sendRanking
{
    int score1 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive01" score:score1 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score2 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive02" score:score2 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score3 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive03" score:score3 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score4 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive04" score:score4 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    
    NSString *message = [NSString stringWithFormat:@"devmassive01 : %d点とった！\ndevmassive02 : %d点とった！\ndevmassive03 : %d点とった！\ndevmassive04 : %d点とった！", score1, score2, score3, score4];
    
    [[[UIAlertView alloc] initWithTitle:nil
                                message:message
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

@end
