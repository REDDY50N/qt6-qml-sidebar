import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    anchors.fill: parent

    property int icon_size: 50          // Sidebar Icon Size
    property int selectedIndex: -1      // Save the index of the selected button

    // -- StackView for pages with initial page
    StackView {
        id: stack
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: sidebar.right  // Die linke Seite des StackViews wird an der rechten Seite der Sidebar verankert
        anchors.right: parent.right  // Der StackView nimmt den gesamten verbleibenden Platz ein
        initialItem: "pages/HomePage.qml"
    }

    // -- Sidebar button model
    ListModel {
        id: menuModel
        ListElement { name: qsTr("Test");         icon: "assets/icons/document.svg";    page: "pages/TestPage.qml" }
        ListElement { name: qsTr("Terminal");   icon: "assets/icons/terminal.svg";        page: "pages/TerminalPage.qml" }
        ListElement { name: qsTr("Settings");     icon: "assets/icons/settings.svg";    page: "pages/SettingsPage.qml" }
    }

    // -- Sidebar
    Rectangle {
        id: sidebar
        width: 120  // Sidebar Breite
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left


        gradient: Gradient {
            GradientStop { position: 0.0; color: "#252f35" } // Dunkleres Blau-Grau oben
            GradientStop { position: 1.0; color: "#424649" } // Helleres Blau-Grau unten
        }

        opacity: 0.9

       
        border.color: "#2A3A42"
        border.width: 2

        GridLayout {
            id: topBar
            rowSpacing: 5
            columns: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5

            // -- separator (only needed if a logo is placed on top of the sidebar)
            /*
            Rectangle {
                Layout.columnSpan: 1
                Layout.fillWidth: true
                height: 2
                //color: "#225732"
                color: "#225732"
            }
            */


            // Repeater for Sidebar buttons
            Repeater {
                model: menuModel
                delegate:
                    ToolButton {
                        id: sidebarButton
                        Layout.minimumWidth: parent.width
                        Layout.maximumWidth: parent.width
                        font.bold: true
                        //font.family: "Ubuntu"
                        font.family: "assets/fonts/Lato-Regular.ttf"
                        font.pixelSize: 12
                        Material.foreground: "white"
                        display: AbstractButton.TextUnderIcon

                        /*
                        // Selected indicator background color
                        background: Rectangle {
                            anchors.fill: parent
                            //color: (index === selectedIndex) ? "#CDCDCD" : isSelected ?  "#F6F6F6" : "#E4E4E4"
                            color: (index === selectedIndex) ? "limegreen" : (parent.down ? "#1A2A31" : (parent.hovered ? "#091d30" : "#2E3B44"))
                            //radius: parent.width < 50 ? 80 : 0
                            radius: 10
                        }
                        */

                        // -- Selected button indicator (| on the left)
                        Rectangle {
                            id: leftBorderIndicator
                            visible: index === selectedIndex
                            width: 3
                            height: parent.height
                            //color: "#5D5F61" // grey
                            color: "limegreen"
                        }


                        text: model.name
                        icon.source: model.icon
                        icon.height: icon_size
                        icon.width: icon_size
                        //icon.color: "white"
                        icon.color: (index === selectedIndex) ? "limegreen" : "white"

                        onClicked: {
                            stack.replace(model.page)   // Switch stack view pages
                            selectedIndex = index       // Set current button index

                        }
                    }
            }
        }
    }

}
