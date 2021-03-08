//
//  ViewController.m
//  openGLESLearn
//
//  Created by Fei Yuan on 2021/3/8.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>


@interface ViewController ()<GLKViewDelegate>

@property(nonatomic, strong)EAGLContext * mContext;

/*GLKBaseEffect类提供的着色器模仿OpenGL ES 1.1照明和着色模型提供的许多行为，包括材质，光照和纹理。基本效果允许将最多三个灯光和两个纹理应用于场景
 */
@property (nonatomic , strong) GLKBaseEffect * mEffect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    [self uploadVertexArray];
    [self uploadTexture];
    
}

-(void)setupConfig {
    //新建OpenGLES 上下文
    self.mContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    GLKView * view = (GLKView *)self.view;
    view.context = self.mContext;
    view.delegate = self;
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;  //颜色缓冲区格式
    [EAGLContext setCurrentContext:self.mContext];
}

-(void)uploadVertexArray {
    //顶点数据，前三个是顶点坐标（x、y、z轴），后面两个是纹理坐标（x，y）
    GLfloat vertexData[] =
    {
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        0.5, 0.5, -0.0f,    1.0f, 1.0f, //右上
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        -0.5, -0.5, 0.0f,   0.0f, 0.0f, //左下
    };
    
    /*
    glGenBuffers()函数仅仅是生成一个缓冲对象的名称，这个缓冲对象并不具备任何意义，它仅仅是个缓冲对象，还不是一个顶点数组缓冲，它类似于C语言中的一个指针变量，我们可以分配内存对象并且用它的名称来引用这个内存对象。OpenGL有很多缓冲对象类型，那么这个缓冲对象到底是什么类型，就要用到下面的glBindBuffer()函数了
     OpenGL允许我们同时绑定多个缓冲类型，只要这些缓冲类型是不同的，换句话说，同一时间，不能绑定两个相同类型的缓冲对象。也可以理解为对于一个类型来说，同一时间只能“激活”一个类型，否则就会发生“矛盾”。
     创建对象，绑定类型，填充数据。
     */
    GLuint buffer;
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertexData), vertexData, GL_STATIC_DRAW);
    
    /*
    默认情况下，出于性能考虑，所有顶点着色器的属性（Attribute）变量都是关闭的，意味着数据在着色器端是不可见的，哪怕数据已经上传到GPU，由glEnableVertexAttribArray启用指定属性，才可在顶点着色器中访问逐顶点的属性数据。glVertexAttribPointer或VBO只是建立CPU和GPU之间的逻辑连接，从而实现了CPU数据上传至GPU。但是，数据在GPU端是否可见，即，着色器能否读取到数据，由是否启用了对应的属性决定，这就是glEnableVertexAttribArray的功能，允许顶点着色器读取GPU（服务器端）数据
     */
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 0);
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0); //纹理
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 3);
}

-(void)uploadTexture {
    //纹理贴图
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"];
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:@(1), GLKTextureLoaderOriginBottomLeft, nil];//GLKTextureLoaderOriginBottomLeft 纹理坐标系是相反的
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:filePath options:options error:nil];
    //着色器
    self.mEffect = [[GLKBaseEffect alloc] init];
    self.mEffect.texture2d0.enabled = GL_TRUE;
    self.mEffect.texture2d0.name = textureInfo.name;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.3f, 0.6f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    //启动着色器
    [self.mEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
