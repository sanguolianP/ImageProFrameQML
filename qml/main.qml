import QtQuick 2.12
import QtQuick.Window 2.12

Window {

    id:mainW

    visible: true;
    width: Screen.desktopAvailableWidth * 2/3;
    height: Screen.desktopAvailableHeight * 2/3;
    minimumWidth: 640;
    minimumHeight: 360;
    title: qsTr("IPFW");

//    color: "#272727";

    flags: Qt.CursorShape |  Qt.WindowSystemMenuHint |Qt.FramelessWindowHint |  Qt.WindowMinimizeButtonHint | Qt.Window;


//    property  alias mainWin: mainWin;

    //Main Window interface
//    mainInterface
//    {
//        id: mainWin;

//        anchors.fill: parent;
//        visible: true;
//    }





    TitleBar
    {
        id: titleBar_mainWin;

        anchors.left: parent.left;
        anchors.top: parent.top;
//        anchors.topMargin: -10;

        width: parent.width;
        height: 40;

        color: "#373737"
    }

    MyMenuBar
    {
        id: menuBar_mainWin;

        z:0.3
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.topMargin: 40;

        width: parent.width;
        height: 30;

        color: "#999999"
    }

//    Row
//    {
//        id: row_layout_mainWin;

//        anchors.top: parent.top;
//        anchors.topMargin: 70;

//        anchors.bottom: parent.bottom;
//        anchors.bottomMargin: 20;

//        anchors.fill: parent;

//        width: parent.width;
//        height: parent.height;


        CommonToolBar
        {
            id: commonToolBar_mainWin;

            z:0.1;
            anchors.top: parent.top;
            anchors.topMargin: 70;

            anchors.horizontalCenter: parent.horizontalCenter;

//            width: parent.width;
                width: mainW.width - 40;
            height: 45;
//            color: "#666666";

        }
        LeftDockWin
        {
            id: leftDockWin_mainWin;

            z:0.2;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.topMargin: 70;

            width: 150;
            height: parent.height;
            color: "#eeeeee";
        }



        RightDockWin
        {
            id: rightDockWin_mainWin;

            z:0.2;
            anchors.right:parent.right;
            anchors.top: parent.top;
            anchors.topMargin: 70;

            width: 250;
            height: parent.height;
            color: "#eeeeee";
        }


//    }


    StateBar
    {
        id: stateBar_mainWin;

        z:0.3;
        anchors.bottom: parent.bottom;
        width: parent.width;
        height: 30;
        color: "#777777";
    }


    //BackGround
    Image
    {
        id: imageBG;

        anchors.fill: parent;
        source: "images/Main/WindowBG.png";
    }

    MouseArea {

        id:allMouseArea

//        property bool closeAll: false;

        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
        anchors.fill: parent
        property var window: mainW;

        property int borderWidth: 8
        property int minimumWidth: mainW.minimumWidth
        property int minimumHeight: mainW.minimumHeight
        property int maximumWidth: 0
        property int maximumHeight: 0

        property int resizing: 0
        property real firstWidth: 0
        property real firstHeight: 0
        property real firstMouseX: 0
        property real firstMouseY: 0

        function getValidWidth(width) {
            if (minimumWidth > 0 && width < minimumWidth)
                return minimumWidth;

            if (maximumWidth > minimumWidth && width > maximumWidth)
                return maximumWidth;

            return width;
        }

        function getValidHeight(height) {
            if (minimumHeight > 0 && height < minimumHeight)
                return minimumHeight;

            if (maximumHeight > minimumHeight && height > maximumHeight)
                return maximumHeight;

            return height;
        }

        function getMousePosition(window, mouseX, mouseY) {
            if (mouseX < borderWidth) {
                if (mouseY < borderWidth) {
                    return 1; // left top
                } else if (mouseY < window.height - borderWidth) {
                    return 2; // left
                } else {
                    return 3; // left bottom
                }
            } else if (mouseX < window.width - borderWidth) {
                if (mouseY < borderWidth) {
                    return 4; // top
                } else if (mouseY < window.height - borderWidth) {
                    return 5; // center
                } else {
                    return 6; // bottom
                }
            } else {
                if (mouseY < borderWidth) {
                    return 7; // right top
                } else if (mouseY < window.height - borderWidth) {
                    return 8; // right
                } else {
                    return 9; // right bottom
                }
            }
        }

        function getCursorShape(window, mouseX, mouseY) {
            switch (getMousePosition(window, mouseX, mouseY)) {
            case 1: return Qt.SizeFDiagCursor;
            case 2: return Qt.SizeHorCursor;
            case 3: return Qt.SizeBDiagCursor;
            case 4: return Qt.SizeVerCursor;
            case 5: return Qt.ArrowCursor;
            case 6: return Qt.SizeVerCursor;
            case 7: return Qt.SizeBDiagCursor;
            case 8: return Qt.SizeHorCursor;
            case 9: return Qt.SizeFDiagCursor;
            default: break;
            }

            return Qt.ArrowCursor;
        }

        function resizeLeftTop(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;
            var offsetY = mouseY - firstMouseY;

            var x = window.x + offsetX;
            var y = window.y + offsetY;
            var width = window.width - offsetX;
            var height = window.height - offsetY;

            // Lock-in maximum and minimum
            offsetX = width - getValidWidth(width);
            offsetY = height - getValidHeight(height);
            x = x + offsetX;
            width = width - offsetX;
            y = y + offsetY;
            height = height - offsetY;

            window.x = x;
            window.y = y;
            window.width = width;
            window.height = height;
        }

        function resizeLeft(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;

            var x = window.x + offsetX;
            var width = window.width - offsetX;

            // Lock-in maximum and minimum
            offsetX = width - getValidWidth(width);
            x = x + offsetX;
            width = width - offsetX;

            window.x = x;
            window.width = width;
        }

        function resizeLeftBottom(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;
            var offsetY = mouseY - firstMouseY;

            var x = window.x + offsetX;
            var width = window.width - offsetX;
            var height = firstHeight + offsetY;

            // Lock-in maximum and minimum
            offsetX = width - getValidWidth(width);
            x = x + offsetX;
            width = width - offsetX;
            height = getValidHeight(height);

            window.x = x;
            window.width = width;
            window.height = height;
        }

        function resizeTop(window, mouseX, mouseY) {
            var offsetY = mouseY - firstMouseY;

            var y = window.y + offsetY;
            var height = window.height - offsetY;

            // Lock-in maximum and minimum
            offsetY = height - getValidHeight(height);
            y = y + offsetY;
            height = height - offsetY;

            window.y = y;
            window.height = height;
        }

        function resizeBottom(window, mouseX, mouseY) {
            var offsetY = mouseY - firstMouseY;

            var height = firstHeight + offsetY;

            // Lock-in maximum and minimum
            height = getValidHeight(height);

            window.height = height;
        }

        function resizeRightTop(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;
            var offsetY = mouseY - firstMouseY;

            var y = window.y + offsetY;
            var width = firstWidth + offsetX;
            var height = window.height - offsetY;

            // Lock-in maximum and minimum
            offsetY = height - getValidHeight(height);
            y = y + offsetY;
            width = getValidWidth(width);
            height = height - offsetY;

            window.y = y;
            window.width = width;
            window.height = height;
        }

        function resizeRight(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;

            var width = firstWidth + offsetX;

            // Lock-in maximum and minimum
            width = getValidWidth(width);

            window.width = width;
        }

        function resizeRightBottom(window, mouseX, mouseY) {
            var offsetX = mouseX - firstMouseX;
            var offsetY = mouseY - firstMouseY;

            var width = firstWidth + offsetX;
            var height = firstHeight + offsetY;

            // Lock-in maximum and minimum
            width = getValidWidth(width);
            height = getValidHeight(height);

            window.width = width;
            window.height = height;
        }

        function move(window, mouseX, mouseY) {
            window.x = window.x + (mouseX - firstMouseX);
            window.y = window.y + (mouseY - firstMouseY);
        }

        function resize(window, mouseX, mouseY) {
            switch (resizing) {
            case 1:
                resizeLeftTop(window, mouseX, mouseY);
                break;
            case 2:
                resizeLeft(window, mouseX, mouseY);
                break;
            case 3:
                resizeLeftBottom(window, mouseX, mouseY);
                break;
            case 4:
                resizeTop(window, mouseX, mouseY);
                break;
            case 5:
//                move(window, mouseX, mouseY);
                break;
            case 6:
                resizeBottom(window, mouseX, mouseY);
                break;
            case 7:
                resizeRightTop(window, mouseX, mouseY);
                break;
            case 8:
                resizeRight(window, mouseX, mouseY);
                break;
            case 9:
                resizeRightBottom(window, mouseX, mouseY);
                break;
            default:
                break;
            }
        }

        onPositionChanged: {
            if (resizing == 0) {
                cursorShape = getCursorShape(window, mouse.x, mouse.y);
            } else {
                resize(window, mouse.x, mouse.y);
            }
        }

        onPressed: {
            resizing = getMousePosition(window, mouseX, mouseY);
            firstWidth = window.width;
            firstHeight = window.height;
            firstMouseX = mouseX;
            firstMouseY = mouseY;
        }

        onReleased: {
            resizing = 0;
        }

        onClicked:
        {
            if(mouseX>500 || mouseY>200)
            {

//                closeAll = true;
//                console.log("closeAll");


//                MyMenuBar.rect_MenuFile.visible = false;
//                rect_MenuFile.visible = false;
//                rect_MenuEdit.visible = false;
//                rect_MenuTool.visible = false;
//                rect_MenuHelp.visible = false;
            }

        }

    }


}
