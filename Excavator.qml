import QtQuick 2.6 as QQ2

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	property real pos: Math.random()
	property real angle0: Math.random()*-90
	property real angle1: Math.random()*30
	property real angle2: Math.random()*90
	property real radius: 1.
	property real y: 0.2

	property vector3d joint0: Qt.vector3d(-11.69973, 1.59875, 1.)
	property vector3d joint1: Qt.vector3d(-22.08812, -5.44126, 1.)

	property Transform transform: Transform {
		scale: 0.015
		translation: Qt.vector3d(.85*radius*Math.cos(pos * Math.PI / 180), y,
								 -.85*radius*Math.sin(pos * Math.PI / 180))
		rotation: fromAxisAndAngle(Qt.vector3d(0,1,0), pos)
	}

	Transform {
		id: transform0
		rotation: fromAxisAndAngle(Qt.vector3d(0,0,1), angle0)
	}

	Transform {
		id: transform1
		matrix: transform0.matrix.times(rotateAround(joint0, angle1, Qt.vector3d(0,0,1)))
	}

	Transform {
		id: transform2
		matrix: transform1.matrix.times(rotateAround(joint1, angle2, Qt.vector3d(0,0,1)))
	}

	Entity {
		id: arm0

		Mesh {
			id: arm0Mesh
			source: "objects/excavator_arm0.obj"
		}


		components: [arm0Mesh, fillMaterial, transform0]
	}

	Entity {
		id: arm0Wire

		Mesh {
			id: arm0WireMesh
			source: "objects/excavator_arm0_wire.obj"
		}


		components: [arm0WireMesh, wireMaterial, transform0]
	}

	Entity {
		id: arm1

		Mesh {
			id: arm1Mesh
			source: "objects/excavator_arm1.obj"
		}


		components: [arm1Mesh, fillMaterial, transform1]
	}

	Entity {
		id: arm1Wire

		Mesh {
			id: arm1WireMesh
			source: "objects/excavator_arm1_wire.obj"
		}


		components: [arm1WireMesh, wireMaterial, transform1]
	}


	Entity {
		id: bucket

		Mesh {
			id: bucketMesh
			source: "objects/excavator_bucket.obj"
		}


		components: [bucketMesh, fillMaterial, transform2]
	}

	Entity {
		id: bucketWire

		Mesh {
			id: bucketWireMesh
			source: "objects/excavator_bucket_wire.obj"
		}


		components: [bucketWireMesh, wireMaterial, transform2]
	}

	ColorMaterial {
		id: fillMaterial
		color: "#e7e824"
	}

	ColorMaterial {
		id: wireMaterial
		color: "#232323"
	}

	components: [transform]


	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite
		QQ2.PauseAnimation {
			duration: 2000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle0"
			duration: 3000
			from: -60.
			to: 0.
		}
		QQ2.PauseAnimation {
			duration: 1000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle0"
			duration: 3000
			from: 0.
			to: -60.
		}
		QQ2.PauseAnimation {
			duration: 1000
		}
	}


	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite
		QQ2.PauseAnimation {
			duration: 2000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle1"
			duration: 3000
			from: 90.
			to: 0.
		}
		QQ2.PauseAnimation {
			duration: 1000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle1"
			duration: 3000
			from: 0.
			to: 90.
		}
		QQ2.PauseAnimation {
			duration: 1000
		}
	}

	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite
		QQ2.PauseAnimation {
			duration: 3000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle2"
			duration: 2000
			from: 90.
			to: 0.
		}
		QQ2.PauseAnimation {
			duration: 0000
		}
		QQ2.NumberAnimation {
			target: root
			property: "angle2"
			duration: 3000
			from: 0.
			to: 90.
		}
		QQ2.PauseAnimation {
			duration: 2000
		}
	}

	QQ2.Behavior on pos {
		QQ2.NumberAnimation {
			duration: 1000
			easing.type: Easing.InOutQuad
		}
	}

	QQ2.Timer {
		running: true
		interval: 10000
		repeat: true

		onTriggered: root.pos += (Math.random()-.5)*180
// 		onTriggered: root.pos += (Math.random()-.3)*180
	}

}
