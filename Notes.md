# Notes

## GStreamer Compilation on MacOS  

These are notes rather than a step-by-step guide, so read til end;

```
# As of July 2020...
# Current stable GStreamer library: 1.16 (1.17 is nightly)
# Last available brew tap: 1.14
# Last available GStreamer.framework: "OSX Sierra" (1.14)
```

GStreamer has many dependencies and its own internal linkage using environment paths. Mismatch causes problems, so I started fresh:

```
# header locations:

ls /usr/local/include
ls /usr/local/Cellar # mix of symlinks

# dynamic lib locations:

ls /usr/local/lib

# find all gst libs:

find /usr/local -name 'gst*'
find /usr/local -name 'gst*.h' # header
find /usr/local/lib -name 'gst*.so' # dylibs

```

Remove everything:

```
brew uninstall gstreamer
brew uninstall gst-plugins-base
brew uninstall gst-libav

# double-check

find /usr/local -name 'gst*'

```

Reinstall everything. 

Either manually:

```
brew install bison # must be >=2.4

# add this to $PATH if common linkage problems occur
brew info bison 

# Follow gstreamer meson build
# Follow gst-plugins-base meson build

```

Or brew:

```
brew update
brew install gstreamer
brew install gst-plugins-base
brew install gst-libav
```

gst-webrtc is still classified as unstable, so found here:

```
brew install gst-plugins-bad 

# macOS fix...

brew install libnice
brew edit gst-plugins-bad

# edit this line...

depends_on "libnice" => :recommended
brew reinstall —build-from-source gst-plugins-bad

# remember to refresh terminal after symlinking is done!
```

Testing gst-webrtc

```
https://gitlab.freedesktop.org/gstreamer/gst-examples
gstwebrtc-demos + build
navigate to https://webrtc.nirbheek.in
launch demo with:
webrtc-sendrecv --peer-id={ID-from-URL}
```

This produces a pipeline like so:

```
webrtcbin bundle-policy=max-bundle name=sendrecv  stun-server=stun://stun.l.google.com:19302 videotestsrc is-live=true pattern=ball ! videoconvert ! queue ! vp8enc deadline=1 ! rtpvp8pay ! queue ! application/x-rtp,media=video,encoding-name=VP8,payload=96 ! sendrecv. audiotestsrc is-live=true wave=red-noise ! audioconvert ! audioresample ! queue ! opusenc ! rtpopuspay ! queue ! application/x-rtp,media=audio,encoding-name=OPUS,payload=97 ! sendrecv.
```


ofxGStreamer

ofxGStreamer uses the GStreamer.framework, which is semi-dead having been last updated for Sierra.

```
https://gstreamer.freedesktop.org/documentation/installing/on-mac-osx.html
https://github.com/autr/ofxGStreamer
```

Internally it packages up libs equivalent to what brew offers. My fork has commented includes for brew / manually installed gstreamer in addon_config.mk (ie. if using 1.14+).

Important is the ofxGStreamerSetBundleEnvironment function. It sets internal linkage ENV variables, and the original addon seems to only call it for for a GStreamer.framework bundled Release project (ie. relative path).

For any compilation on macOS however, this must always be set, by calling ofxGStreamerSetBundleEnvironment() in setup.

```
void ofApp::setup() {
	ofxGStreamerSetBundleEnvironment() 
}

```
