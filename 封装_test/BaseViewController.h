//
//  BaseViewController.h
//  UI封装demo
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  This ViewController provide notification(When Model-data changed we post a notification to tell ViewController to refresh their UI) and objc_runtime method(objc_runtime help us get ViewController's all members, so we can get the member's getter method to refresh the UI when Model-data changed),so which ViewController need to change should inherit BaseViewController.
 */
@interface BaseViewController : UIViewController


/**
 *  (Public Port)ChangeMode
 */
- (void)setModel;
@end
