import QtQuick 2.0

Item {
	id: root
	implicitHeight: 50
	implicitWidth: 80


	property alias color: button.color
	property alias discription: dText.text
	property alias status: bText.text

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
		id: button
		height: parent.height / 2
		width: parent.width
		y: parent.height / 2
		border.color: "#232323"
		border.width: 2

		color: "yellow"
		property color oColor: color

		Text {
			id: bText
			anchors.centerIn: parent
			font.pixelSize: 12
			font.bold: true
			text: "status"
		}

		MouseArea {
			id: mouse
			anchors.fill: parent

			onPressed: {
				button.oColor = button.color
				button.color = Qt.rgba(button.color.r, button.color.g,
									 button.color.b, 0.5)
			}

			onReleased: button.color = button.oColor

			onExited: button.color = button.oColor
		}
	}
}
