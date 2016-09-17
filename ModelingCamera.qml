import Qt3D.Core 2.0
import Qt3D.Render 2.0

Camera {
	projectionType: CameraLens.OrthographicProjection
	position: Qt.vector3d(0, .75, 1)
	viewCenter: Qt.vector3d(0, .33 ,0)
}

