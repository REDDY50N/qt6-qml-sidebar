import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Page {
    title: "Settings"

    Rectangle {
        width: parent.width
        height: parent.height
        //color: "#F4F4F4"

        // -- Gradient background color
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#252f35" }
            GradientStop { position: 1.0; color: "#424649" }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Settings ..."
                font.pixelSize: 24
                color: "white"
            }

        }
    }
}
