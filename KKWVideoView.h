//
//  KKWVideoView.h
//  VideoByVitiomDemo
//
//  Created by zhengyu xu on 14-6-19.
//  Copyright (c) 2014年 smg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vitamio.h"
#import "VSegmentSlider.h"
#import "Utilities.h"
#import <MediaPlayer/MediaPlayer.h>//调节音量所必须
#import <MediaPlayer/MPMoviePlayerController.h>
#import <MediaPlayer/MPMediaPlayback.h>
#import <AVFoundation/AVFoundation.h>

#define DELEGATE_IS_READY(x) (self.delegate && [self.delegate respondsToSelector:@selector(x)])


@class KKWVideoView;


@protocol KKWVideoViewDelegate <NSObject>
@optional
- (void)showFullScreen:(KKWVideoView*)VideoView withIsFullSceen:(bool)IsFullSceen;


@end



@interface KKWVideoView : UIView<VMediaPlayerDelegate>{

    VMediaPlayer       *mMPayer;
    long               mDuration;
    long               mCurPostion;
    NSTimer            *mSyncSeekTimer;
    
    VSegmentSlider *progressSld;
    
    UIActivityIndicatorView *activityView;
    
    NSString *mediaUrl;
    
    NSString *mediaTitle;
    
    UILabel *titleBtl;
    
     bool progressDragging;
    
    
    
    NSURL *videoURL;
    
    UIImageView *bgImgView;
    
    UIView *bottomView;
    UIView *topView;
    
    UIButton *_playButton;
    
    UIButton *playBtn;
    
    UILabel *leftTime;
    
    UILabel *rightTime;
    
    UIButton *_screenButton;
    
    UIButton *_volumnButton;
    
    bool  _isVoice;
    
    UISlider *Vslider;
    
    bool _isFullScreen092;
    
    bool _isHideToolBar0098;
    
    
    CGRect oldframe;
    
    CGRect oldframe2;
    
    bool isOnlyShupin;
    
    bool isShowHuncun;
    
    UIImageView *movieBackgroundImageView;

}


@property (nonatomic, strong)UIImageView *movieBackgroundImageView;

@property (nonatomic, assign) id <KKWVideoViewDelegate> delegate;

@property (nonatomic, strong)UIButton *playBtn;


@property (nonatomic, strong)UISlider *Vslider;


@property (nonatomic, strong)UILabel *rightTime;

@property (nonatomic, strong)UIButton *_screenButton;

@property (nonatomic, strong)UIButton *_volumnButton;

@property (nonatomic, strong) UILabel *leftTime;

@property (nonatomic, strong)UIButton *_playButton;

@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)UIView *topView;


@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, strong)   NSURL *videoURL;

@property (nonatomic, strong)UILabel *titleBtl;

@property (nonatomic, strong) NSString *mediaTitle;

@property (nonatomic, strong)NSString *mediaUrl;


@property (nonatomic, strong) VMediaPlayer *mMPayer;

@property (nonatomic, strong)VSegmentSlider *progressSld;

@property (nonatomic, strong)UIActivityIndicatorView *activityView;




-(id)initWithFrame:(CGRect)frame WithPlayUrl:(NSString *)PlayUrl withTitle:(NSString *)VideoTitle withBgImg:(UIImage *)bgImg withShu:(bool)_isFlag withCache:(bool)_isflag2;


@end
