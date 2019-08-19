import QtQuick 2.0

Rectangle {

    id: rect_stateBar;

    Image
    {
        id: imageBG;

        anchors.fill: parent;
        source: "images/Statusbar/StatusbarBG.png";
    }

    Text {
        id: text_StateBar;
        text: "就绪";

        anchors.left: parent.left;
        anchors.leftMargin: 4;

        width: parent.width;
        height: parent.height;

        horizontalAlignment: Text.AlignLeft;
        verticalAlignment: Text.AlignVCenter;

        color: "#eeeeee";
        font.family: "微软雅黑";
        font.pixelSize: 12;
        font.letterSpacing: 1;
    }




}
