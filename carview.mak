# carview.mak
# Created by IBM WorkFrame/2 MakeMake at 14:57:33 on 21 Dec 1995
#
# The actions included in this make file are:
#  Compile::C++ Compiler
#  Link::Linker
#  Bind::Resource Bind
#  Compile::Resource Precompile
#  Compile::Resource Compiler

.SUFFIXES: .CPP .RCX .obj .rc .res 

.all: \
    .\carview.exe

.CPP.obj:
    @echo " Compile::C++ Compiler "
    icc.exe -DIC_TRACE_DEVELOP /Ti /Gm /Gd /G4 /C %s

.RCX.rc:
    @echo " Compile::Resource Precompile "
    icc.exe -c /Pc+ /Pe+ /Pd /I. %s > %|dpfF.rc

.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|dpfF.RES

.\carview.exe: \
    .\CARVIEW.obj \
    .\VBMAIN.obj \
    .\CCSSRROR.obj \
    .\CARVIEW.res \
    {$(LIB)}carv.lib
    @echo " Link::Linker "
    @echo " Bind::Resource Bind "
    icc.exe @<<
    -DIC_TRACE_DEVELOP 
     /Tdp 
     /Gm /Gd /G4 
     /B" /de /pmtype:pm"
     /Fecarview.exe 
     carv.lib 
     .\CARVIEW.obj
     .\VBMAIN.obj
     .\CCSSRROR.obj
<<
    rc.exe .\CARVIEW.res carview.exe

.\CARVIEW.obj: \
    f:\myproj\carsql\CARVIEW.CPP \
    {f:\myproj\carsql;$(INCLUDE);}CarView.hpp \
    {f:\myproj\carsql;$(INCLUDE);}CarView.h \
    {f:\myproj\carsql;$(INCLUDE);}ccssrror.hpp \
    {f:\myproj\carsql;$(INCLUDE);}idsexc.hpp \
    {f:\myproj\carsql;$(INCLUDE);}ccssrror.h \
    {f:\myproj\carsql;$(INCLUDE);}accerr.hpv \
    {f:\myproj\carsql;$(INCLUDE);}Carv.hpp \
    {f:\myproj\carsql;$(INCLUDE);}idsmcon.hpp

.\CCSSRROR.obj: \
    f:\myproj\carsql\CCSSRROR.CPP \
    {f:\myproj\carsql;$(INCLUDE);}ccssrror.hpp \
    {f:\myproj\carsql;$(INCLUDE);}accerr.cpv \
    {f:\myproj\carsql;$(INCLUDE);}idsexc.hpp \
    {f:\myproj\carsql;$(INCLUDE);}ccssrror.h \
    {f:\myproj\carsql;$(INCLUDE);}accerr.hpv

.\VBMAIN.obj: \
    f:\myproj\carsql\VBMAIN.CPP \
    {f:\myproj\carsql;$(INCLUDE);}CarView.hpp \
    {f:\myproj\carsql;$(INCLUDE);}CarView.h

.\CARVIEW.rc: \
    f:\myproj\carsql\CARVIEW.RCX \
    {$(INCLUDE)}CarView.rci \
    {$(INCLUDE)}ccssrror.rci \
    {$(INCLUDE)}ccssrror.h \
    {$(INCLUDE)}CarView.h

.\CARVIEW.res: \
    .\CARVIEW.rc
