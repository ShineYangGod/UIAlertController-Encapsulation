//
//  UIAlertToolTwo.m
//  Onehomehealthcare
//
//  Created by 杨晨 on 16/3/11.
//  Copyright © 2016年 mojiaxun. All rights reserved.
//

#import "UIAlertToolTwo.h"
#define IAIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
typedef void (^confirm)();
typedef void (^cancle)();
@interface UIAlertToolTwo(){
    
    confirm confirmParam;
    cancle  cancleParam;
}
@end
@implementation UIAlertToolTwo
-(void)showAlertView:(UIViewController *)viewController :(NSString *)title :(NSString *)message :(NSString *)cancelButtonTitle :(NSString *)otherButtonTitle :(void (^)())confirm :(void (^)())cancle{
    confirmParam=confirm;
    cancleParam=cancle;
    if (IAIOS8) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        // Create the actions.
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            cancle();
        }];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            confirm();
        }];
        // Add the actions.
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    }
    else{
        UIAlertView *TitleAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:otherButtonTitle otherButtonTitles:cancelButtonTitle,nil];
        [TitleAlert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        confirmParam();
    }
    else{
        cancleParam();
    }
}
@end
