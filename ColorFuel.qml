import QtQuick 2.0

Item {
	id: root
	implicitHeight: 50
	implicitWidth: 80

	property alias color: button.color
	property alias discription: dText.text
	property string unit

	property real value: 0.5
	property real minValue: 0.
	property real maxValue: 1.

	Item {
		height: parent.height / 2
		width: parent.width
		Text {
			id: dText
			anchors.centerIn: parent
			font.pixelSize: 12
			font.bold: true
			text: "discription"
		}
	}

	Rectangle {
		height: parent.height / 2
		width: parent.width
		y: parent.height / 2
		border.color: "#232323"
		border.width: 2

		Item {
			width: parent.width
			height: parent.height*2/3
			Text {
				id: bText
				anchors.centerIn: parent
				font.pixelSize: 12
				font.bold: true
				text: root.value + root.unit
			}
		}

		Rectangle {
			id: button
			color: "yellow"
			border.color: "#232323"
			border.width: 2
			y:parent.height*2/3
			width: parent.width*(root.value-root.minValue)/(root.maxValue-root.minValue)
			height: parent.height/3
		}

	}

	Text {
		x: 0
		y: root.height-4
		text: root.minValue
		font.pixelSize: 10
	}
	Text {
		x: root.width/2-paintedWidth/2
		y: root.height-4
		text: (root.minValue+root.maxValue)/2
		font.pixelSize: 10
	}
	Text {
		x: root.width-paintedWidth
		y: root.height-4
		text: root.maxValue
		font.pixelSize: 10
	}
}
