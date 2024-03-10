import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import DeNovoViewer 1.0
import DeNovoViewer.Boat 1.0

import org.freedesktop.gstreamer.GLVideoItem 1.0
Window {
    width: 640
    height: 480
    visible: true
    title: DeNovoViewer.programName

    Rectangle{
        id: background
        anchors.fill: parent
        color: "black"
        GstGLVideoItem {
            id: video
            objectName: "videoContent"
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
        }
    }


    ListView {
        id: listview
        width: 200; height: 320
        model:  DeNovoViewer.boatManager.boatListModel


        delegate: Rectangle {
            width: listview.width; height: 25

            Text { text: object.name }
        }
    }

    ComboBox {
        id: combobox
        editable: false
        model: DeNovoViewer.boatManager.boatListModel
        displayText: "hi"
        delegate: ItemDelegate  {
            width: combobox.width; height: 25
            Text { text: object.name }
            onClicked: combobox.displayText=object.name
            //required property string modelData
        }
    }
}
