//
//  ForumVC.h
//  StepUp
//
//  Created by Julietta Yaunches on 2/8/14.
//
//

#import <UIKit/UIKit.h>

@class User;
@class ForumTVDelegate;

@interface ForumVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *messageInput;
@property(nonatomic, strong) User *user;
@end
