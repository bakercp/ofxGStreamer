#include "ofApp.h"
#include "ofGstVideoPlayer.h"

//--------------------------------------------------------------
void ofApp::setup(){
#ifdef TARGET_OSX
    ofxGStreamerSetBundleEnvironment(); // default is "/Library/Frameworks/GStreamer.framework"
#endif
	player.setPlayer(ofPtr<ofGstVideoPlayer>(new ofGstVideoPlayer));
    
    
	player.load("/Users/gilbertsinnott/Movies/test.mov");
	player.play();
}

//--------------------------------------------------------------
void ofApp::update(){
	player.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
	player.draw(0,0);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
