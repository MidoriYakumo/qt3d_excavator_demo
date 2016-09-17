import QtQuick 2.7 as QQ2

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	property alias color: material.color
	property Transform transform

	PlaneMesh {
		id: mesh
	}

	ColorFrameMaterial {
		id: material
		color: "#009edb"
		linewidth: Qt.vector4d(.12, .04, .12, .04).times(1.5)
	}


	components: [mesh, material, transform]
}
