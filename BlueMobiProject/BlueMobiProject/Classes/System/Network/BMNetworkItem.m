//
//  BMNetworkItem.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMNetworkItem.h"
#import "ASIFormDataRequest.h"
#import "JsonHandler.h"
#import "BMNetworkHandler.h"
#import "NSString+Common.h"

@implementation BMNetworkItem

- (BMNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init]) 
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
        
        if (networkType == NetWorkGET) 
        {
            NSMutableString *requestStr=[[NSMutableString alloc]init];
            id paramKey = nil;
            NSEnumerator *enumerator = [params keyEnumerator];
            if ((paramKey = [enumerator nextObject])) 
            {
                [requestStr appendFormat:@"?%@=%@",paramKey,[params objectForKey:paramKey]];
            }
            while ((paramKey = [enumerator nextObject])) 
            {
                [requestStr appendFormat:@"&%@=%@",paramKey,[params objectForKey:paramKey]];
            }
                        
            self.httpRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",url,requestStr]]];
            [self.httpRequest setRequestMethod:@"GET"];
        } 
        else if (networkType == NetWorkPOST)
        {
            self.httpRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:self.url]];
            [self.httpRequest setRequestMethod:@"POST"];
            
            ASIFormDataRequest *form = (ASIFormDataRequest *) self.httpRequest;
            NSEnumerator *enumerator = [params keyEnumerator];
            id paramKey = nil;
            while ((paramKey = [enumerator nextObject]))
            {
                [form setPostValue:[params objectForKey:paramKey] forKey:paramKey];
            }
        }
        
        __weak ASIHTTPRequest *weekHttpRequest = self.httpRequest;
        __weak BMNetworkItem *weekSelf = self;
        
        self.httpRequest.timeOutSeconds = API_TIME_OUT;

        [self.httpRequest setCompletionBlock:^(void){
            
            NSString *responseString = [[NSString alloc] initWithData:weekHttpRequest.responseData encoding:NSUTF8StringEncoding];
#if DEBUG
            NSLog(@"BM网络请求接口url:%@的回返数据 responseString:\n%@", url, responseString);
#endif
            // 如果是.net后台返回数据，并且json数据有xml包着的话，请释放这一句
//            responseString = [responseString ignoreDotNetSpecialString];
            
            // 如果返回值有html特殊字符，请释放这一句
//            responseString = [responseString ignoreHTMLSpecialString];

            id returnData = [JsonHandler JSONValue:responseString];
            
            if (successBlock) 
            {
                successBlock(returnData);
            }
            
            [[BMNetworkHandler sharedInstance] removeItem:weekSelf];
        }];
        
        [self.httpRequest setFailedBlock:^(void) {
#if DEBUG
            NSLog(@"BM网络请求接口url:%@访问错误 error:\n%@", url, weekHttpRequest.error);
#endif
            if (failureBlock) 
            {
                failureBlock(weekHttpRequest.error);
            }
            
            [[BMNetworkHandler sharedInstance] removeItem:weekSelf];
        }];
        
        [[BMNetworkHandler sharedInstance] addItem:self];
        [self.httpRequest startAsynchronous];
    }
    
    return self;
}

- (BMNetworkItem *) initDownloadWithtype:(NetWorkType) networkType
                                     url:(NSString *) url
                                delegate:(id) delegate
                               hashValue:(NSUInteger) hashValue
                              startBlock:(NWStartBlock) startBlock
                            successBlock:(NWSuccessBlock) successBlock
                            failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init]) 
    {
        self.networkType = networkType;
        self.url = url;
        self.delegate = delegate;
        self.hashValue = hashValue;
        
        if (networkType == NetWorkGET) 
        {
            self.httpRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:self.url]];
            [self.httpRequest setRequestMethod:@"GET"];
        } 
        else if (networkType == NetWorkPOST) 
        {
            self.httpRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:self.url]];
            [self.httpRequest setRequestMethod:@"POST"];
        }
        
        [self.httpRequest setShowAccurateProgress:YES];
        [self.httpRequest setDownloadProgressDelegate:delegate];
        [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
        
        __weak ASIHTTPRequest *weekHttpRequest = self.httpRequest;
        __weak BMNetworkItem *weekSelf = self;
        
        [self.httpRequest setStartedBlock:^(void){
            
#if DEBUG
            NSLog(@"BM网络下载url:%@开始下载 ", url);
#endif
            
            if (startBlock) {
                startBlock();
            }
        }];
        
        [self.httpRequest setCompletionBlock:^(void){
            
#if DEBUG
            NSLog(@"BM网络下载url:%@下载完成 ", url);
#endif
            
            if (successBlock) {
                successBlock(weekHttpRequest.responseData);
            }
            
            [[BMNetworkHandler sharedInstance] removeItem:weekSelf];
        }];
        
        [self.httpRequest setFailedBlock:^(void) {
            
#if DEBUG
            NSLog(@"BM网络下载url:%@下载失败 error:\n%@", url, weekHttpRequest.error);
#endif
            if (failureBlock) {
                failureBlock(weekHttpRequest.error);
            }
            
            [[BMNetworkHandler sharedInstance] removeItem:weekSelf];
        }];
        
        [[BMNetworkHandler sharedInstance] addItem:self];
        [self.httpRequest startAsynchronous];
    }
    
    return self;
}

@end
