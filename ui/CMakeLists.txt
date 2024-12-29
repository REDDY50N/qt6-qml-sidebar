qt_add_qml_module(${EXEC_NAME}
        URI ${QML_URI}
        VERSION 1.0
        #RESOURCE_PREFIX /myorg/imports
        QML_FILES
        Main.qml
        Main2.qml
        Sidebar.qml
        SidebarQC.qml
        SideButton.qml

        pages/HomePage.qml
        pages/TerminalPage.qml
        pages/TestPage.qml
        pages/SettingsPage.qml

        RESOURCES
        assets/icons/document.svg
        assets/icons/todo.svg
        assets/icons/terminal.svg
        assets/icons/diagnosis.svg
        assets/icons/settings.svg
        assets/icons/calendar.svg

        assets/fonts/Lato-Regular.ttf
)
