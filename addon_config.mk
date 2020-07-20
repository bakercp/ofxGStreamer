# All variables and this file are optional, if they are not present the PG and the
# makefiles will try to parse the correct values from the file system.
#
# Variables that specify exclusions can use % as a wildcard to specify that anything in
# that position will match. A partial path can also be specified to, for example, exclude
# a whole folder from the parsed paths from the file system
#
# Variables can be specified using = or +=
# = will clear the contents of that variable both specified from the file or the ones parsed
# from the file system
# += will add the values to the previous ones in the file or the ones parsed from the file 
# system
# 
# The PG can be used to detect errors in this file, just create a new project with this addon 
# and the PG will write to the console the kind of error and in which line it is

meta:
	ADDON_NAME = ofxGStreamer
	ADDON_DESCRIPTION = openFrameworks addon to use gstreamer under osx and windows. This addon has no code and instead uses the addon_config.mk file to add the needed files from the core + the flags needed to compile using gstreamer
	ADDON_AUTHOR = Arturo Castro
	ADDON_TAGS = "GStreamer" "video" "audio" "network"
	ADDON_URL = http://github.com/arturoc/ofxGStreamer

common:
	# dependencies with other addons, a list of them separated by spaces 
	# or use += in several lines
	# ADDON_DEPENDENCIES = 
	
	# include search paths, this will be usually parsed from the file system
	# but if the addon or addon libraries need special search paths they can be
	# specified here separated by spaces or one per line using +=
	# ADDON_INCLUDES =
	
	# any special flag that should be passed to the compiler when using this
	# addon
	# ADDON_CFLAGS = 
	
	# any special flag that should be passed to the linker when using this
	# addon, also used for system libraries with -lname
	# ADDON_LDFLAGS =
	
	# linux only, any library that should be included in the project using
	# pkg-config
	# ADDON_PKG_CONFIG_LIBRARIES = 
	
	# osx/iOS only, any framework that should be included in the project
	# ADDON_FRAMEWORKS
	
	# source files, these will be usually parsed from the file system looking
	# in the src folders in libs and the root of the addon. if your addon needs
	# to include files in different places or a different set of files per platform
	# they can be specified here
	# ADDON_SOURCES =
	
	# some addons need resources to be copied to the bin/data folder of the project
	# specify here any files that need to be copied, you can use wildcards like * and ?
	# ADDON_DATA = 
	
	# when parsing the file system looking for libraries exclude this for all or
	# a specific platform
	# ADDON_LIBS_EXCLUDE =
	
	# when parsing the file system looking for sources exclude this for all or
	# a specific platform
	
	# when parsing the file system looking for include paths exclude this for all or
	# a specific platform
	# ADDON_INCLUDES_EXCLUDE =

linux:
	
linux64:
	
linuxarmv6l:
	
linuxarmv7l:
	
msys2:
	#ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include
	#ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include/gstreamer-1.0
	#ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include/glib-2.0
	#ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)lib/glib-2.0/include
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.cpp
	#ADDON_LDFLAGS += -L$(GSTREAMER_1_0_ROOT_X86_64)lib -lgstreamer-1.0 -lgstapp-1.0 -lgstvideo-1.0 -lgstbase-1.0 -lgstnet-1.0 -lgstaudio-1.0 -lgio-2.0 -lpangowin32-1.0 -lgdi32 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lffi -lws2_32 -lole32 -lwinmm -lshlwapi  -lintl -lglib-2.0
	ADDON_PKG_CONFIG_LIBRARIES = gstreamer-1.0 gstreamer-app-1.0 gstreamer-video-1.0

	
vs:
	ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include
	ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include/gstreamer-1.0
	ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)include/glib-2.0
	ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)lib/glib-2.0/include
	ADDON_INCLUDES += $(GSTREAMER_1_0_ROOT_X86_64)lib/gstreamer-1.0/include
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.cpp
	ADDON_LIBS += $(GSTREAMER_1_0_ROOT_X86_64)lib/gstreamer-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gstapp-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gstvideo-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gstbase-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gstnet-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gstaudio-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gio-2.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/pangowin32-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/pangocairo-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gdk_pixbuf-2.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/pango-1.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/cairo.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gobject-2.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gmodule-2.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/gthread-2.0.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/ffi.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/intl.lib $(GSTREAMER_1_0_ROOT_X86_64)lib/glib-2.0.lib
	
android/armeabi:	
	
android/armeabi-v7a:	

osx:

	ADDON_LDFLAGS = -F/Library/Frameworks -framework GStreamer
	ADDON_INCLUDES = /Library/Frameworks/GStreamer.framework/Headers

	# ADDON_INCLUDES += /usr/local/include
	# ADDON_INCLUDES += /usr/local/include/glib-2.0
	# ADDON_INCLUDES += /usr/local/lib/glib-2.0/include
	# ADDON_INCLUDES += /usr/local/include/gstreamer-1.0
	# ADDON_LIBS += /usr/local/lib/libgstreamer-1.0.0.dylib /usr/local/lib/libgstapp-1.0.0.dylib /usr/local/lib/libgstvideo-1.0.0.dylib /usr/local/lib/libgstbase-1.0.0.dylib /usr/local/lib/libgstnet-1.0.0.dylib /usr/local/lib/libgstaudio-1.0.0.dylib /usr/local/lib/gstreamer-1.0/libgstgio.dylib /usr/local/lib/gstreamer-1.0/libgstpango.dylib /usr/local/lib/libcairo-gobject.dylib /usr/local/lib/libgio-2.0.dylib /usr/local/lib/libgmodule-2.0.dylib /usr/local/lib/libgobject-2.0.dylib /usr/local/lib/libgthread-2.0.dylib /usr/local/lib/libglib-2.0.0.dylib 

	# /usr/local/Cellar/gst-libav/1.16.2/lib/gstreamer-1.0/libgstlibav.so

	# ADDON_LIBS += /usr/local/lib/libgstgl-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstallocators-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstriff-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstpbutils-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstrtsp-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstsdp-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstrtp-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstfft-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgsttag-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstcheck-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/libgstcontroller-1.0.0.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstaudiorate.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstcoretracers.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstopengl.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstplayback.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgsttypefindfunctions.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvolume.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstadder.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstaudioresample.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstencoding.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstopus.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstrawparse.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvideoconvert.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvorbis.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstapp.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstaudiotestsrc.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstoverlaycomposition.dylib 
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstsubparse.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvideorate.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstaudioconvert.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstcompositor.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstlibav.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgsttcp.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvideoscale.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstaudiomixer.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstcoreelements.dylib       
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstogg.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstpbtypes.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgsttheora.dylib
	# ADDON_LIBS += /usr/local/lib/gstreamer-1.0/libgstvideotestsrc.dylib

	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.cpp

ios:
	ADDON_LDFLAGS = -F/Library/Frameworks -framework GStreamer
	ADDON_INCLUDES = /Library/Frameworks/GStreamer.framework/Headers
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstUtils.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoPlayer.cpp
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.h
	ADDON_SOURCES += $(OF_ROOT)/libs/openFrameworks/video/ofGstVideoGrabber.cpp
	
	

