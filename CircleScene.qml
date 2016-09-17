import QtQuick 2.6 as QQ2

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	ModelingCamera {
		id:camera
	}

	RenderSettings1 {
		camera: camera
	}

	property real cRatio: .96
	property real iRatio: .895
	property real radius: .5 * cRatio
	property real height: .66
	property real iHeight: .6
	property real bHeight: iHeight/5
	property real lw: 3.
	property real eps:1e-3
	property alias pos1: machine1.pos
	property alias pos2: machine2.pos

	property alias machine1: machine1


	Excavator {
		id: machine1
		radius: root.radius
		y: height-iHeight+bHeight/2
	}

	Excavator {
		id: machine2
		pos: 180
		radius: root.radius
		y: height-iHeight+bHeight/2
	}

	StandBoard {
		transform: Transform {
			scale3D: Qt.vector3d(.06*radius, 1., bHeight)
			translation: Qt.vector3d(.87*root.radius*Math.cos(machine1.pos * Math.PI / 180),
									 height-iHeight+bHeight/2,
									 -.87*root.radius*Math.sin(machine1.pos * Math.PI / 180))
			rotationX: 90
			rotationY: machine1.pos
		}
	}

	StandBoard {
		color: "#f1f3de"
		transform: Transform {
			scale3D: Qt.vector3d(.06*radius, 1., bHeight)
			translation: Qt.vector3d(.87*root.radius*Math.cos(machine2.pos * Math.PI / 180),
									 height-iHeight+bHeight/2,
									 -.87*root.radius*Math.sin(machine2.pos * Math.PI / 180))
			rotationX: 90
			rotationY: machine2.pos
		}
	}


	Circle {
		linewidth: lw
		radius: root.radius
	}

	MinePlane {
		id: mine
		radius: root.radius * cRatio
		transform: Transform {
			translation: Qt.vector3d(0,-4e-2,0)
		}
	}

	Line {
		linewidth: lw
		transform: Transform {
			rotationX: 90
			translation: Qt.vector3d(-radius, height/2, 0)
			scale3D: Qt.vector3d(1, 1, height)
		}
	}

	Line {
		linewidth: lw
		transform: Transform {
			rotationX: 90
			translation: Qt.vector3d(radius, height/2, 0)
			scale3D: Qt.vector3d(1, 1, height)
		}
	}

	Line {
		linewidth: lw
		transform: Transform {
			rotationX: 90
			translation: Qt.vector3d(-radius*iRatio, height-iHeight/2, 0)
			scale3D: Qt.vector3d(1, 1, iHeight)
		}
	}

	Line {
		linewidth: lw
		transform: Transform {
			rotationX: 90
			translation: Qt.vector3d(radius*iRatio, height-iHeight/2, 0)
			scale3D: Qt.vector3d(1, 1, iHeight)
		}
	}

	Circle {
		linewidth: lw
		radius: root.radius*iRatio
		transform: Transform {
			translation: Qt.vector3d(0, height-iHeight, 0)
		}
	}


	HalfCircle {
		linewidth: lw
		radius: root.radius*iRatio
		transform: Transform {
			translation: Qt.vector3d(0, height-iHeight+bHeight/2, 0)
		}
	}


	Circle {
		linewidth: lw
		radius: root.radius
		transform: Transform {
			translation: Qt.vector3d(0, height, 0)
		}
	}


	Circle {
		linewidth: lw
		radius: root.radius*iRatio
		transform: Transform {
			translation: Qt.vector3d(0, height+eps, 0)
		}
	}
}
