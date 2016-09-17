import Qt3D.Core 2.0
import Qt3D.Render 2.0

Entity {
	property Camera camera:ModelingCamera {
		id:camera
	}

	RenderSettings1 {
		camera: camera
	}

	Inputs0 {
		id: inputs
		camera: camera
	}

//	inputs.onOnFrameChange: {
////		console.log()
//	}
}

