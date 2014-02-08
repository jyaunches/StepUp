//
//  ViewController.h
//  StepUp
//
//  Created by Julietta Yaunches on 2/8/14.
//
//

#import <UIKit/UIKit.h>
#import "RegistrationServiceProtocol.h"

@interface RegistrationVC : UIViewController<RegistrationServiceProtocol>
@property (weak, nonatomic) IBOutlet UITextField *registrationInput;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@end
