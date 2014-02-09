#import <Foundation/Foundation.h>
#import "RegistrationServiceProtocol.h"


@interface RegistrationService : NSObject
@property(nonatomic, weak) id <RegistrationServiceProtocol> delegate;

- (void)registerUserForCode:(NSString *)code;

+ (RegistrationService *)shared;
@end