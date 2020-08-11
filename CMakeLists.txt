cmake_minimum_required(VERSION 3.14)
project(qt5-cinematic-experience LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Quick)

add_qt_gui_executable(qt5-cinematic-experience
    main.cpp
)
target_link_libraries(qt5-cinematic-experience PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Quick
)

set(cinematic_resource_files
    "content/Background.qml"
    "content/Button.qml"
    "content/CurtainEffect.qml"
    "content/DelegateItem.qml"
    "content/DetailsView.qml"
    "content/FpsItem.qml"
    "content/InfoView.qml"
    "content/InfoViewItem.qml"
    "content/MainView.qml"
    "content/MoviesModel.qml"
    "content/RatingsItem.qml"
    "content/SettingsView.qml"
    "content/Switch.qml"
    "content/images/1.png"
    "content/images/10.png"
    "content/images/11.png"
    "content/images/12.png"
    "content/images/13.png"
    "content/images/14.png"
    "content/images/15.png"
    "content/images/16.png"
    "content/images/17.png"
    "content/images/18.png"
    "content/images/19.png"
    "content/images/2.png"
    "content/images/20.png"
    "content/images/3.png"
    "content/images/4.png"
    "content/images/5.png"
    "content/images/6.png"
    "content/images/7.png"
    "content/images/8.png"
    "content/images/9.png"
    "content/images/background.png"
    "content/images/background3.png"
    "content/images/button.png"
    "content/images/cc-by_logo.png"
    "content/images/cover_nmap.png"
    "content/images/grip.png"
    "content/images/heading.png"
    "content/images/heading_big.png"
    "content/images/info.png"
    "content/images/panel_bg.png"
    "content/images/particle.png"
    "content/images/planet_sprite.png"
    "content/images/qt_ambassador_logo.png"
    "content/images/qt_logo.png"
    "content/images/qt_logo2.png"
    "content/images/quit_logo.png"
    "content/images/sc1.png"
    "content/images/sc2.png"
    "content/images/sc3.png"
    "content/images/sc4.png"
    "content/images/sc5.png"
    "content/images/settings.png"
    "content/images/smoke.png"
    "content/images/spinner.png"
    "content/images/star.png"
    "content/images/stars.png"
    "content/images/stars2.png"
    "content/images/switch_background.png"
    "content/images/switch_frame.png"
    "content/images/switch_on.png"
    "content/images/switch_thumb.png"
    "main.qml"
    "rhishaders/button.frag.qsb"
    "rhishaders/curtain.frag.qsb"
    "rhishaders/curtain.vert.qsb"
    "rhishaders/lighting.frag.qsb"
    "rhishaders/switch.frag.qsb"
)

qt6_add_resources(qt5-cinematic-experience "cinematic"
    PREFIX
        "/"
    FILES
        ${cinematic_resource_files}
)
