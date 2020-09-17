#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)addButtonsWithTitles:(NSArray<NSString *> *)actionTitles;

- (void)actionButtonClick:(UIButton *)sender action:(NSString *)action;

- (void)closeViewController:(BOOL)animated;

@end
