//
//  KKWVideoView.m
//  VideoByVitiomDemo
//
//  Created by zhengyu xu on 14-6-19.
//  Copyright (c) 2014年 smg. All rights reserved.
//

#import "KKWVideoView.h"

@implementation KKWVideoView
@synthesize mMPayer;
@synthesize playBtn;
@synthesize progressSld;
@synthesize activityView;
@synthesize mediaUrl;
@synthesize titleBtl;
@synthesize mediaTitle;
@synthesize videoURL;
@synthesize bgImgView;
@synthesize bottomView;
@synthesize topView;
@synthesize _playButton;
@synthesize leftTime;
@synthesize Vslider;

@synthesize movieBackgroundImageView;

@synthesize rightTime;

@synthesize _screenButton;

@synthesize _volumnButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.mediaUrl=nil;
        
        self.mediaTitle=nil;
        
         progressDragging=NO;
        
        isOnlyShupin=true;
        
        isShowHuncun=true;
    }
    return self;
}

-(void)dealloc{

    [super dealloc];
    
    
    [mMPayer unSetupPlayer];
    
    
    [self.bgImgView release];
    
    
    [titleBtl release];
    
    

}



-(void)PlayBtnAction:(id)sender{
    
    UIButton *clicked = (UIButton *) sender;
    
    [clicked setShowsTouchWhenHighlighted:YES];
    
    
    [clicked setHidden:TRUE];
    
    
    [mMPayer setDataSource:self.videoURL];
    
    [mMPayer prepareAsync];
    
    
   [self startActivityWithMsg:@"Loading..."];
    
   
    
}


-(void)drawBottomViewOrigion3{
    
    self.frame=oldframe;
    
    self.backgroundColor=[UIColor clearColor];
    
    bottomView.frame=CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38);
    
    movieBackgroundImageView.frame=CGRectMake(0, 0,self.frame.size.width, 38);
    
    _playButton.frame = CGRectMake(1, 2,36, 30);
    
    leftTime.frame=CGRectMake(38,2,50, 34);
    
    progressSld.frame=CGRectMake(90, 2, self.frame.size.width-200, 34);
    
    rightTime.frame=CGRectMake(90+(self.frame.size.width-200), 2,40, 34);
    
    _screenButton.frame = CGRectMake(90+(self.frame.size.width-200)+40, 2,36, 30);
    
    _volumnButton.frame = CGRectMake(90+(self.frame.size.width-200)+40+35, 2,36, 30);
    
    Vslider.frame = oldframe2;

    
    titleBtl.frame=CGRectMake(0, 0, self.frame.size.width, 30);
    
    
}


-(void)drawBottomViewFullScreen2{
    
    
    if([[UIScreen mainScreen] bounds].size.height == 568){
        
        self.frame=CGRectMake(0, 0,568, 320);
        
        self.backgroundColor=[UIColor blackColor];
        
        
        bottomView.frame=CGRectMake(0, 320-38,568, 38);
        
        
        
        
        movieBackgroundImageView.frame=CGRectMake(0, 0,self.frame.size.width, 38);
        
        _playButton.frame = CGRectMake(1, 2,36, 30);
        
        leftTime.frame=CGRectMake(38,2,50, 34);
        
        progressSld.frame=CGRectMake(90, 2, self.frame.size.width-200, 34);
        
        rightTime.frame=CGRectMake(90+(self.frame.size.width-200), 2,40, 34);
        
        _screenButton.frame = CGRectMake(90+(self.frame.size.width-200)+40, 2,36, 30);
        
        _volumnButton.frame = CGRectMake(90+(self.frame.size.width-200)+40+35, 2,36, 30);
        
        
        
        
          Vslider.frame =CGRectMake(530, 70, 34, 210);
        

        
        titleBtl.frame=CGRectMake(0, 0, self.frame.size.width, 60);


        
        
    }else{
    
        self.frame=CGRectMake(0, 0,568-88, 320);
        
        self.backgroundColor=[UIColor blackColor];
        
        
        bottomView.frame=CGRectMake(0, 320-38,568-88, 38);
        
        
        
        movieBackgroundImageView.frame=CGRectMake(0, 0,self.frame.size.width, 38);
        
        _playButton.frame = CGRectMake(1, 2,36, 30);
        
        leftTime.frame=CGRectMake(38,2,50, 34);
        
        progressSld.frame=CGRectMake(90, 2, self.frame.size.width-200, 34);
        
        rightTime.frame=CGRectMake(90+(self.frame.size.width-200), 2,40, 34);
        
        _screenButton.frame = CGRectMake(90+(self.frame.size.width-200)+40, 2,36, 30);
        
        _volumnButton.frame = CGRectMake(90+(self.frame.size.width-200)+40+35, 2,36, 30);
        
           Vslider.frame =CGRectMake(530-88, 70, 34, 210);

        
        titleBtl.frame=CGRectMake(0, 0, self.frame.size.width, 60);



    
    
    }
    
    


}



-(void)drawBottomViewFullScreen{
    
    
    
   //  self.transform= CGAffineTransformMakeRotation(M_PI / 2);
    
    // Vslider.transform = CGAffineTransformMakeRotation(M_PI / 2);
    
    
    if([[UIScreen mainScreen] bounds].size.height == 568){
        
        self.frame=CGRectMake(0, 0,320, 568);
        
        self.backgroundColor=[UIColor blackColor];
        
        
        bottomView.frame=CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38);
        
        
        Vslider.frame = CGRectMake(270, 50,34, 450);
        
        
   }else{
       
       self.frame=CGRectMake(0, 0,320, 568-88);
       
        self.backgroundColor=[UIColor blackColor];
       
       
       bottomView.frame=CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38);
       
       
      Vslider.frame = CGRectMake(270, 50,34, 450-88);
   
   }
    
   
    

    
}

-(void)drawBottomViewOrigion2{
    
    
    

    
    self.frame=oldframe;
    
     self.backgroundColor=[UIColor clearColor];
    
  

    bottomView.frame=CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38);
    
    
    Vslider.frame = oldframe2;
    


}

-(void)drawBottomViewOrigion{

     bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38)];
    
    bottomView.frame=CGRectMake(0, self.frame.size.height-38,self.frame.size.width, 38);
    
    bottomView.backgroundColor=[UIColor clearColor];
    
    movieBackgroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wsmv_controlbar_bg"]];
    
    movieBackgroundImageView.frame=CGRectMake(0, 0,self.frame.size.width, 38);
    
    [bottomView addSubview:movieBackgroundImageView];
    
    
    
    
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn@ios7@2x.png"] forState:UIControlStateNormal];
    
    [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
    
    _playButton.frame = CGRectMake(1, 2,36, 30);
    
    
    [_playButton addTarget:self action:@selector(controlPlayVideoBtn)
          forControlEvents:UIControlEventTouchUpInside];
    
    
    _playButton.showsTouchWhenHighlighted = YES;
    
    [bottomView addSubview:_playButton];
    

    leftTime=[[UILabel alloc] initWithFrame:CGRectMake(38,2,50, 34)];
    
    leftTime.frame=CGRectMake(38,2,50, 34);
    
    leftTime.font = [UIFont systemFontOfSize:6.0f];
    
  
    
    [leftTime setTextAlignment:NSTextAlignmentCenter];
    
    leftTime.textColor=[UIColor whiteColor];
    leftTime.backgroundColor=[UIColor clearColor];
    
    
    
    leftTime.text=@"0:0:0";
    
    [bottomView addSubview:leftTime];
    
    progressSld = [[VSegmentSlider alloc] initWithFrame:CGRectMake(90, 2, self.frame.size.width-200, 34)];
    
    
    progressSld.frame=CGRectMake(90, 2, self.frame.size.width-200, 34);
    
    [progressSld setMinimumTrackTintColor:[UIColor greenColor]];
    
    [progressSld setMaximumTrackTintColor:[UIColor lightGrayColor]];
    
    [progressSld setThumbImage:[UIImage imageNamed:@"wsmv_slider_thumb"] forState:UIControlStateNormal];
    
    [progressSld setThumbImage:[UIImage imageNamed:@"wsmv_slider_thumb"] forState:UIControlStateHighlighted];

    
    [progressSld addTarget:self action:@selector(processCurrentPlaybackTimeChanged:) forControlEvents:UIControlEventValueChanged];
    
    [progressSld addTarget:self action:@selector(processCurrentPlaybackTouchBegin:) forControlEvents:UIControlEventTouchDown];
    
    [progressSld addTarget:self action:@selector(processCurrentPlaybackTouchEnd:) forControlEvents:UIControlEventTouchUpInside];

    
    //设置起始位置
    progressSld.value=0.0;
    //设置最小数
    progressSld.minimumValue=0.0;
    //设置最大数
    // slider.maximumValue=_thePlayer.duration;
    //设置背景颜色
   progressSld.backgroundColor = [UIColor clearColor];
    
    progressSld.continuous = YES;
    
    //添加到VIEW
    [bottomView addSubview:progressSld];
    
    
    
    rightTime=[[UILabel alloc] initWithFrame:CGRectMake(90+(self.frame.size.width-200), 2,40, 34)];
    
    rightTime.frame=CGRectMake(90+(self.frame.size.width-200), 2,40, 34);
    
    rightTime.font = [UIFont systemFontOfSize:6.0f];
    
    [rightTime setTextAlignment:NSTextAlignmentCenter];
    
    rightTime.textColor=[UIColor whiteColor];
    rightTime.backgroundColor=[UIColor clearColor];
    rightTime.text=[self getVideoTotalTime];
    
    [bottomView addSubview: rightTime];
    
    
    _screenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_screenButton setImage:[UIImage imageNamed:@"wsmv_fullscreen@ios7@2x.png"] forState:UIControlStateNormal];
    
    [_screenButton setImage:[UIImage imageNamed:@"wsmv_fullscreen_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
    
    _screenButton.frame = CGRectMake(90+(self.frame.size.width-200)+40, 2,36, 30);
    
    [_screenButton addTarget:self action:@selector(setFullScreenAct)
            forControlEvents:UIControlEventTouchUpInside];
    
    _screenButton.showsTouchWhenHighlighted = YES;
    
    [bottomView addSubview: _screenButton];

    
    _volumnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn@ios7@2x.png"] forState:UIControlStateNormal];
    
    [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
    
    _volumnButton.frame = CGRectMake(90+(self.frame.size.width-200)+40+35, 2,36, 30);
    
    [_volumnButton addTarget:self action:@selector(showVolumn)
            forControlEvents:UIControlEventTouchUpInside];
    
    _volumnButton.showsTouchWhenHighlighted = YES;
    
    [bottomView addSubview: _volumnButton];
    
    _isVoice=false;


    //--------添加音量控制 begin-------------
    Vslider = [[UISlider alloc] initWithFrame:CGRectMake(self.frame.size.width-80, (self.frame.size.height/2)-20,self.frame.size.height-64, 34)];
    
    
    Vslider.frame=CGRectMake(self.frame.size.width-100, (self.frame.size.height/2)-20,self.frame.size.height-64, 34);
    
    MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
    
    
    
    [Vslider setMinimumTrackTintColor:[UIColor greenColor]];
    //设置已滑动位置背景图
    
    
    [Vslider setMaximumTrackTintColor:[UIColor grayColor]];
    
    //设置图标图片
    [Vslider setThumbImage:[UIImage imageNamed:@"wsmv_slider_thumb.png"] forState:UIControlStateNormal];
    
    
    [Vslider setThumbImage:[UIImage imageNamed:@"wsmv_slider_thumb.png"] forState:UIControlStateHighlighted];
    
    
    //设置旋转90度
    Vslider.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    //设置起始位置
    Vslider.value=0.0;
    //设置最小数
    Vslider.minimumValue=0.0;
    //设置最大数
    Vslider.maximumValue=1.0;
    Vslider.value = mpc.volume;
    //设置背景颜色
    Vslider.backgroundColor = [UIColor clearColor];
    //设置委托事件
    [Vslider addTarget:self action:@selector(musicVolume:) forControlEvents:UIControlEventValueChanged];
    
    [Vslider setHidden:true];
    
    
    oldframe2=Vslider.frame;
    
    [bottomView setHidden:true];
    
    [self addSubview:bottomView];

    [self addSubview:Vslider];


    
}

-(void)showVolumn{

     _isVoice=!_isVoice;

}


-(void)selfFullScreen{
//    
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        
//        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:(id)UIInterfaceOrientationLandscapeRight];
//        
//    }
//    
//    [UIViewController attemptRotationToDeviceOrientation];//这行代码是关键
//    
    
    _isFullScreen092=true;
    
    
    [self drawBottomViewFullScreen];

    
    
}

-(void)closeFullScreen{
    
    
    
    [self performSelector:@selector(closeFullScreen001) withObject:nil afterDelay:0.3];
}


-(void)closeFullScreen001{
    
    
    _isFullScreen092=FALSE;
    
//    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(id)UIInterfaceOrientationPortrait];
//    
   
    
//    UIApplication *application=[UIApplication sharedApplication];
//    [application setStatusBarHidden:NO];
    
    
    [self drawBottomViewOrigion2];

    
    
    
}




-(void)setFullScreenAct{

    _isFullScreen092=!_isFullScreen092;
    
    if(_isFullScreen092){
        
         if(isOnlyShupin){
             
         [self performSelector:@selector(selfFullScreen) withObject:nil afterDelay:0.3];
             
         }else{
         
             
          [self performSelector:@selector(drawBottomViewFullScreen2) withObject:nil afterDelay:0.3];
         
         }
        
    }else{
    
         if(isOnlyShupin){
             
        [self closeFullScreen];
             
         }else{
         
        [self performSelector:@selector(drawBottomViewOrigion3) withObject:nil afterDelay:0.3];
         
         }
       
        
        
    }
    
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(showFullScreen:withIsFullSceen:)])
    {
        [self.delegate showFullScreen:self withIsFullSceen:_isFullScreen092];
        
    }

}

-(void)controlPlayVideoBtn{

    BOOL isPlaying = [mMPayer isPlaying];
	if (isPlaying) {
		[mMPayer pause];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_play_btn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_play_btn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
		
	} else {
		[mMPayer start];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
		
	}

}

-(id)initWithFrame:(CGRect)frame WithPlayUrl:(NSString *)PlayUrl withTitle:(NSString *)VideoTitle withBgImg:(UIImage *)bgImg withShu:(bool)_isFlag withCache:(bool)_isflag2{


    self = [super initWithFrame:frame];
    
    if (self) {//self
        
        oldframe=frame;
        
        isOnlyShupin=_isFlag;
        
        isShowHuncun=_isflag2;
        
         self.backgroundColor = [UIColor clearColor];
        
        self.mediaUrl=PlayUrl;
        
        
        self.videoURL=[NSURL URLWithString:self.mediaUrl];
        
        _isFullScreen092=false;
        
        self.mediaTitle=VideoTitle;
        
         bgImgView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        
        if(bgImg==nil){
            
            bgImgView.image=[UIImage imageNamed:@"wsmv_default"];
            
        }else{
        
        bgImgView.image=bgImg;
          
        
        }
        
        [self addSubview: bgImgView];
        

        
       playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [playBtn setImage:[UIImage imageNamed:@"wsmv_poster_play_btn_hl"] forState:UIControlStateNormal];
        
        [playBtn setImage:[UIImage imageNamed:@"wsmv_poster_play_btn"] forState:UIControlStateHighlighted];
        
        playBtn.frame = CGRectMake((frame.size.width/2)-29, (frame.size.height/2)-28,59,57);
        
        
        [playBtn addTarget:self action:@selector(PlayBtnAction:)
              forControlEvents:UIControlEventTouchUpInside];
        
        playBtn.showsTouchWhenHighlighted = YES;
        
        
        [self addSubview: playBtn];
        
       
        
        
        titleBtl=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        
        
        titleBtl.frame=CGRectMake(0, 0, frame.size.width, 30);
        
        titleBtl.backgroundColor=[UIColor darkGrayColor];
        
        titleBtl.alpha=0.9f;
        
        titleBtl.font=[UIFont systemFontOfSize:16];
        
        titleBtl.numberOfLines=2;
       
        [titleBtl setTextAlignment:NSTextAlignmentCenter];
        
        titleBtl.textColor=[UIColor whiteColor];
        
        titleBtl.text=self.mediaTitle;
        
        if(self.mediaTitle!=nil&&![@"" isEqualToString:self.mediaTitle]){
        
            [titleBtl setHidden:false];
            
            
        
        }else{
        
             [titleBtl setHidden:true];
            
            
        
        }
        
       [self addSubview:titleBtl];
        
        
        self.activityView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
                              UIActivityIndicatorViewStyleGray] autorelease];
        
        self.activityView.backgroundColor=[UIColor clearColor];
        
        //self.activityView.color=[UIColor greenColor];
        
        self.activityView.frame = CGRectMake((frame.size.width/2)-5, (frame.size.height/2)-5,10,10);
        
        
        [self addSubview:self.activityView];

        
        
        
        
            mMPayer = [VMediaPlayer sharedInstance];
            [mMPayer setupPlayerWithCarrierView:self withDelegate:self];
        
        
        [self drawBottomViewOrigion];
      
        
        
     }//self
    
     return self;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/





#pragma mark - VMediaPlayerDelegate Implement

#pragma mark VMediaPlayerDelegate Implement / Required

// 当'播放器准备完成'时, 该协议方法被调用, 我们可以在此调用 [player start]
// 来开始音视频的播放.
- (void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    
    mDuration = [player getDuration];
        
  
    
    [player start];
    
    
    [self.bottomView setHidden:false];
    
    if(!progressDragging){
    
    [self stopActivity];
        
    }
    
    [self setViewHidden:TRUE];
    
    progressDragging = NO;
    
    mSyncSeekTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(syncUIStatus)
                                                    userInfo:nil
                                                     repeats:YES];
    
}
// 当'该音视频播放完毕'时, 该协议方法被调用, 我们可以在此作一些播放器善后
// 操作, 如: 重置播放器, 准备播放下一个音视频等
- (void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    [player reset];
    
    mDuration=0.0f;
    
     [self setViewHidden:false];
    
    [self.bottomView setHidden:true];
    
    //------------
    
    [playBtn setHidden:false];
    //--------------
    
   // [self stopActivity];


}
// 如果播放由于某某原因发生了错误, 导致无法正常播放, 该协议方法被调用, 参
// 数 arg 包含了错误原因.
- (void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    NSLog(@"NAL 1RRE &&&& VMediaPlayer Error: %@", arg);
    
    [player reset];
    
    mDuration=0.0f;
    
   //  [self stopActivity];
    
    [self setViewHidden:false];
    
     [self.bottomView setHidden:true];
    
    
    //------------
    
    [playBtn setHidden:false];
    //--------------

}

#pragma mark - Sync UI Status

-(void)syncUIStatus
{
	
    if(!mMPayer.isPlaying){
        return;
    }
    
    
    if (!progressDragging) {
        
        //if(mMPayer.isPlaying){
            
		mCurPostion  = [mMPayer getCurrentPosition];
            
        //}
        
		[self.progressSld setValue:(float)mCurPostion/mDuration];
		self.leftTime.text = [Utilities timeToHumanString:mCurPostion];
		self.rightTime.text = [Utilities timeToHumanString:mDuration];
        
        [self isJustVideoBarShow];
        
        [self controlPlayMovie];
        
        [self drawVolumnVoiceSlider];

	}else{
    
        return;
    }
    
    
    
}


-(void)drawVolumnVoiceSlider{
    
    MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
    
    [Vslider setValue:mpc.volume];
    
    if(_isVoice){
        [Vslider setHidden:false];
       
    }else{
        [Vslider setHidden:true];
       
        
    }
    
    
    if(mpc.volume>0){
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
        
        
        
        
    }else{
        
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_mute@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_mute_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
        
        
    }
    
    
}

-(void)controlPlayMovie{
    
    if(mMPayer.isPlaying){
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_pause_btn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
        
    }else{
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_play_btn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_playButton setImage:[UIImage imageNamed:@"wsmv_play_btn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
    }
    
    
}


-(void)isJustVideoBarShow{
    
    if(_isHideToolBar0098){
        
        [bottomView setHidden:TRUE];
        
        if(self.mediaTitle!=nil&&![@"" isEqualToString:self.mediaTitle]){
        
        [titleBtl setHidden:TRUE];
            
        }
        
        [Vslider setHidden:TRUE];
        
       
        
       
        
    }else{
        
        if(self.mediaTitle!=nil&&![@"" isEqualToString:self.mediaTitle]){
        
        [titleBtl setHidden:false];
              
          }
        
        
        [bottomView setHidden:FALSE];
        
        if(_isVoice){
            [Vslider setHidden:FALSE];
        }else{
            [Vslider setHidden:TRUE];
        }
        
        
       
        
        
        
        
        
    }
    
    
    
}



#pragma mark Others

- (NSString *)getCacheRootDirectory
{
	NSString *cache = [NSString stringWithFormat:@"%@/Library/Caches/MediasCaches", NSHomeDirectory()];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cache]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cache
								  withIntermediateDirectories:YES
												   attributes:nil
														error:NULL];
    }
	return cache;
}


-(void)startActivityWithMsg:(NSString *)msg
{
	
	[self.activityView startAnimating];
}

-(void)stopActivity
{
	
	[self.activityView stopAnimating];
}

-(void)setViewHidden:(BOOL)enable
{
	
    
    [self.bgImgView setHidden:enable];
    
    
    if(self.mediaTitle!=nil&&![@"" isEqualToString:self.mediaTitle]){
        
    
         [titleBtl setHidden:enable];
        
    }
    
    
}


-(void)processCurrentPlaybackTimeChanged:(id)sender
{
    
    NSLog(@"================TimeChanged:%f================",progressSld.value);
    
  
    
   long seek = progressSld.value * mDuration;
   
	self.leftTime.text = [Utilities timeToHumanString:seek];
	
	
   
    [mMPayer seekTo:seek];

    
}

-(void)processCurrentPlaybackTouchBegin:(id)sender
{
    [mMPayer pause];
    
    progressDragging = YES;
    
    
    
    NSLog(@"================TouchBegin================");
    
    
}

-(void)processCurrentPlaybackTouchEnd:(id)sender
{
    
    NSLog(@"================TouchCancel================");
    
    
    
   [mMPayer start];
    
  //  [self startActivityWithMsg:@"Buffering"];
    
    
}


-(IBAction)progressSliderDownAction:(id)sender
{
    NSLog(@"================progressSliderDownAction==================");
    
    return;
    
    
    
    // [mMPayer pause];
    
    progressDragging = YES;
	
}

-(IBAction)progressSliderUpAction:(id)sender
{
	
    
    NSLog(@"================progressSliderUpAction==================");
    
    return;
    
   // [mMPayer pause];
    
   // progressDragging = YES;
    
    UISlider *sld = (UISlider *)sender;

	
    
    [self startActivityWithMsg:@"Buffering"];
    
	[mMPayer seekTo:(long)(sld.value * mDuration)];
    
    
}

-(IBAction)dragProgressSliderAction:(id)sender
{
	
    NSLog(@"================dragProgressSliderAction==================");

    return;
   // [mMPayer pause];
    
   // progressDragging = YES;
    
    UISlider *sld = (UISlider *)sender;
    
	self.leftTime.text = [Utilities timeToHumanString:(long)(sld.value * mDuration)];
}

-(void)progressSliderTapped:(UIGestureRecognizer *)g
{
    
    NSLog(@"================progressSliderTapped==================");
    
    return;
   
    [mMPayer pause];
    
  progressDragging = YES;
    
    UISlider* s = (UISlider*)g.view;
    
//    if (s.highlighted){
//        
//        return;
//    }
    
    
    CGPoint pt = [g locationInView:s];
    CGFloat percentage = pt.x / s.bounds.size.width;
    CGFloat delta = percentage * (s.maximumValue - s.minimumValue);
    CGFloat value = s.minimumValue + delta;
    [s setValue:value animated:YES];
    
    long seek = percentage * mDuration;
    
	self.leftTime.text = [Utilities timeToHumanString:seek];
	
	[self startActivityWithMsg:@"Buffering"];
    
    [mMPayer seekTo:seek];
    
   //  [mMPayer start];
    
    
}

- (void) musicVolume:(id)sender
{
	MPMusicPlayerController *mpc = [MPMusicPlayerController applicationMusicPlayer];
  
    mpc.volume = ((UISlider *)sender).value;
    
    
    if(mpc.volume>0){
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_mute@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_mute_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
        
    }else{
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn@ios7@2x.png"] forState:UIControlStateNormal];
        
        [_volumnButton setImage:[UIImage imageNamed:@"wsmv_volumn_hl@ios7@2x.png"] forState:UIControlStateHighlighted];
        
    }
    
    
}


-(NSString*)getVideoTotalTime{
    
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:self.videoURL options:nil];
    
    // 初始化视频媒体文件
    int minute = 0, second = 0,hour=0;
    
    second = (int)(urlAsset.duration.value / urlAsset.duration.timescale);
    
    // 获取视频总时长,单位秒 NSLog(@"movie duration : %d", second);
    
    if (second >= 3600) {
        int index = second / 3600;
        hour = index;
        second = second - index*3600;
    }
    
    
    if (second >= 60) {
        int index = second / 60;
        minute = index;
        second = second - index*60;
    }
    
    return [NSString stringWithFormat:@"%d:%d:%d",hour,minute,second];
    
}

#pragma mark - Touches
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  
    if(!_isFullScreen092){
    
        _isHideToolBar0098=!_isHideToolBar0098;
        
        _isVoice=false;

    
    }else{
        
        _isHideToolBar0098=!_isHideToolBar0098;
        
        _isVoice=false;
    
    
    }
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark VMediaPlayerDelegate Implement / Optional

- (void)mediaPlayer:(VMediaPlayer *)player setupManagerPreference:(id)arg
{
	player.decodingSchemeHint = VMDecodingSchemeSoftware;
	player.autoSwitchDecodingScheme = NO;
}

- (void)mediaPlayer:(VMediaPlayer *)player setupPlayerPreference:(id)arg
{
	
	[player setBufferSize:512*1024];
    
	[player setVideoQuality:VMVideoQualityHigh];
    
	player.useCache = YES;
	[player setCacheDirectory:[self getCacheRootDirectory]];
}

- (void)mediaPlayer:(VMediaPlayer *)player seekComplete:(id)arg
{
}

- (void)mediaPlayer:(VMediaPlayer *)player notSeekable:(id)arg
{
	progressDragging = NO;

}

- (void)mediaPlayer:(VMediaPlayer *)player bufferingStart:(id)arg
{
	progressDragging = YES;
	
	if (![Utilities isLocalMedia:self.videoURL]) {
		[player pause];
		
		
	}
    
   
}

- (void)mediaPlayer:(VMediaPlayer *)player bufferingUpdate:(id)arg
{
	if(isShowHuncun){
    
    self.titleBtl.text = [NSString stringWithFormat:@"%@ [%@]",self.mediaTitle ,[NSString stringWithFormat:@"Buffering... %d%%",[((NSNumber *)arg) intValue]]];
        
    }
}

- (void)mediaPlayer:(VMediaPlayer *)player bufferingEnd:(id)arg
{
	if (![Utilities isLocalMedia:self.videoURL]) {
		[player start];
		
		
	}
	progressDragging = NO;
    
  	
}

- (void)mediaPlayer:(VMediaPlayer *)player downloadRate:(id)arg
{
	if (![Utilities isLocalMedia:self.videoURL]) {
        
        if(isShowHuncun){
        
		self.titleBtl.text = [NSString stringWithFormat:@"%@ [%dKB/s]",self.mediaTitle ,[arg intValue]];
            
        }
	}
}

- (void)mediaPlayer:(VMediaPlayer *)player videoTrackLagging:(id)arg
{
    //	NSLog(@"NAL 1BGR video lagging....");
}

#pragma mark VMediaPlayerDelegate Implement / Cache

- (void)mediaPlayer:(VMediaPlayer *)player cacheNotAvailable:(id)arg
{
	
}

- (void)mediaPlayer:(VMediaPlayer *)player cacheStart:(id)arg
{
	
}

- (void)mediaPlayer:(VMediaPlayer *)player cacheUpdate:(id)arg
{

}

- (void)mediaPlayer:(VMediaPlayer *)player cacheSpeed:(id)arg
{
    
}

- (void)mediaPlayer:(VMediaPlayer *)player cacheComplete:(id)arg
{
	
}


@end
