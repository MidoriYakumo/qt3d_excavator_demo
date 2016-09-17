import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0


RenderSettings {
	id: renderSettings
	property Camera camera
	activeFrameGraph: Viewport {
		RenderSurfaceSelector {
			RenderPassFilter {
				matchAny: FilterKey { name: "pass"; value: "surface" }
				CameraSelector {
					camera: renderSettings.camera
					ClearBuffers {
						buffers: ClearBuffers.ColorDepthBuffer
						clearColor: "#ffffff"
					}
				}
			}
			RenderPassFilter {
				matchAny: FilterKey { name: "pass"; value: "color" }
				CameraSelector {
					camera: renderSettings.camera
				}
			}
			RenderPassFilter {
				matchAny: FilterKey { name: "pass"; value: "frameline" }
				CameraSelector {
					camera: renderSettings.camera
				}
			}
		}
	}

}
