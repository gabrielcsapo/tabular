#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>
@property (strong) IBOutlet NSTableView *tableView;
- (IBAction)btnAdd:(id)sender;
- (IBAction)btnMinus:(id)sender;
@end

