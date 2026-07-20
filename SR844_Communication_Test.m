%{
SR844 communicates via ASCII commands
Most commands can be performed with 
        writeline();
        readline();
        writeread();
The arguments of these functions are ( [COMPORT], [command as a string] )
Commands can have spaces, are not case sensitive, can be concatinated with
a semicolon.

%}


curCOMport = "COM4";
terminator = "CR";

s = serialport(curCOMport, 9600);

configureTerminator(curCOMport, terminator);
flush(curCOMport);

%Does not return information
writeline(curCOMport, "PHAS 30");

%Performs a query
writeline(curCOMport, "PHAS?");
phase = readline(curCOMport);

phase = writeread(curCOMport, "PHAS?");

% id = writeread(curCOMport, "IDN?");




