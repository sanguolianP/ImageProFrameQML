import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {

    id: dockWin_Right;

    property bool bMenuShown: false;

    opacity: bMenuShown ? 1 : 0.5
    Behavior on opacity {
            NumberAnimation {
                duration: 300
          }
    }


    Image
    {
        id: imageBG_docWinRight;
        anchors.fill: parent;
        source: "images/Sidebar/BarBG.png";
    }

    Button
    {
        anchors.left: parent.left;
        width: 20
        height: 20

        Image
        {
            id: imageBG_dockRightButton;
            anchors.fill: parent;
            source: "images/Sidebar/BarOutIn.png";
        }


//        text: qsTr("<")
        onClicked: onMenuRight();

        MouseArea
        {
            anchors.fill: parent
            enabled: bMenuShown
            onClicked: onMenuRight();
        }
    }

    transform: Translate
    {
        id: menuRightTranslate
        x: 230
        Behavior on x
        {
            NumberAnimation
            {
                duration: 400;
                easing.type: Easing.OutQuad
            }
        }
    }



    function onMenuRight()
    {
        menuRightTranslate.x = bMenuShown ? 230: 0;
        bMenuShown = !bMenuShown;
    }
}
