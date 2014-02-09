//
//  ForumVC.m
//  StepUp
//
//  Created by Julietta Yaunches on 2/8/14.
//
//

#import "ForumVC.h"
#import "User.h"
#import "ForumTVDelegate.h"
#import "MentorMessageCell.h"

@interface ForumVC ()
@property(nonatomic, strong) ForumTVDelegate *myTableDelegate;
@end

@implementation ForumVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MentorMessageCell" bundle:nil] forCellReuseIdentifier:@"MentorMessageCell"];
    self.myTableDelegate = [[ForumTVDelegate alloc] init];
    [self.tableView setDelegate:self.myTableDelegate];
    [self.tableView setDataSource:self.myTableDelegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
