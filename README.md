This is a port of the well-known Qt 5 Cinematic Experience demo to
the upcoming, proof-of-concept Direct3D 12 backend of Qt Quick.

The only real change is the addition of pre-compiled HLSL shaders.
This way the same application bulild works both with OpenGL and
when requesting D3D12 via setting the QT_QUICK_BACKEND environment
variable to d3d12.

This requires the wip/scenegraphng branch of qtdeclarative which is
expected to merge back to dev in time for 5.8.

Particles are not currently supported. Distance field based text
rendering is missing as well. Apart from these, the behavior and look
should be the same.

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
