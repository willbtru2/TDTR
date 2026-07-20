%{%}
%{
This is a list of available commands for the SR844 transferred to MATLAB
for convienece.
This information can be found on Pages 103 - 108 of the SR844 tech manual.
Additional information for each command can be found on Pages 109 - 135.

SR844 communicates via ASCII commands
Most commands can be performed with 
        writeline();
        readline();
        writeread();
The arguments of these functions are ( [COMPORT], [command as a string] )
Commands can have spaces, are not case sensitive, can be concatinated with
a semicolon.

%}

%{
                Variables 

ch                  output channel
i,j,k,l,m,n,q       integers
f                   real number frequency
x,y,z               real numbers
%}

%{
                Syntax
(?)                 required for queries - illegal for set
var                 always required
{var}               required for sets only - illegal for query
[var]               optional for set and query
%}

%{
                Reference and Phase
FMOD(?) {i}         Selects or queries the reference source (internal or external).
HARM(?) {i}         Sets or queries the harmonic number used for detection.
FREQ(?) {f}         Sets or queries the internal reference oscillator frequency.
FRAQ?               Returns the actual measured reference frequency.
FRIQ?               Returns the internal reference frequency with higher precision.
PHAS(?) {x}         Sets or queries the reference phase shift in degrees.
APHS                Automatically adjusts the reference phase for maximum X output.
REFZ(?) {i}         Sets or queries the reference input impedance (50 Ω or 1 MΩ).

                Signal Input
WRSV(?) {i}         Sets or queries the wideband reserve mode.
AWRS                Automatically selects the optimum wideband reserve setting.
INPZ(?) {i}         Sets or queries the signal input impedance.

                Gain and Time Constant
SENS(?) {i}         Sets or queries the sensitivity range.
AGAN                Automatically adjusts the sensitivity to an appropriate value.
CRSV(?) {i}         Sets or queries the close reserve mode.
ACRS                Automatically selects the optimum close reserve setting.
OFLT(?) {i}         Sets or queries the low-pass filter time constant.
OFSL(?) {i}         Sets or queries the low-pass filter roll-off slope.
SETL(?)             Sets or queries the synchronous filter status.

                Display and Output
DDEF(?) ch{,q}      Assigns which parameter is displayed on a selected display channel.
DRAT(?) ch{i}       Sets or queries the display ratio mode for a display channel.
FPOP(?) ch{,i}      Enables or disables front-panel display updates for a channel.
DOFF ch,q{,x}       Sets or queries the display offset value for a selected quantity.
AOFF ch,q           Automatically zeros the display offset for a selected quantity.
DEXP(?) ch,q{,i}    Sets or queries the display expansion factor.

                Aux Input and Output
AUXI? i             Reads the voltage present at the specified auxiliary input.
AUXO(?) i{,x}       Sets or queries the voltage on the specified auxiliary output.

                Setup
OUTX(?) {i}         Selects or queries the active computer interface (GPIB or RS-232).
OVRM(?) {i}         Enables or disables remote front-panel lockout.
KCLK(?) {i}         Sets or queries the keyboard click sound.
ALRM(?) {i}         Enables or disables the audible alarm.
SSET i              Saves the current instrument settings to a setup memory location.
RSET i              Recalls instrument settings from a setup memory location.
KNOB i              Simulates rotation of the front-panel knob.
KEYP i              Simulates pressing a front-panel key.

                Auto Functions
AWRS                Automatically adjusts the wideband reserve.
ACRS                Automatically adjusts the close reserve.
AGAN                Automatically adjusts the sensitivity.
APHS                Automatically adjusts the reference phase.
AOFF ch,q           Automatically zeros the display offset.

                Scan and Reference
SSTR(?) {f}         Sets or queries the scan start frequency.
SFIN(?) {f}         Sets or queries the scan stop frequency.
SSTP(?) {i}         Sets or queries the number of scan steps.
SMOD(?) {i}         Sets or queries the scan mode.
RSTO i              Stores the current reference frequency in memory.
RRDY? i             Reports whether a stored reference is ready.
RCLR                Clears all stored reference frequencies.
RMOD(?) {i}         Sets or queries the reference operating mode.

                Data Storage
SRAT(?) {i}         Sets or queries the data storage sample rate.
SEND(?) {i}         Sets or queries the storage end mode.
TRIG                Triggers a single data storage sample.
TSTR(?) {i}         Sets or queries the trigger start mode.
STRT                Starts data storage.
PAUS                Pauses data storage.
REST                Resumes or restarts data storage.

                Data Transfer
OUTP? i             Returns the current value of a selected output parameter.
OUTR? ch            Returns the current value of a selected display output.
SNAP? i,j{,k,l,m,n} Returns multiple instrument parameters simultaneously.
SPTS?               Returns the number of stored data points.
TRCA? ch,j,k        Transfers ASCII trace data from memory.
TRCB? ch,j,k        Transfers binary trace data from memory.
TRCL? ch,j,k        Transfers trace data with scaling information.
FAST(?) {i}         Enables or disables high-speed data transfer mode.
STRD                Starts transferring stored data.

                Interface
*RST                Resets the instrument to factory default settings.
PRST                Performs a partial reset while preserving interface settings.
*IDN?               Returns the instrument identification string.
LOCL(?) {i}         Enables or disables local front-panel operation.
OVRM(?) {i}         Enables or disables remote override of the front panel.

                Status
*CLS                Clears all status registers and error queues.
*STB?[i]            Returns the IEEE-488 status byte.
*SRE(?)[i,]{j}      Sets or queries the Service Request Enable register.
*ESR(?)[i,]{j}      Returns or clears the Standard Event Status Register.
ESE?[i]             Returns the Standard Event Status Enable register.
PSC(?) {i}          Sets or queries the Power-On Status Clear mode.
ERRS?[i]            Returns the next error in the error queue.
ERRE(?)[i,]{j}      Sets or queries the Error Status Enable register.
LIAS?[i]            Returns the Lock-In status register.
LIAE(?)[i,]{j}      Sets or queries the Lock-In Status Enable register.
%}







