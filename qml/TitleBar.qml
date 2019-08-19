import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle{

    id: rect_titleBar;
    z: 0.1;

    Text {

        id: text_titleBar;

        anchors.left: parent.left;
        anchors.leftMargin: 20;
        height: parent.height;
        horizontalAlignment: Text.AlignLeft;
        verticalAlignment: Text.AlignVCenter;

        color: "#eeeeee";
        font.family: "微软雅黑";
        font.pixelSize: 20;
        font.letterSpacing: 1;
        font.bold: true;

        text: "ImageProcessingFrameWork";
    }


    Row
    {
        id: row_titleBarButtonList;

        anchors.right: parent.right;
        anchors.rightMargin: 20;
        anchors.top: parent.top;
        anchors.topMargin: 5;
        height: parent.height;


        spacing: 8;

        TitleButton
        {
            width: 30;
            height: 30;
            sPressedImage: "images/Titlebar/MinOn.png";
            sNormalImage: "images/Titlebar/Min.png";
            sHoverImage: "images/Titlebar/MinOn.png";
//            nTextSize: 25;
//            sTextText: "-";
            state: "normal";
            nIndex: 0;
        }

        TitleButton
        {
            width: 30;
            height: 30;
            sPressedImage: "images/Titlebar/MaxOn.png";
            sNormalImage: "images/Titlebar/Max.png";
            sHoverImage: "images/Titlebar/MaxOn.png";
//            nTextSize: 15;
//            sTextText: "口";
            state: "normal";
            nIndex: 1;
        }

        TitleButton
        {
            width: 30;
            height: 30;
            sPressedImage: "images/Titlebar/CloseOn.png";
            sNormalImage: "images/Titlebar/Close.png";
            sHoverImage: "images/Titlebar/CloseOn.png";
//            nTextSize: 20;
//            sTextText: "X";
            state: "normal";
            nIndex: 2;

        }

    }


    MouseArea
    {
        anchors.right: parent.right;
        anchors.rightMargin: 120;

        height: parent.height;
        width: parent.width - 120;


        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        onPressed:
        {
            //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged:
        {
            //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            mainW.setX(mainW.x+delta.x)
            mainW.setY(mainW.y+delta.y)
        }

        onDoubleClicked:
        {
            mainW.visibility == Window.Windowed ?
            mainW.visibility = Window.Maximized :mainW.visibility = Window.Windowed;
        }


    }



}
