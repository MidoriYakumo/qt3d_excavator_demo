import Qt3D.Core 2.0
import Qt3D.Render 2.0

Camera {
	projectionType: CameraLens.OrthographicProjection
	position: Qt.vector3d(0.6, 0.5, 1)
	viewCenter: Qt.vector3d(0.6, 0 ,0)
}

