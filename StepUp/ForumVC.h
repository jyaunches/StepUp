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

@interface ForumVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) User *user;
@end
