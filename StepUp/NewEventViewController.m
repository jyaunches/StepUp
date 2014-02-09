//
//  NewEventViewController.m
//  StepUp
//
//  Created by Sunayna Jain on 2/8/14.
//
//

#import "NewEventViewController.h"
#import "CalendarCell.h"
#import "EventDetailsCell.h"
#import "CalendarListViewController.h"

@interface NewEventViewController ()

@property (strong, nonatomic) UIButton *yesButton;
@property (strong, nonatomic) UIButton *maybeButton;
@property (strong, nonatomic) UIButton *noButton;

@end

@implementation NewEventViewController

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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addingRSVPLabel];
    
    [self addingYesButton];
    
    [self addingMaybeButton];
    
     [self addingNoButton];
    
        	// Do any additional setup after loading the view.
}

-(void)addingRSVPLabel{
    
    UILabel *rsvpLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 520, 60, 40)];
    rsvpLabel.text = @"RSVP";
    rsvpLabel.font = [UIFont fontWithName:@"Futura" size:17];
    [self.view addSubview:rsvpLabel];
    
}

-(void)addingYesButton{
    
    self.yesButton = [[UIButton alloc]initWithFrame:CGRectMake(90, 520, 50, 40)];
    self.yesButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.yesButton.layer.borderWidth = 3.0f;
    self.yesButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    [self.yesButton setTitle:@"yes" forState:UIControlStateNormal];
    [self.yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.yesButton addTarget:self action:@selector(yesButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.yesButton];
    
}

-(void)addingMaybeButton{
    
    self.maybeButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 520, 60, 40)];
    self.maybeButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.maybeButton.layer.borderWidth = 3.0f;
    self.maybeButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    [self.maybeButton setTitle:@"maybe" forState:UIControlStateNormal];
    [self.maybeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.maybeButton addTarget:self action:@selector(yesButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.maybeButton];
}


-(void)addingNoButton{
    self.noButton = [[UIButton alloc]initWithFrame:CGRectMake(240, 520, 50, 40)];
    self.noButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.noButton.layer.borderWidth = 3.0f;
    self.noButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    [self.noButton setTitle:@"no" forState:UIControlStateNormal];
    [self.noButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.noButton addTarget:self action:@selector(yesButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.noButton];
    

}
#pragma mark-TableView DataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0){
        return 66;
    } else {
        return self.view.frame.size.height-66-150-60;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
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


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0){
        
       CalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalendarCell"];
        
            if (!cell) {
                cell = [[[UINib nibWithNibName:@"CalendarCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil] objectAtIndex:0];
            }
        ((CalendarCell*)cell).headerLabel.text = @"Sample Event";
        ((CalendarCell*)cell).dateLabel.text = @"2/3";
        ((CalendarCell*)cell).colorLabel.text = @"";
        ((CalendarCell*)cell).headerLabel.font = [UIFont fontWithName:@"Futura" size:18];
        ((CalendarCell*)cell).dateLabel.font = [UIFont fontWithName:@"Futura" size:18];
        
        return cell;
        }
    
    else {
    
    static NSString *cellIdentifier = @"EventDetails";
    
    EventDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        if(!cell){
        cell = [[[UINib nibWithNibName:@"EventDetailsCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil] objectAtIndex:0];
        }
        cell.timeLabel.text = @"6 PM";
        cell.timeLabel.font = [UIFont fontWithName:@"Futura" size:17];
        cell.timeIcon.image = [UIImage imageNamed:@"venueBlack.png"];
        cell.venueIcon.image = [UIImage imageNamed:@"clockBlack.png"];
        NSString *firstLine = @"Macy's Hearld Square";
        NSString *secondLine = @"151 W 34th Street";
        NSString *thirdLine = @"New York, 10010";
        NSString *combined = [NSString stringWithFormat:@"%@\n%@\n%@", firstLine, secondLine, thirdLine];
        cell.venueTextview.text = combined;
        cell.venueTextview.font = [UIFont fontWithName:@"Futura" size:17];
        cell.eventDetailsTextView.text = @"Jump-start your morning with inspiration from an industry leader";
        cell.eventDetailsTextView.font = [UIFont fontWithName:@"Futura" size:17];
//        cell.rsvpLabel.text = @"RSVP";
//        cell.rsvpLabel.font = [UIFont fontWithName:@"Futura" size:17];
//        cell.yesButton.layer.borderColor = [UIColor blueColor].CGColor;
//        cell.yesButton.layer.borderWidth = 3.0f;
//        cell.yesButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
//        [cell.yesButton addTarget:self action:@selector(yesButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        cell.maybeButton.layer.borderColor = [UIColor blueColor].CGColor;
//        cell.maybeButton.layer.borderWidth = 3.0f;
//        cell.maybeButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
//        [cell.maybeButton addTarget:self action:@selector(maybeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        cell.noButton.layer.borderColor = [UIColor blueColor].CGColor;
//        cell.noButton.layer.borderWidth = 3.0f;
//        [cell.noButton addTarget:self action:@selector(noButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        cell.noButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
        
        return cell;
    }
    
}

-(void)yesButtonPressed:(UIButton*)yesButton{
    
    yesButton.backgroundColor = [UIColor blueColor];
}

-(void)maybeButtonPressed:(UIButton*)maybeButton{
    
    maybeButton.backgroundColor = [UIColor blueColor];
}

-(void)noButtonPressed:(UIButton*)noButton{
    
    noButton.backgroundColor = [UIColor blueColor];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
