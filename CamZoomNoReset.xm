#import <substrate.h>

@interface PLCameraController
+ (id)sharedInstance;
- (float)zoomFactor;
@end

@interface PLCameraView
- (void)_setZoomFactor:(float)factor;
@end

@interface PLCameraZoomSlider : UISlider
- (void)makeInvisible;
@end

%hook PLCameraView

- (void)_resetZoom
{
	return;
}

- (void)cameraControllerPreviewDidStart:(id)arg
{
	%orig;
	// iOS 4
	if (![(NSObject *)self respondsToSelector:@selector(_resetZoom)]) {
		PLCameraZoomSlider *slider = MSHookIvar<PLCameraZoomSlider *>(self, "_zoomSlider");
		float zoomFactor = [[%c(PLCameraController) sharedInstance] zoomFactor];
		[slider setValue:zoomFactor];
   		[self _setZoomFactor:zoomFactor];
	}
}

%end