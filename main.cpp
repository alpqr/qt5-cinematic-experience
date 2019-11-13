#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    bool fullscreen = false;
    if (argc > 1) {
        const QString arg = QString::fromLatin1(argv[1]).toLower();
        if (arg == QLatin1String("--fullscreen"))
            fullscreen = true;
    }
    if (fullscreen)
        view.showFullScreen();
    else
        view.show();

    return app.exec();
}
