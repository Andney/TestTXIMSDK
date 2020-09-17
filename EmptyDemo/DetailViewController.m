#import "DetailViewController.h"
#import <ImSDK/ImSDK.h>

@interface DetailViewController () <V2TIMSDKListener>
@property (nonatomic, assign) BOOL didInitSDK;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addButtonsWithTitles:@[@"返回", @"初始化SDK", @"释放SDK"]];
}

- (void)actionButtonClick:(UIButton *)sender action:(NSString *)action {
    NSLog(@"----%@", action);

    if ([action isEqualToString:@"返回"]) {
        [self closeViewController:YES];
    } else if ([action isEqualToString:@"初始化SDK"]) {
        if (!self.didInitSDK) {
            V2TIMSDKConfig *config = [[V2TIMSDKConfig alloc] init];
            config.logLevel = V2TIM_LOG_DEBUG;

            BOOL ret = [[V2TIMManager sharedInstance] initSDK:1400356129 config:nil listener:self];
            NSLog(@"初始化结果：%d", ret);

            self.didInitSDK = YES;
        }
    } else if ([action isEqualToString:@"释放SDK"]) {
        if (self.didInitSDK) {
            [[V2TIMManager sharedInstance] unInitSDK];
            self.didInitSDK = NO;
        }
    }
}

- (void)onConnecting {
    NSLog(@"%s", __func__);
}

- (void)onConnectSuccess {
    NSLog(@"%s", __func__);
}

- (void)closeViewController:(BOOL)animated {
    if (self.didInitSDK) {
        [[V2TIMManager sharedInstance] unInitSDK];
        self.didInitSDK = NO;
    }

    [super closeViewController:animated];
}

@end
