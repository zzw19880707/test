//
//  ShowImageViewController.h
//  BusinessQA2
//
//  Created by 朱 亮亮 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTPhotoView.h"

@interface ShowImageViewController : UIViewController <KTPhotoViewDelegate>
{
    UIImage *_image;
    KTPhotoView * _bigImageV;
    CGRect _originalFrame;
    
    UIStatusBarStyle statusBarStyle_;
    BOOL viewDidAppearOnce_;
    BOOL navbarWasTranslucent_;
    BOOL isChromeHidden_;
    BOOL statusbarHidden_; // Determines if statusbar is hidden at initial load. In other words, statusbar remains hidden when toggling chrome.
    
    UITapGestureRecognizer *_tap;
}

@property (nonatomic, retain) KTPhotoView *bigImageV;

+(id) sharedInstance;
-(void) showWithImage:(UIImage *)image bigImageURL:(NSString *)url withFrame:(CGRect) frame fromView:(UIView *)view;
-(void) hide;
-(void) save;

@end
