import QtQuick 2.15
import QtQuick.Window 2.15
import DeNovoViewer 1.0
import DeNovoViewer.Boat 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: DeNovoViewer.programName

    ListView {
        id: listview
        width: 200; height: 320
        model:  DeNovoViewer.boatManager.boatListModel


        delegate: Rectangle {
            width: listview.width; height: 25

            Text { text: object.name }
        }
    }
}
