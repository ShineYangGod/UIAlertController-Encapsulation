//
//  UIAlertToolTwo.h
//  Onehomehealthcare
//
//  Created by 杨晨 on 16/3/11.
//  Copyright © 2016年 mojiaxun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertToolTwo : NSObject

-(void)showAlertView:(UIViewController *)viewController :(NSString *)title :(NSString *)message :(NSString *)cancelButtonTitle :(NSString *)otherButtonTitle :(void (^)())confirm :(void (^)())cancle;;

@end
