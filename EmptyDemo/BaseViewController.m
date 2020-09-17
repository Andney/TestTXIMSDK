#import "BaseViewController.h"
#import <Masonry/Masonry.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addButtonsWithTitles:(NSArray<NSString *> *)actionTitles {
    if (actionTitles.count < 1) {
        return;
    }

    UIView *oldContentView = [self.view viewWithTag:987];
    if (oldContentView) {
        [oldContentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [oldContentView removeFromSuperview];
        oldContentView = nil;
    }

    UIView *contentView = [UIView new];
    contentView.tag = 987;
    [self.view addSubview:contentView];

    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(180);
    }];

    UIView *preView = nil;
    for (NSString *title in actionTitles) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        button.layer.cornerRadius = 4;
        button.backgroundColor = [UIColor systemBlueColor];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(m_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];

        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (preView) {
                make.top.equalTo(preView.mas_bottom).offset(15);
                make.left.right.and.height.equalTo(preView);
            } else {
                make.top.equalTo(contentView);
                make.left.right.equalTo(contentView);
                make.height.mas_equalTo(38);
            }
        }];

        preView = button;
    }

    [preView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(contentView);
    }];
}

- (void)m_buttonClick:(UIButton *)sender {
    [self actionButtonClick:sender action:sender.currentTitle];
}

- (void)actionButtonClick:(UIButton *)sender action:(NSString *)action {
}

- (void)closeViewController:(BOOL)animated {
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:animated];
        } else if (self.navigationController.presentingViewController) {
            [self.navigationController dismissViewControllerAnimated:animated completion:nil];
        }
    } else if (self.presentingViewController) {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
}

@end
