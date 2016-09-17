import QtQuick 2.7

Item {
	id: root

	property var dark: {
		"red": "DarkRed",
		"brown": "Maroon",
		"cyan": "Teal",
		"purple": "DarkSlateBlue",
		"gray": "DarkSlateGray",
	}

	property color darkDream


	property int shiftDuration: 10000

	SequentialAnimation {
		running: true
		loops: Animation.Infinite


		ColorAnimation { target: root; property: "darkDream"; from: dark.purple; to: dark.red; duration: shiftDuration }
		ColorAnimation { target: root; property: "darkDream"; from: dark.red; to: dark.brown; duration: shiftDuration }
		ColorAnimation { target: root; property: "darkDream"; from: dark.brown; to: dark.gray; duration: shiftDuration }
		ColorAnimation { target: root; property: "darkDream"; from: dark.gray; to: dark.cyan; duration: shiftDuration }
		ColorAnimation { target: root; property: "darkDream"; from: dark.cyan; to: dark.purple; duration: shiftDuration }
	}
}
