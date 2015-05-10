#import "ViewController.h"
#import "SubView.h"

@interface ViewController() {
    int width;
    int height;
    int frames;
    NSMutableArray *views;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSSize size = self.view.frame.size;
    width = size.width;
    height = size.height;
    frames = 0;
    views = [[NSMutableArray alloc] init];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"cell" owner:self];
    [cellView setWantsLayer:YES];
    [[cellView layer] setBorderWidth:1];
    [[cellView layer] setBorderColor:CGColorGetConstantColor(kCGColorBlack)];
    for(NSView *view in [cellView subviews]) {
        [view removeFromSuperview];
    }
    if([tableColumn.identifier isEqualToString:@"Test"]) {
        SubView *subView = [self.storyboard instantiateControllerWithIdentifier:@"SubView"];
        [views addObject:subView];
        NSView *view = [subView view];
        [cellView addSubview:view];
        [cellView setFrameSize:NSMakeSize(150, 440)];
        return cellView;
    } else if ([tableColumn.identifier isEqualToString:@"Test1"]) {
        SubView *subView = [self.storyboard instantiateControllerWithIdentifier:@"SubView"];
        [views addObject:subView];
        NSView *view = [subView view];
        [cellView addSubview:view];
        [cellView setFrameSize:NSMakeSize(150, 440)];
        return cellView;
    }
    return NULL;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 1;
}

- (IBAction)btnAdd:(id)sender {
    [self addView];
}

- (IBAction)btnMinus:(id)sender {
    [self subtractView];
}

- (void) increaseSize {
    width = width + 155;
    NSWindow *window = [[self view] window];
    NSRect wframe = [window frame];
    wframe.size = NSMakeSize(width, height);
    [window setFrame:wframe display:YES animate:YES];
}

- (void) decreaseSize {
    width = width - 155;
    NSWindow *window = [[self view] window];
    NSRect wframe = [window frame];
    wframe.size = NSMakeSize(width, height);
    [window setFrame:wframe display:YES animate:YES];
}

- (void) subtractView {
    if(frames == 2) {
        [views removeObjectAtIndex:1];
        NSTableColumn *column = [self.tableView.tableColumns objectAtIndex:[self.tableView columnWithIdentifier:@"Test1"]];
        [self.tableView removeTableColumn: column];
        [self decreaseSize];
        frames--;
    } else if(frames == 1) {
        [views removeObjectAtIndex:0];
        NSTableColumn *column = [self.tableView.tableColumns objectAtIndex:[self.tableView columnWithIdentifier:@"Test"]];
        [self.tableView removeTableColumn: column];
        [self decreaseSize];
        frames--;
    }
}

- (void) addView {
    if(frames == 0) {
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Test"];
        [[column headerCell] setStringValue:@"Test"];
        [column setWidth:150];
        [self.tableView addTableColumn:column];
        [self increaseSize];
        frames++;
    } else if (frames == 1) {
        NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Test1"];
        [[column headerCell] setStringValue:@"Test1"];
        [column setWidth:150];
        [self.tableView addTableColumn:column];
        [self increaseSize];
        frames++;
    }
}

@end
