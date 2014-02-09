#import "RegistrationService.h"
#import "RegistrationServiceProtocol.h"
#import "User.h"


@implementation RegistrationService

- (void)registerUserForCode:(NSString *)code {
    [self.delegate userSuccessfullyCreated:[[User alloc] init]];
}

+ (RegistrationService *)shared {
    static RegistrationService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end