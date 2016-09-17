import QtQuick 2.7 as QQ2

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	property alias radius: material.radius
	property alias rotation: material.rotation

	property Transform transform

	PlaneMesh {
		id: mesh
		height: root.radius * 1.99
		width: root.radius * 1.99
//		meshResolution: Qt.size(32, 32)
		meshResolution: Qt.size(128, 128)
//		primitiveType: GeometryRenderer.LineStrip
	}

	DepthMaterial {
		id: material
		radius: 1.
//		resolution:
	}


	components: [mesh, material, transform]
}
