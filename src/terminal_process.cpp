#include "terminal_process.h"

#include <QObject>


TerminalProcess::TerminalProcess(QObject *parent) {
}

void TerminalProcess::executeCommand(const QString &command) {
    QStringList args = command.split(" ", Qt::SkipEmptyParts);  // Befehl und Argumente trennen
    if (args.isEmpty()) return;

    QString cmd = args.takeFirst();  // Der erste Teil ist der Befehl
    auto *process = new QProcess(this);
    connect(process, &QProcess::readyReadStandardOutput, this, &TerminalProcess::onReadyRead);
    process->start(cmd, args);  // Befehl mit Argumenten ausführen
}

void TerminalProcess::onReadyRead() {
    auto *process = qobject_cast<QProcess *>(sender());
    if (process) {
        QString output = process->readAllStandardOutput();
        emit outputReceived(output);
    }
}
