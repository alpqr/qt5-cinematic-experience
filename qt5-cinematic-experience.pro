TARGET = qt5-cinematic-experience

QT += quick

SOURCES = main.cpp

content.files = \
    *.qml \
    *.png \
    content
content.path = $$DESTPATH

OTHER_FILES += $${content.files}

RESOURCES += cinematic.qrc
