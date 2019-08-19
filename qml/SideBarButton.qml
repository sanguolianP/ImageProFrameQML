import QtQuick 2.0

Rectangle{

    id: sidebar_Button;

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";

    property var nIndex: 0;

    signal back(var nIndex);


    //button image
    Image
    {
        id: sidebarButtonImage;
        z:1;

        /*
        x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        */
        anchors.fill: parent;
        source: sNormalImage;
    }





        MouseArea
        {
            id: sidebarButtonMouseArea;



            //        anchors.fill: parent;
            //        anchors.right: dockWin_Left.right;
//            x: 10;
            height: dockWin_Left.height;
            width: 20;

            acceptedButtons: Qt.LeftButton
            hoverEnabled: true;

            Image
            {
                id: imageBG;
//                height: dockWin_Left.height;
//                width: 20;

                anchors.fill: parent;
                source: "images/Sidebar/BarBG.png";}


            onPressed:
            {
                if(mouse.button === Qt.RightButton)
                {
                    console.log("Mouse Right");
                }
                sidebar_Button.state = "pressed";
            }
            onReleased:
            {
                sidebar_Button.state = "normal";
                back(nIndex);
            }

            onEntered:
            {
                if(sidebar_Button.state === "normal")
                {
                    sidebar_Button.state = "hover";
                }
            }
            onExited:
            {
                if(sidebar_Button.state === "hover")
                {
                    sidebar_Button.state = "normal";
                }
            }

            onClicked:
            {
                if(nIndex == 0)
                {
                    dockWin_Left.onMenu();
                }
            }

        }


    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: sidebarButtonImage;
                source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: sidebarButtonImage;
                source: sPressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: sidebarButtonImage;
                source: sHoverImage;
            }
        }
    ]

}
