//
//  EventCreateViewController.m
//  StepUp
//
//  Created by Sunayna Jain on 2/8/14.
//
//

#import "EventCreateViewController.h"

@interface EventCreateViewController ()

@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIDatePicker *timePicker;

@property (strong, nonatomic) UIButton *dateButton;

@property (strong, nonatomic) UIButton *timeButton;

@property (strong, nonatomic) NSString *dateChosen;

@property (strong, nonatomic) NSString *timeChosen;

@property CGRect hiddenFrame;
@property CGRect visibleFrame;

@property BOOL datePickerOpen;

@property BOOL timePickerOpen;

@property (strong, nonatomic) UITextView *eventNameTextView;

@property (strong, nonatomic) UITextView *eventDetailsTextView;

@property (strong, nonatomic) UITextView *addressTextView;

@property (strong, nonatomic) UILabel *namePlaceHolderLabel;

@property (strong, nonatomic) UILabel *descriptionPlaceHolderLabel;

@property (strong, nonatomic) UILabel *addressPlaceHolderLabel;

@end

@implementation EventCreateViewController

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
    
    self.hiddenFrame = CGRectMake(10, 568, 300, 80);
    
    self.visibleFrame = CGRectMake(10, 380, 300, 80);
    
    [super viewDidLoad];
    
    [self addingHeaderView];
    
    [self addingEventDetailsTextView];
    
    [self addingEventNameTextView];
    
    [self addingTimeButton];
    
    [self addingAddressTextView];
    
    [self addingDateButton];
    
    [self addingIcons];
    
    [self addingDatePicker];
    
    [self addingTimePicker];
    
    [self addingSaveButton];
    
    [self addingCancelButton];
    
    }


-(void)addingIcons{
    
    UIImageView *clockIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 300, 24, 24)];
    clockIcon.image = [UIImage imageNamed:@"ClockGrey.png"];
    
    UIImageView *venueIcon = [[UIImageView alloc]initWithFrame:CGRectMake(14, 330, 18, 24)];
    
    venueIcon.image = [UIImage imageNamed:@"venueGrey"];
    
    [self.view addSubview:clockIcon];
    [self.view addSubview:venueIcon];
}

-(void)addingDateButton{
    
    self.dateButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 160, 60, 40)];
    
    [self.dateButton setTitle:@"Date" forState:UIControlStateNormal];
    
    [self.dateButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    self.dateButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    
    [self.dateButton addTarget:self action:@selector(dateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.dateButton];
}

-(void)addingTimeButton{
    
    self.timeButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 290, 60, 40)];
    
    [self.timeButton setTitle:@"Time" forState:UIControlStateNormal];
    
    [self.timeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    self.timeButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    
    [self.timeButton addTarget:self action:@selector(timeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.timeButton];
}

-(void)addingAddressTextView{
    
    self.addressTextView = [[UITextView alloc]initWithFrame:CGRectMake(50, 330, 250, 80)];
    
    self.addressTextView.delegate = self;
    
    self.addressTextView.backgroundColor = [UIColor yellowColor];
    
    self.addressTextView.font = [UIFont fontWithName:@"Futura" size:17];

    [self.view addSubview:self.addressTextView];
}

-(void)addingEventNameTextView{
    
    self.eventNameTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, 160, 250, 40)];
    
    self.eventNameTextView.delegate =self;
    
    self.eventNameTextView.backgroundColor = [UIColor redColor];
    
    self.eventNameTextView.font = [UIFont fontWithName:@"Futura" size:17];
    
    self.namePlaceHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 160, 120, 40)];
    
    self.namePlaceHolderLabel.text = @"Title";
    
    self.namePlaceHolderLabel.font = [UIFont fontWithName:@"Futura" size:17];
    
    self.namePlaceHolderLabel.textColor = [UIColor blackColor];
    
    [self.eventNameTextView addSubview:self.namePlaceHolderLabel];
    
    [self.view addSubview:self.eventNameTextView];

}

-(void)addingEventDetailsTextView{
    
    self.eventDetailsTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, 220, 300, 70)];
    
    self.eventDetailsTextView.delegate = self;
    
    self.eventDetailsTextView.backgroundColor = [UIColor greenColor];
    
    self.eventDetailsTextView.font = [UIFont fontWithName:@"Futura" size:17];
    
    [self.view addSubview:self.eventDetailsTextView];
    
    self.descriptionPlaceHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 300, 40)];
    
    self.descriptionPlaceHolderLabel.text = @"Description";
    
    self.descriptionPlaceHolderLabel.textColor = [UIColor whiteColor];
    
    [self.eventDetailsTextView addSubview:self.descriptionPlaceHolderLabel];
}

-(void)addingHeaderView{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor blackColor];
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
}

-(void)addingSaveButton{
    
    UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(240, 520, 70, 40)];
    
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    [saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    saveButton.layer.borderColor = [UIColor blueColor].CGColor;
    
    saveButton.layer.borderWidth = 3.0f;
    
    saveButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    
    [saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saveButton];
}

-(void)addingCancelButton{
    
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 520, 70, 40)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    cancelButton.layer.borderWidth = 3.0f;
    
    cancelButton.layer.borderColor = [UIColor blueColor].CGColor;
    
    cancelButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:17];
    
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelButton];
}

-(void)addingDatePicker{
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:self.hiddenFrame];
    
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    NSDate *date = self.datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"MM/dd"];
    
    self.dateChosen = [formatter stringFromDate:date];
    
    [self.datePicker addTarget:self action:@selector(changeDateTitle:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.datePicker];

}

-(void)addingTimePicker{
    
    self.timePicker = [[UIDatePicker alloc]initWithFrame:self.hiddenFrame];
    
    self.timePicker.datePickerMode = UIDatePickerModeTime;
    
    NSDate *date = self.timePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"hh:mm"];
    
    self.timeChosen = [formatter stringFromDate:date];
    
    [self.timePicker addTarget:self action:@selector(changeTimeTitle:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.timePicker];
}

-(void)changeDateTitle:(id)sender{
    
    NSDate *date = self.datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"hh:mm"];
    
    self.dateChosen = [formatter stringFromDate:date];
    
    [self.dateButton setTitle:self.dateChosen forState:UIControlStateNormal];
}

-(void)changeTimeTitle:(id)sender{
    
    NSDate *date = self.timePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"hh:mm"];
    
    self.timeChosen = [formatter stringFromDate:date];
    
    [self.timeButton setTitle:self.timeChosen forState:UIControlStateNormal];
}

-(void)dateButtonPressed:(UIButton*)sender{
    
    if (!self.datePickerOpen){
        
        [self datePickerAnimation];
        
        [self.dateButton setTitle:self.dateChosen forState:UIControlStateNormal];
    
    } else {
        
        [self dismissDatePicker];
    }
}


-(void)datePickerAnimation{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.datePicker.frame = self.visibleFrame;
    } completion:^(BOOL finished) {
        self.datePickerOpen = YES;
        NSLog(@"datePicker done going to main view");
    }];
    
}

-(void)dismissDatePicker{
    [UIView animateWithDuration:0.5f animations:^{
        self.datePicker.frame = self.hiddenFrame;
    } completion:^(BOOL finished) {
        NSLog(@"datePicker done going to hidden view");
        self.datePickerOpen = NO;
    }];
    
    [self.dateButton setTitle:self.dateChosen forState:UIControlStateNormal];
}

-(void)timeButtonPressed:(UIButton*)sender{
    
    if (!self.timePickerOpen){
        
        [self timePickerAnimation];
        
        [self.timeButton setTitle:self.timeChosen forState:UIControlStateNormal];
        
    } else {
        
        [self dismissTimePicker];
    }
}


-(void)timePickerAnimation{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.timePicker.frame = self.visibleFrame;
    } completion:^(BOOL finished) {
        self.timePickerOpen = YES;
        NSLog(@"datePicker done going to main view");
    }];
    
}

-(void)dismissTimePicker{
    [UIView animateWithDuration:0.5f animations:^{
        self.timePicker.frame = self.hiddenFrame;
    } completion:^(BOOL finished) {
        NSLog(@"datePicker done going to hidden view");
        self.timePickerOpen = NO;
    }];
    
    [self.timeButton setTitle:self.dateChosen forState:UIControlStateNormal];
}

-(void)saveButtonPressed:(id)sender{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

-(void)cancelButtonPressed:(id)sender{
    
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UITextviewDelegate methods

-(void)checkForPlaceholderLabelInEventNameTextview{
    if (self.eventNameTextView.text.length ==0){
        [self.eventNameTextView addSubview:self.namePlaceHolderLabel];
    } else if (self.eventNameTextView.text.length>0) {
        [self.namePlaceHolderLabel removeFromSuperview];
    }
}

-(void)checkForPlaceholderLabelInEventDetailsTextview{
    if (self.eventDetailsTextView.text.length ==0){
        [self.eventDetailsTextView addSubview:self.descriptionPlaceHolderLabel];
    } else if (self.eventDetailsTextView.text.length>0) {
        [self.descriptionPlaceHolderLabel removeFromSuperview];
    }
}

-(void)checkForPlaceholderLabelInAddressTextview{
    if (self.addressTextView.text.length ==0){
        [self.addressTextView addSubview:self.addressPlaceHolderLabel];
    } else if (self.addressTextView.text.length>0) {
        [self.addressPlaceHolderLabel removeFromSuperview];
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        if (textView == self.eventNameTextView){
            [textView resignFirstResponder];
            [self.eventDetailsTextView becomeFirstResponder];
            [self checkForPlaceholderLabelInEventNameTextview];
            return NO;
        } else if (textView==self.eventDetailsTextView){
            [textView resignFirstResponder];
            [self checkForPlaceholderLabelInEventDetailsTextview];
            [self.addressTextView becomeFirstResponder];
        }
        else {
            [textView resignFirstResponder];
            [self checkForPlaceholderLabelInAddressTextview];
        }
    }
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView{
    
    if (textView==self.eventNameTextView){
        [self checkForPlaceholderLabelInEventNameTextview];
    } else if (textView == self.eventDetailsTextView){
        [self checkForPlaceholderLabelInEventDetailsTextview];
    } else {
        [self checkForPlaceholderLabelInAddressTextview];
    }
}


@end
