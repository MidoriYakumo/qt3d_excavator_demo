import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	property real linewidth: 2.
	property alias color: material.color
	property Transform transform

	PlaneMesh {
		id: mesh
		height: 1.
		width: root.linewidth/app.sceneWidth
		meshResolution: Qt.size(2, 2)
//			primitiveType: GeometryRenderer.LineLoop
	}

	ColorMaterial {
		id:material
		color: "#232323"
	}


	components: [mesh, material, transform]
}
