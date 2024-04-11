# Denovo

1. include DNVideoManager* _DNmanager as a member of FinishVideoInitialization
initVideo() in run _DNmanager->initVideo();
2. declear DNQmlGlobalSingletonFactory
3. Register object for qml in initCommon()(object in _init())
