import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Page {
    id: root
    title: "Terminal"

    Rectangle {
        id: rootRect
        width: root.width
        height: root.height
        //color: "#e0e0e0"
        // -- Gradient background color
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#252f35" }
            GradientStop { position: 1.0; color: "#424649" }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            Column {
                Layout.fillWidth: true // Best Practice: Preferred over anchors.fill
                Layout.fillHeight: true
                spacing: 20

                Text {
                    text: "Terminal"
                    font.pixelSize: 24
                    font.weight: 600
                    color: "white"
                }

                // -- Scrollable console output
                ScrollView {
                    width: parent.width
                    height: parent.height - controlRow.height*2

                    TextArea {
                        id: outputArea
                        readOnly: true
                        wrapMode: TextArea.Wrap
                        color: "darkred"
                        text: "$>\n" // start with empty console
                    }
                }


                RowLayout {
                    id: controlRow
                    width: parent.width

                    TextField {
                        id: commandInput
                        placeholderText: "Enter command"
                        color: "white"
                        implicitWidth: 80
                        Layout.preferredWidth: 80 // Best Practice: Responsive UI
                        Layout.fillWidth: true
                        onAccepted: {
                            terminalProcess.executeCommand(commandInput.text)
                            commandInput.text = ""
                        }
                    }

                    Button {
                        id: clearButton
                        text: "Clear"
                        implicitWidth: 10
                        Layout.preferredWidth: 10
                        Layout.fillWidth: true
                        onClicked: {
                            terminalProcess.executeCommand(commandInput.text)
                            outputArea.text = ""
                        }
                    }

                    // -- Run the terminal command
                    Button {
                        id: enterButton
                        text: "Run"
                        implicitWidth: 10
                        Layout.preferredWidth: 10
                        Layout.fillWidth: true
                        onClicked: {
                            terminalProcess.executeCommand(commandInput.text)
                            commandInput.text = ""
                        }
                    }


                }

                // -- Connect the output signal from cpp to the TextArea
                Connections {
                    target: terminalProcess

                    function onOutputReceived(output) {
                        outputArea.text += output + "\n"
                    }


                }
            }
        }
    }
}
