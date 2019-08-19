import QtQuick 2.0

Rectangle {

    id: rect_cToolBar;

    Image
    {
        id: imageBG_cToolBar;
        anchors.fill: parent;
        source: "images/Toolbar/ToolbarBG.png";
    }

    Row
    {
        id: row_cToolButtonList;

        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 4;

        height: parent.height;
        spacing: 4;

        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/FilePressed.png";
            sNormalImage: "images/Toolbar/FileNormal.png";
            sHoverImage: "images/Toolbar/FilePressed.png";
            state: "normal";
            nIndex: 0;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/PositioningPressed.png";
            sNormalImage: "images/Toolbar/PositioninNormal.png";
            sHoverImage: "images/Toolbar/PositioningPressed.png";
            state: "normal";
            nIndex: 1;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/DelPressed.png";
            sNormalImage: "images/Toolbar/DelNormal.png";
            sHoverImage: "images/Toolbar/DelPressed.png";
            state: "normal";
            nIndex: 2;
        }

        Image {
            id: speratorImage;
            source: "images/Toolbar/ToolbarLine.png";
        }


        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/BackPressed.png";
            sNormalImage: "images/Toolbar/BackNormal.png";
            sHoverImage: "images/Toolbar/BackPressed.png";
            state: "normal";
            nIndex: 3;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/ForwardPressed.png";
            sNormalImage: "images/Toolbar/ForwardNormal.png";
            sHoverImage: "images/Toolbar/ForwardPressed.png";
            state: "normal";
            nIndex: 4;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/AmplificationPressed.png";
            sNormalImage: "images/Toolbar/AmplificationNormal.png";
            sHoverImage: "images/Toolbar/AmplificationPressed.png";
            state: "normal";
            nIndex: 5;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/NarrowPressed.png";
            sNormalImage: "images/Toolbar/NarrowNormal.png";
            sHoverImage: "images/Toolbar/NarrowPressed.png";
            state: "normal";
            nIndex: 6;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/LeftPressed.png";
            sNormalImage: "images/Toolbar/LeftNormal.png";
            sHoverImage: "images/Toolbar/LeftPressed.png";
            state: "normal";
            nIndex: 7;
        }
        CommonToolButton
        {
            width: 40;
            height: 36;
            sPressedImage: "images/Toolbar/RightPressed.png";
            sNormalImage: "images/Toolbar/RightNormal.png";
            sHoverImage: "images/Toolbar/RightPressed.png";
            state: "normal";
            nIndex: 8;
        }

    }

}
