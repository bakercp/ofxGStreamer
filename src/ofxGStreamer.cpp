#include "ofConstants.h"
#include "ofFileUtils.h"
#include "ofLog.h"
#include <map>

#ifdef TARGET_OSX

// for Release bundle, use ofFilePath::getCurrentWorkingDirectory() for frameworkLocation

void ofxGStreamerSetBundleEnvironment( std::string frameworkLocation  ){
    
    std::map<std::string,std::string> envPaths;
    
    envPaths["GST_PLUGIN_SCANNER"] = frameworkLocation+"/Versions/Current/libexec/gstreamer-1.0/gst-plugin-scanner";
    envPaths["GTK_PATH"] = frameworkLocation+"/Versions/Current";
    envPaths["GIO_EXTRA_MODULES"] = frameworkLocation+"/Versions/Current/lib/gio/modules";
    envPaths["GST_PLUGIN_SYSTEM_PATH_1_0"] = frameworkLocation+"/Versions/Current/lib/gstreamer-1.0";
    envPaths["GST_PLUGIN_SYSTEM_PATH"] = frameworkLocation+"/Versions/Current/lib/gstreamer-1.0";
    envPaths["GST_PLUGIN_PATH_1_0"] = frameworkLocation+"/Versions/Current/lib/gstreamer-1.0";
    envPaths["GST_PLUGIN_PATH"] = frameworkLocation+"/Versions/Current/lib/gstreamer-1.0";

    for (auto & path : envPaths ) {
        std::string p = path.first + "=" + path.second;
        ofLogNotice("ofxGStreamerSetBundleEnvironment") << "setting env variable... " << p;
        putenv( strdup(p.c_str()) );
    }
}
#endif
