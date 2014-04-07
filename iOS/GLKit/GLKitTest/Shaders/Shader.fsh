//
//  Shader.fsh
//  GLKitTest
//
//  Created by takahashi-kohei on 2014/01/25.
//  Copyright (c) 2014年 RaftRiders Inc. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
