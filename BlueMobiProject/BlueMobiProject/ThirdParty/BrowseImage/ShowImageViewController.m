//
//  ShowImageViewController.m
//  BusinessQA2
//
//  Created by 朱 亮亮 on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShowImageViewController.h"
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"

static ShowImageViewController * _showImage = nil;

@implementation ShowImageViewController
@synthesize bigImageV = _bigImageV;

+ (id)sharedInstance
{
	if ( _showImage == nil )
    {
		_showImage = [[ShowImageViewController alloc] init];
    }
    
	return _showImage;
}

- (id)init
{
    self = [super init];
    if(self) {
        self.view.backgroundColor = [UIColor blackColor];
        
        // 保存按钮
//        image = [[UIImage alloc]initWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"savebtn.png"]];
//        UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 25, 38)];
//        [saveButton setImage:image forState:UIControlStateNormal];
//        [saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:saveButton];
//        [saveButton release];
//        [image release];image = nil;
    }
    
    return self;
}

- (void)save
{
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)showWithImage:(UIImage *)image bigImageURL:(NSString *)url withFrame:(CGRect) frame fromView:(UIView *)view
{    
    _originalFrame = [self.view convertRect:frame fromView:view];
    
    [self.bigImageV removeFromSuperview];
    self.bigImageV = [[[KTPhotoView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height+20)] autorelease];
    self.bigImageV.image = image;
    [self.bigImageV setScroller:self];
    [self.view addSubview:self.bigImageV];
    _image = image;
    
//    CGSize size = [image getRealSizeInSizeRrange:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+20)];
//    self.bigImageV = [[[KTPhotoView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-size.width)/2, (self.view.bounds.size.height+20-size.height)/2-20, size.width, size.height)] autorelease];
//    self.bigImageV.image = image;
//    [self.bigImageV setScroller:self];
//    [self.view addSubview:self.bigImageV];
//    _image = image;
    
    UIWindow *window = (UIWindow *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    [window.rootViewController presentModalViewController:self animated:NO];
}

-(void) hide
{    
    [self.bigImageV removeFromSuperview];
    self.bigImageV = nil;
    _image = nil;
    [self dismissModalViewControllerAnimated:NO];
}

- (void) dealloc
{
    self.bigImageV = nil;
    _image = nil;
    [_tap release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    _bigImageV.frame = CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height+20);
//    return YES;
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    
    // The first time the view appears, store away the previous controller's values so we can reset on pop.
    if (!viewDidAppearOnce_) {
        viewDidAppearOnce_ = YES;
        navbarWasTranslucent_ = [[[self navigationController] navigationBar] isTranslucent];
        statusBarStyle_ = [[UIApplication sharedApplication] statusBarStyle];
    }
    // Then ensure translucency. Without it, the view will appear below rather than under it.  
    [[[self navigationController] navigationBar] setTranslucent:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    
    // Set the scroll view's content size, auto-scroll to the stating photo,
    // and setup the other display elements.
}

- (void)viewWillDisappear:(BOOL)animated 
{
    // Reset nav bar translucency and status bar style to whatever it was before.
    [[[self navigationController] navigationBar] setTranslucent:navbarWasTranslucent_];
    [[UIApplication sharedApplication] setStatusBarStyle:statusBarStyle_ animated:YES];
    [super viewWillDisappear:animated];
}

#pragma mark - KTPhotoViewDelegate

- (void)toggleChromeDisplay 
{
    [self toggleChrome:!isChromeHidden_];
}

- (void)toggleChrome:(BOOL)hide 
{
    isChromeHidden_ = hide;
    [self hide];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != NULL) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

-(void) request:(ASIHTTPRequest *)req didReceiveBytes:(long long)bytes
{
//    id downloadTypeValue = [[req userInfo] objectForKey:kDownloadTypeKey];
//	id delegate = [[req userInfo] objectForKey:@"delegate"];
//    
//    if ( [downloadTypeValue isEqualToString:kDownloadTypeValueQuestionnaire] ) {
//        NSLog(@"bytes:%lld",bytes);
//        Questionnaire * questionnaire = [[req userInfo] objectForKey:@"questionnaire"]; 
//        if ( [delegate respondsToSelector:@selector(downloadInProgress:forQuestionnaire:)] )
//            [delegate downloadInProgress:req.totalBytesRead forQuestionnaire:questionnaire];
//        
//    }
//    
//    //    else if ( [downloadTypeValue isEqualToString:kDownloadTypeValueQuestionnaireList] ) {
//    //        
//    //        if ( [delegate respondsToSelector:@selector(questionnaireListDownloadInProgress:)] )
//    //            [delegate questionnaireListDownloadInProgress:req.totalBytesRead];
//    //    }
//    
//    else {
//#ifdef DEBUG        
//        NSLog(@"Unknown download type %@ in request:didReceiveBytes", downloadTypeValue);
//#endif        
//    }
    
}

-(void) request:(ASIHTTPRequest *)req incrementDownloadSizeBy:(long long)newLength
{
//	id delegate = [[req userInfo] objectForKey:@"delegate"];
//    id downloadTypeValue = [[req userInfo] objectForKey:kDownloadTypeKey];
//    
//    if ( [downloadTypeValue isEqualToString:kDownloadTypeValueQuestionnaire] ) {
//        
//        NSLog(@"newLength:%lld",req.totalBytesRead);
//        Questionnaire * questionnaire = [[req userInfo] objectForKey:@"questionnaire"]; 
//        if ( [delegate respondsToSelector:@selector(downloadDidReceiveTotalSize:forQuestionnaire:)] )
//            [delegate downloadDidReceiveTotalSize:newLength forQuestionnaire:questionnaire];
//        
//    }
//    
//    //    else if ( [downloadTypeValue isEqualToString:kDownloadTypeValueQuestionnaireList] ) {
//    //        
//    //        if ( [delegate respondsToSelector:@selector(questionnaireListDownloadDidReceiveTotalSize:)] )
//    //            [delegate questionnaireListDownloadDidReceiveTotalSize:req.totalBytesRead];
//    //    }
//    
//    else {
//#ifdef DEBUG        
//        NSLog(@"Unknown download type %@ in request:incrementDownloadSizeBy:", downloadTypeValue);
//#endif        
//    }
    
}

@end
