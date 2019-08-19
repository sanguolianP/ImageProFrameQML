import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Rectangle {

    id:dockWin_Left;

//    color: "#eeeeee"
    property bool bMenuShown: false;

    opacity: bMenuShown ? 1 : 0.8
    Behavior on opacity {
            NumberAnimation {
                duration: 300
          }
    }

//    Image
//    {
//        id: imageBG;

//        anchors.fill: parent;
//        source: "images/Sidebar/BarBG.png";
//    }

//    Button
//    {
//        anchors.right: parent.right;
//        width: 20
//        height: 20
//        text: qsTr(">")
//        onClicked: onMenu();

//        MouseArea
//        {
//            anchors.fill: parent
//            enabled: bMenuShown
//            onClicked: onMenu();
//        }
//    }

    SideBarButton
    {
        anchors.right: parent.right;
        width: 20;
        height: 20;


//        sPressedImage: retrunImage(1);

        sPressedImage: "images/Sidebar/BarInOut.png";
        sNormalImage: "images/Sidebar/BarInOutDisable.png";
        sHoverImage: "images/Sidebar/BarInOutHover.png";


        nIndex: 0;
    }


    transform: Translate
    {
        id: menuTranslate
        x: -130
        Behavior on x
        {
            NumberAnimation
            {
                duration: 400;
                easing.type: Easing.OutQuad
            }
        }
    }



    function onMenu()
    {
        menuTranslate.x = bMenuShown ? -130 : 0;
        bMenuShown = !bMenuShown;
    }

//    function retrunImage(imageIndex)
//    {
//        if(dockWin_Left.bMenuShown)
//        {
//            if(imageIndex===1)
//            {
//                console.log("images/Sidebar/BarInOut.png");
//                return "images/Sidebar/BarInOut.png";
//            }
//        }
//    }

}


