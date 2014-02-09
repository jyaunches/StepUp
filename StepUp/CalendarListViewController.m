//
//  CalendarListViewController.m
//  StepUp
//
//  Created by Sunayna Jain on 2/8/14.
//
//

#import "CalendarListViewController.h"
#import "CalendarCell.h"
#import "NewEventViewController.h"
#import "EventCreateViewController.h"
#import <EventKit/EventKit.h>

@interface CalendarListViewController ()

@end

@implementation CalendarListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
        
    [self addRightBarButtonItem];
    
    self.title = @"Events";
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)addRightBarButtonItem{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPressed:)];
}

-(void)addPressed:(id)sender{
    
    NewEventViewController *newEventVC = [[NewEventViewController alloc]initWithNibName:@"NewEventVC" bundle:nil];
    
    [self.navigationController pushViewController:newEventVC animated:YES];
    
}

#pragma mark-UITableView DataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 150)];
    view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor blackColor];
    //button.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    button.titleLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:24];
    [button setTitle:@"upcoming" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(20, 20, 200, 60);
    [view addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 90, 200, 40)];
    label.textColor = [UIColor whiteColor];
    label.text = @"events";
    label.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:24];
    //label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [view addSubview:label];

    return view;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 70)];
    
    view.backgroundColor = [UIColor blueColor];
    
    UIButton *plusButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 10, 50, 50)];
    
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    
    plusButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:30];
    
    [plusButton addTarget:self action:@selector(plusButtonPressed:)   forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:plusButton];
    
    return view;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   static NSString *CellIdentifier = @"CalendarCell";
    CalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"CalendarCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil] objectAtIndex:0];
    }
    cell.headerLabel.text = @"Sample Event";
    cell.dateLabel.text = @"2/3";
    cell.colorLabel.text = @"";
    cell.headerLabel.font = [UIFont fontWithName:@"Futura" size:18];
    cell.dateLabel.font = [UIFont fontWithName:@"Futura" size:18];
    
    cell.colorLabel.backgroundColor = [UIColor blueColor];
    return cell;
}

-(void)plusButtonPressed:(id)sender{
    
    EventCreateViewController *eventCreateVC = [[EventCreateViewController alloc]initWithNibName:@"EventCreateVC" bundle:nil];
    
    [self presentViewController:eventCreateVC animated:NO completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewEventViewController *newEventVC = [[NewEventViewController alloc]initWithNibName:@"NewEventVC" bundle:nil];
    
    [self presentViewController:newEventVC animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
