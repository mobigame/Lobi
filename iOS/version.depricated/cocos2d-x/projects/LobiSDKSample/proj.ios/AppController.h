#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppController : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}
@property (nonatomic, strong) RootViewController *viewController;

- (void)openWebViewController;
- (void)openPostViewController;

@end

