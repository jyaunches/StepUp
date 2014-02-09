#import <Foundation/Foundation.h>

@class User;

@protocol RegistrationServiceProtocol <NSObject>
- (void)userSuccessfullyCreated:(User *)user;
- (void)registrationFailed;
@end