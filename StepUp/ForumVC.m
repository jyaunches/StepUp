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
#import "RegistrationService.h"
#import "MessageService.h"
#import "RDRStickyKeyboardView.h"

@interface ForumVC ()
@property(nonatomic, strong) ForumTVDelegate *myTableDelegate;
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation ForumVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];

    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth
            |UIViewAutoresizingFlexibleHeight;


    [self.tableView registerNib:[UINib nibWithNibName:@"MentorMessageCell" bundle:nil] forCellReuseIdentifier:@"MentorMessageCell"];
    self.myTableDelegate = [[ForumTVDelegate alloc] init];
    [self.tableView setDelegate:self.myTableDelegate];
    [self.tableView setDataSource:self.myTableDelegate];

    RDRStickyKeyboardView *keyboardView = [[RDRStickyKeyboardView alloc] initWithScrollView:self.tableView];
    keyboardView.frame = self.view.bounds;
    keyboardView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:keyboardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendMessageClicked:(id)sender {
//    [[MessageService shared] sendMessage:self.messageInput.text];
}
@end
