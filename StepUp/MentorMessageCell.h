//
//  MentorMessageCell.h
//  StepUp
//
//  Created by Julietta Yaunches on 2/8/14.
//
//

#import <UIKit/UIKit.h>

@interface MentorMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *topicText;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIView *roleIndicator;
@property (weak, nonatomic) IBOutlet UILabel *dateText;
@end
