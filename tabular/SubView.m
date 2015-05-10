#import "SubView.h"

@implementation SubView
@synthesize lblCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%d", [lblCount intValue]);
    [lblCount setIntValue:0];
}

- (IBAction)btnIncrease:(id)sender {
    int count = [lblCount intValue];
    count++;
    [lblCount setIntValue:count];
}

@end
