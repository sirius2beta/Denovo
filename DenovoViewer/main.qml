import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import DeNovoViewer 1.0
import DeNovoViewer.Boat 1.0
import DeNovoViewer.Display 1.0

Window {
    width: 1280
    height: 720
    visible: true
    title: DeNovoViewer.programName

    Material.theme: Material.Dark
    Material.accent: Material.Purple
    Rectangle{
        color: "#111111"
        anchors.fill:parent
    }

    VideoView{
        id: _centerVideoView
        anchors.bottom: _bottom.top
        anchors.top: parent.top
        anchors.left: _leftTool.right
        anchors.right: _subVideoView.left
        anchors.margins: 15
        _index:0
    }

    Rectangle{
        id: _leftTool
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "#020202"
        width:80
    }

    SubVideoView{
        id: _subVideoView
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: _bottom.top
        anchors.margins: 15
    }

    Rectangle{
        id: _bottom
        anchors.left: _leftTool.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15
        radius: 10
        color: "#333333"

        height:240
    }


}
