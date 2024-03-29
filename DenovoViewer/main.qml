﻿import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
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
        color: "#222222"
        width:70
        ColumnLayout{
            anchors.fill:parent
            anchors.margins: 5
            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                contentItem: Image{
                    fillMode: Image.PreserveAspectFit
                    id: _boatManagerIcon
                    source: "res/boatManager.png"
                }


            }
            Image {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                fillMode: Image.PreserveAspectFit
                id: _sensorManagerIcon
                source: "res/sensorManager.png"
            }
            Item {
                Layout.fillHeight: true
            }
        }
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
        height:250
        color: "#333333"

        RowLayout{
            anchors.fill: parent
            anchors.margins:10
            spacing: 10
            BoatManager{
                id: _boatManager
            }
            Item{
                Layout.preferredWidth: _thumbnail.width
                Layout.fillHeight: true

                Image {
                    height: parent.height
                    fillMode: Image.PreserveAspectFit
                    id: _thumbnail
                    source: "res/ecov4.png"
                }

                Rectangle{
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 5
                    radius: 2
                    color: "#438e96"
                    height:20
                    width: 80
                    Text{
                        font.family: "Segoe UI"
                        text: " Echo"
                        color: "white"
                    }
                }
            }
            AquaUI{

            }

            BoatStatusView{

            }


            Item {
                    Layout.fillWidth: true
            }
        }




    }


}
