NAME: CARSQL

COPYRIGHT:                                                                           
----------                                                                           
Copyright (C) International Business Machines Corp., 1991,1995.                      
                                                                                     
DISCLAIMER OF WARRANTIES:                                                            
-------------------------                                                            
The following [enclosed] code is sample code created by IBM                          
Corporation.  This sample code is not part of any standard IBM product               
and is provided to you solely for the purpose of assisting you in the                
development of your applications.  The code is provided "AS IS",                     
without warranty of any kind.  IBM shall not be liable for any damages               
arising out of your use of the sample code, even if they have been                   
advised of the possibility of such damages.                                          


DESCRIPTION:

This sample illustrates how to catch the exception from DAX
(Data Access Class) object's 4 standard methods (add(), delete(),
update(), and retrieve()), and extract the SQLCODE from the exception
object (IDSAccessError).

The sample consists of 2 VB part:
    - CarView visual part which displays a car record and interfaces with
      the user
    - AccessError non-visual which is used to catch the IDSAccessError
      exception and extract the SQLCODE from the exception object.
      For more info on the AccessError part, refer to the part features.

Note:
 
  - DAX throws an IDSAccessError exception for the above methods
    only if the SQLCODE is < 0 or = 100.

  - The AccessError part does not extract other information in the
     SQLCA structure other than the SQLCODE and the ErrorText.
     You can define the attributes for other information,
     and add code in the AccessError::obtainSqlcode() method to extract them.

How to run the sample application:

  - The sample program will not run if you don't have DB2/2 1.2 or above
     installed on your machine.  If you have DB2/2 2.1 installed, you need
    to apply CTV30x csd for the DAX and VB components.

  - Build the car database : invoke DAXSAMP.CMD from
     x:\ibmcpp\samples\database\car\daxsamp directory.

    If you see "sysSeachPath" error after invoke the above CMD,
   add the following lines at the top of the CMD file:

    Call RxFuncAdd 'SysLoadFuncs', 'REXXUTIL', 'SysLoadFuncs';
   Call SysLoadFuncs;

  - Now you're ready to try it out, i.e enter carview from the command line,
    assuming you're in the directory where the carview.exe resides.
 
How to catch the exception using the AccessError non-visual part
in a visual part:

  - Drop the AccessError part to the free-form-surface of the
    composition editor of your visual part.

  - Assume that you have a visual part looks similiar to the sample carview
    visual part. (it is not bad idea to load up the VB, and open up the carview
    part now)

  - To catch the exception, make the following connections:
     ( assuming that the user clicks on the add_push_button to invoke the add()
       method )

    PushButton(ButtonClickedEvent) -> DAXTable(resetSqlcode)      conn1
    PushButton(ButtonClickedEvent) -> DAXTable(add)                   conn2
    conn2                                      -> AccessError(obtainSqlcode)
    PushButton(ButtonClickedEvent) -> DAXTable(checkSqlcode)

    Note: the checkSqlcode() will send the following events: 
                  Sqlcode_0 event if sqlcode =0
                  Sqlcode_100 event if sqlcode =100
                  Sqlcode_lt0 event if sqlcode <0
                  SqlcodeEvent if sqlcode = 100 or < 0

           From these events, you can choose an appropriate event and connect it
           to a method from other part to request a service, for example,
           you may want to connect AccessError(sqlcode_0) to IDatastore(commit),
           i.e call the commit method if a record is added successfully.

 
FeedBack:
  
  - Any feedback or question, drop a message  to BLUC@VNET.IBM.COM.
 
