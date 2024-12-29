#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "terminal_process.h"

int main(int argc, char *argv[]) {
    // HINT: uncomment if you need a virtual keyboard
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("org.reddy.app", "Main"); // HINT: load QML modules here the Main.qml
    TerminalProcess terminalProcess;
    engine.rootContext()->setContextProperty("terminalProcess", &terminalProcess);
    return QGuiApplication::exec();
}
