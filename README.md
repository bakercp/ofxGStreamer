ofxGStreamer
============

[![Build status](https://travis-ci.org/arturoc/ofxGStreamer.svg?branch=master)](https://travis-ci.org/arturoc/ofxGStreamer)

[![Build status](https://ci.appveyor.com/api/projects/status/k4ig002tr5ruckxh/branch/master?svg=true)](https://ci.appveyor.com/project/arturoc/ofxgstreamer/branch/master)


ofxGStreamer is an special addon that allows to use the openFrameworks GStreamer elements, ofGstVideoPlayer and ofGstUtils under windows and osx

This addon has no code and instead uses the addon_config.mk file included here to add the required files from the core + the flags needed to compile programs using [GStreamer](http://gstreamer.freedesktop.org/). Please see [ofxGSTRTP](https://github.com/arturoc/ofxGSTRTP) for examples and implimentation of the toolkit. 

The instructions below will only work with the latest version of the [project generator](https://github.com/ofZach/projectGeneratorSimple) on github. More information about getting OF setup is documented [here](https://github.com/openframeworks/openFrameworks/blob/master/docs/table_of_contents.md). Use the project generater to create template projects after you have installed the GStreamer libraries according to the instructions below.

## Installing gstreamer

This addon depends on the gstreamer SDK. We are using version 1.0 currently. To install it:

### For OSX (Tested with XCode 11, Mojave)

See [fork notes](Notes.md), or:

```
brew update
brew install gstreamer
brew install gst-plugins-base
brew install gst-libav
```

Be sure that ofxGStreamerSetBundleEnvironment is called when using macOS:

```

void ofApp::setup() {

	# working with brew installed libs

	ofxGStreamerSetBundleEnvironment() 

	# if packaging up a Release build

	string path = ofFilePath::getCurrentWorkingDirectory();
	ofxGStreamerSetBundleEnvironment( path )
}

```

### For Windows (Tested in visual studio 2012, on Windows 7 & 8)

You need to download GStreamer v1.0. To install it under windows use the 1.2.2 packages located [http://gstreamer.freedesktop.org/data/pkg/windows/1.2.2/](http://gstreamer.freedesktop.org/data/pkg/windows/1.2.2/) any later version from [http://gstreamer.freedesktop.org/data/pkg/windows](http://gstreamer.freedesktop.org/data/pkg/windows) should work but haven't been tested yet. It is **important** to install the complete version when the installer asks, or it won't install some plugins like h264 encoder and decoder, audio input... in general everything in gstreamer bad and ugly won't be installed with the tipical installation mode.
    
* [gstreamer-1.0-x86-1.2.2.msi](http://gstreamer.freedesktop.org/data/pkg/windows/1.2.2/gstreamer-1.0-x86-1.2.2.msi) installs the necesary libraries for applications to run.

* [gstreamer-1.0-devel-x86-1.2.2.msi](http://gstreamer.freedesktop.org/data/pkg/windows/1.2.2/gstreamer-1.0-devel-x86-1.2.2.msi) installs the development files needed to compile gst applications.

After installing those 2 packages, you need to add the path to the bin directory of the installation to the PATH environment variable. In windows 8 open the control panel and search for environment variable. In windows 7 type "environment variable" into the run window. Edit the system PATH variable and at the end by adding a ; and the bin folder in the path where you installed gstreamer. The default path should be:

`;C:\gstreamer\1.0\x86\bin`

That will allow you to run the gstreamer tools like gst-launch from the command line in any folder and will let the applications know where to find the runtime dll's.

