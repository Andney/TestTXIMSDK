#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addButtonsWithTitles:@[@"下一页"]];
}

- (void)actionButtonClick:(UIButton *)sender action:(NSString *)action {
    if ([action isEqualToString:@"下一页"]) {
        DetailViewController *vc = [DetailViewController new];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
