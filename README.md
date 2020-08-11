This is a port of the well-known Qt 5 Cinematic Experience demo to
Qt 6, the new QRhi-based rendering path of Qt Quick, and CMake.
Everything, including shader effects and particles are expected to
be functional regardless of running on Vulkan, Metal, D3D11 or OpenGL.

As Qt 6.0 (dev branch of qtbase, qtdeclarative, qtshadertools) is work
in progress at the time of writing, there is no guarantee everything will
work as-is.



Original readme below.
---------------------------------------------------------------------

INTRO
==========

This UX demo application presents some graphical features of Qt5. 
The name 'Cinematic Experience' reflects how it's possible to build user 
interfaces with increased dynamics.


RUNNING
==========

To run this application you need relatively recent build of Qt5:
- http://qt-project.org
- http://qt.gitorious.org/qt/qt5

There are two different ways to run the application:

1) If your target platform contains 'qmlscene' binary, just use it:
---
cd Qt5_CinematicExperience
[path to Qt5]/qtbase/bin/qmlscene Qt5_CinematicExperience.qml
---

2) Alternatively, a simple launcher is provided to start the application:
---
cd Qt5_CinematicExperience
[path to Qt5]/qtbase/bin/qmake
make
./Qt5_CinematicExperience
---

The run application in fullscreen mode, use '--fullscreen' parameter for 
qmlscene or launcher. If you want to tweak the window resolution, 
modify 'width' and 'height' properties in Qt5_CinematicExperience.qml


LICENSE
==========

Source codes are licensed under a Creative Commons Attribution 3.0 Unported 
License. http://creativecommons.org/licenses/by/3.0/

No attribution required, but feel free to mention us or 
contact info@quitcoding.com

Qt, and the Qt logo are trademarks of Nokia Corporation
Movie reviews copyright (c) IMDb.com
DVD cover icons from http://www.iconarchive.com
