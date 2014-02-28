#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif
    void KLR_set_root_view_controller_func(UIViewController*(*getViewController)());
    void KLR_set_unity_pause_func(void(*UnityPause)(bool pause));
#ifdef __cplusplus
}
#endif
