#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>
#include <QSGRendererInterface>

// ### this will get an easy to use property later on, in the meantime do it ourselves the hard way
class BackendGetter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQuickItem *srcItem READ srcItem WRITE setSrcItem)
    Q_PROPERTY(QString backendName READ backendName NOTIFY backendNameChanged)

public:
    QQuickItem *srcItem() const { return m_srcItem; }
    void setSrcItem(QQuickItem *item);
    QString backendName() const { return m_backendName; }

signals:
    void backendNameChanged();

private slots:
    void updateAPI(QQuickWindow *w);
    void onSGReady();

private:
    QString m_backendName;
    QQuickItem *m_srcItem;
};

void BackendGetter::setSrcItem(QQuickItem *item)
{
    m_srcItem = item;
    if (m_srcItem) {
        QQuickWindow *w = m_srcItem->window();
        if (w)
            updateAPI(w);
        else
            connect(item, SIGNAL(windowChanged(QQuickWindow*)), this, SLOT(updateAPI(QQuickWindow*)));
    }
}

void BackendGetter::updateAPI(QQuickWindow *w)
{
    if (!w)
        return;

    if (!w->isSceneGraphInitialized()) {
        connect(w, SIGNAL(sceneGraphInitialized()), this, SLOT(onSGReady()));
        return;
    }

    QSGRendererInterface *rif = w->rendererInterface();
    if (!rif)
        return;

    switch (rif->graphicsAPI()) { // this is the only RIF function that is safe to call on the gui/main thread
    case QSGRendererInterface::OpenGL:
        m_backendName = QLatin1String("OpenGL");
        break;
    case QSGRendererInterface::Direct3D12:
        m_backendName = QLatin1String("Direct3D 12");
        break;
    default:
        m_backendName = QLatin1String("UNKNOWN");
        break;
    }

    emit backendNameChanged();
}

void BackendGetter::onSGReady()
{
    updateAPI(m_srcItem->window());
}

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    qmlRegisterType<BackendGetter>("Cinematic", 1, 0, "BackendGetter");
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    const QString lowerArgument = QString::fromLatin1(argv[1]).toLower();
    if (lowerArgument == QLatin1String("--fullscreen")) {
        view.showFullScreen();
    } else {
        view.show();
    }
    return app.exec();
}

#include "main.moc"
