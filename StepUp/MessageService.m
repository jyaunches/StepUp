#import "MessageService.h"


@implementation MessageService
+ (MessageService *)shared {
    static MessageService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)sendMessage:(NSString *)text {

}
@end