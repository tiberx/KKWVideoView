//
//  xukangwenViewController.m
//  VideoByVitiomDemo
//
//  Created by zhengyu xu on 14-6-19.
//  Copyright (c) 2014年 smg. All rights reserved.
//

#import "xukangwenViewController.h"

@interface xukangwenViewController ()

@end

@implementation xukangwenViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    _isFullScreen=false;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UILabel *titleTxt=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 280, 20)];
    
    titleTxt.text=@"Vitamio的播放器封装库";
    
    [self.view addSubview:titleTxt];
    
    [titleTxt release];
    
    /**
     全屏按钮，目前只能竖着放大，还不能横过来。有时候会出错。
     如果有朋友能解决，该问题。欢迎给我邮件：10040142@qq.com
     给予我指点。
     
     
     */
    
    
    KKWVideoView *videoView=[[KKWVideoView alloc]initWithFrame:CGRectMake(0, 50, 320, 220) WithPlayUrl:@"http://domhttp.kksmg.com/2013/07/11/h264_450k_mp4_71d92023b58d6d8b3ae58829eedfc9b0_ncd.mp4" withTitle:@"  " withBgImg:nil withShu:false withCache:false];
    
    videoView.delegate=self;
    
    [self.view addSubview:videoView];
    
    [videoView release];
     
}

#pragma mark - KKWVideoViewDelegate 

- (void)showFullScreen:(KKWVideoView*)VideoView withIsFullSceen:(bool)IsFullSceen{
//通过该代理，实现横向全屏幕的界面重新绘制，初始化withShu 设置为False有效果
    
    _isFullScreen=IsFullSceen;

    if(IsFullSceen){
    
        NSLog(@"FullScreen");
        
        
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            
            [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:(id)UIInterfaceOrientationLandscapeRight];
            
        }
        
        [UIViewController attemptRotationToDeviceOrientation];//这行代码是关键
        
        UIApplication *application=[UIApplication sharedApplication];
        [application setStatusBarHidden:YES];

    
    }else{
    
       NSLog(@"Screen");
        
         [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(id)UIInterfaceOrientationPortrait];
        
        UIApplication *application=[UIApplication sharedApplication];
        [application setStatusBarHidden:YES];

    
    }


}

#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc{

    [super dealloc];

}


#pragma mark - UIInterfaceOrientation
//旋转相关
//旋转相关
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{//IOS 6.0之前版本
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return NO;
    
}

-(BOOL)shouldAutorotate{
    //IOS 6 关闭
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    //IOS 6 方向
    
    if(_isFullScreen){
        
    return UIInterfaceOrientationMaskLandscapeRight;
        
    }else{
     return  UIInterfaceOrientationMaskPortrait;

    }
}



@end
