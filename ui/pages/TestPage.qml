import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Page {
    title: "Homepage"

    Rectangle {
        width: parent.width
        height: parent.height

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#252f35" } // Dunkleres Blau-Grau oben
            GradientStop { position: 1.0; color: "#424649" } // Helleres Blau-Grau unten
        }

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Test page ..."
                font.pixelSize: 24
                color: "white"
            }
        }
    }
}
