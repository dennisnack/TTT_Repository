${TOTALTEST_JOBCARD}
//*
//********************************************************************
//* Execute Target Runner under TSO using the DSN command
//*    and the RUN subcommand
//********************************************************************
//RUNBD2 EXEC PGM=IKJEFT01,REGION=0M
//STEPLIB DD DISP=SHR,DSN=SYS2.CW.&CWGACX..SLCXLOAD
//        DD DISP=SHR,DSN=HUSDRN0.TTT.LOAD
//        DD DISP=SHR,DSN=DSNB10.SDSNLOAD
//        DD DISP=SHR,DSN=CEE.SCEERUN
//*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
*
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
//*-----
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*-----
//*      Add your custom DD statements
//EMPFILE  DD DISP=SHR,DSN=HUSDRN0.TTT.CNTL(TTTDATD)
//RPTFILE  DD SYSOUT=*
//SLSF001  DD DISP=SHR,DSN=HUSDRN0.TTT.DDIO
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DBCC)
 RUN PROGRAM(TTTRUNNR) PLAN(DNKTDB2X) PARMS('/NOSTAE')
 END
/*
//