#pragma once

#include "ofConstants.h"

#ifdef TARGET_OSX
void ofxGStreamerSetBundleEnvironment( std::string frameworkLocation = "/Library/Frameworks/GStreamer.framework" );
#endif
