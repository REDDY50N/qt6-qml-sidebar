#ifndef TERMINAL_PROCESS_H
#define TERMINAL_PROCESS_H

#include <QProcess>
#include <QObject>
#include <QQmlContext>

class TerminalProcess : public QObject
{
    Q_OBJECT

public:
    explicit TerminalProcess(QObject *parent = nullptr);

    // Methode zum Ausführen von Befehlen mit Argumenten
    Q_INVOKABLE void executeCommand(const QString &command);

signals:
        void outputReceived(const QString &output);

    private slots:
        void onReadyRead();
};

#endif // TERMINAL_PROCESS_H
