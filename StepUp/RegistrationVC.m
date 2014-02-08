//
//  ViewController.m
//  StepUp
//
//  Created by Julietta Yaunches on 2/8/14.
//
//

#import "RegistrationVC.h"
#import "RegistrationService.h"
#import "User.h"
#import "ForumVC.h"

@interface RegistrationVC ()

@property(nonatomic, strong) RegistrationService *registrationService;
@end

@implementation RegistrationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.registrationService = [RegistrationService shared];
    self.registrationService.delegate = self;
}

- (IBAction)registerClicked:(id)sender {
    self.errorMessage.hidden = YES;
    [self.registrationService registerUserForCode:self.registrationInput.text];
}

- (void)userSuccessfullyCreated:(User *)user {
    ForumVC *formumVC = [[ForumVC alloc] initWithNibName:@"ForumVC" bundle:nil];
    formumVC.user = user;
    [self presentViewController:formumVC animated:YES completion:nil];
}

- (void)registrationFailed {
    self.errorMessage.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
