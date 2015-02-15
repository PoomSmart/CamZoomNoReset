#import "../PS.h"

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
		CGFloat zoomFactor = [[%c(PLCameraController) sharedInstance] zoomFactor];
		[slider setValue:zoomFactor];
   		[self _setZoomFactor:zoomFactor];
	}
}

%end