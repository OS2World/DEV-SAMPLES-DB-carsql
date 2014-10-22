/*******************************************************************************
* FILE NAME: ccssrror.cpp                                                      *
*                                                                              *
* DESCRIPTION:                                                                 *
*   Class implementation of the class:                                         *
*     accessError                                                              *
* ---------------------------------------------------------------------------- *
* Warning: This file was generated by the VisualAge C++ Visual Builder.        *
* Modifications to this source file will be lost when the part is regenerated. *
*******************************************************************************/
#ifndef _INOTIFEV_
#include <inotifev.hpp>
#endif

#ifndef _IOBSERVR_
#include <iobservr.hpp>
#endif

#ifndef _ISTDNTFY_
#include <istdntfy.hpp>
#endif

#ifndef _ACCESSERROR_
#include "ccssrror.hpp"
#endif

#ifndef _IVBDEFS_
#include <ivbdefs.h>
#endif

#ifndef _ITRACE_
#include <itrace.hpp>
#endif


#pragma export (accessError::readyId)
const INotificationId accessError::readyId = "accessError::readyId";

//------------------------------------------------------------------------------
// accessError :: accessError
//------------------------------------------------------------------------------
#pragma export (accessError::accessError())
accessError::accessError()
{

}     //end constructor


//------------------------------------------------------------------------------
// accessError :: ~accessError
//------------------------------------------------------------------------------
#pragma export (accessError::~accessError())
accessError::~accessError()
{

}

//------------------------------------------------------------------------------
// accessError :: initializePart
//------------------------------------------------------------------------------
#pragma export (accessError::initializePart())
accessError & accessError::initializePart()
{
   makeConnections();
   notifyObservers(INotificationEvent(readyId, *this));
   return *this;
}


//------------------------------------------------------------------------------
// accessError :: makeConnections
//------------------------------------------------------------------------------
#pragma export (accessError::makeConnections())
Boolean accessError::makeConnections()
{
   this->enableNotification();

   return true;
}


#include "accerr.cpv"
