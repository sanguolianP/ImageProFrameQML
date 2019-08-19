import QtQuick 2.0

Rectangle {

    id: rect_MenuBar;

    z:0.6;

    Image
    {
        id: imageBG_menuBar;
        anchors.fill: parent;
        source: "images/Toolbar/ToolbarBG.png";
    }


    Row
    {
        id: row_menuBarButtonList;

        anchors.left: parent.left;
        anchors.leftMargin: 1;
        anchors.top: parent.top;
//        anchors.topMargin: 3;
        height: parent.height;
        spacing: 1;


        MyMenuButton
        {
            id:fileButton_Menu;
            width: 80;
            height: 28;
            nTextSize: 18;
            sTextText: "文件"
            state: "normal";
            nIndex: 0;

        }
        MyMenuButton
        {
            id:editButton_Menu;
            width: 80;
            height: 28;
            nTextSize: 18;
            sTextText: "编辑"
            state: "normal";
            nIndex: 1;
        }
        MyMenuButton
        {
            id:toolButton_Menu;
            width: 80;
            height: 28;
            nTextSize: 18;
            sTextText: "工具"
            state: "normal";
            nIndex: 2;
        }
        MyMenuButton
        {
            id:helpButton_Menu;
            width: 80;
            height: 28;
            nTextSize: 18;
            sTextText: "帮助"
            state: "normal";
            nIndex: 3;
        }

    }

    Rectangle
    {
        id: rect_MenuFile;
        visible: false;

        x:fileButton_Menu.x + 4;
        y:fileButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 4 +6;
        color: "transparent";

        Column
        {
            id: colum_File;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "打开图片";
                state: "normal";
                nIndex: 4;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "导入";
                state: "normal";
                nIndex: 5;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "导出";
                state: "normal";
                nIndex: 6;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "退出";
                state: "normal";
                nIndex: 7;
            }
        }
    }


    Rectangle
    {
        id: rect_MenuEdit;
        visible: false;

        x:editButton_Menu.x + 4;
        y:editButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 4 +6;
        color: "transparent";

        Column
        {
            id: colum_Edit;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "撤销";
                state: "normal";
                nIndex: 8;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "重做";
                state: "normal";
                nIndex: 9;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "还原";
                state: "normal";
                nIndex: 10;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "设置";
                state: "normal";
                nIndex: 11;
            }
        }
    }

    Rectangle
    {
        id: rect_MenuTool;
        visible: false;

        x:toolButton_Menu.x +4;
        y:toolButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 3 +6;
        color: "transparent";

        Column
        {
            id: colum_Tool;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "平移";
                state: "normal";
                nIndex: 12;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "缩放";
                state: "normal";
                nIndex: 13;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "旋转";
                state: "normal";
                nIndex: 14;
            }
        }
    }

    Rectangle
    {
        id: rect_MenuHelp;
        visible: false;

        x:helpButton_Menu.x + 4;
        y:helpButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 3 +6;
        color: "transparent";

        Column
        {
            id: colum_Help;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "使用教程";
                state: "normal";
                nIndex: 15;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "信息";
                state: "normal";
                nIndex: 16;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "关于我们";
                state: "normal";
                nIndex: 17;
            }
        }
    }

    MouseArea
    {
        id:menuAllMouseArea;
        visible: false;
        z:-1;


        width: mainW.width;
        height: mainW.height;

        onClicked:
        {
            console.log("visible");
            rect_MenuFile.visible = false;
            rect_MenuEdit.visible = false;
            rect_MenuTool.visible = false;
            rect_MenuHelp.visible = false;
            menuAllMouseArea.visible = false;
            console.log("set success");
        }

    }


}
