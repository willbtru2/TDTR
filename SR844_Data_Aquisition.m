%% Establish Serial

curCOMport = "COM4";
terminator = "CR";
baudrate = 115200;

s = serialport(curCOMport, baudrate);
s.Timeout = 5;

configureTerminator(s, terminator);
flush(s);
%% Open File

fileid = fopen("Test[id]DataBackup.csv", "w");
if fileid == -1
    error("Could not open output file.");
end

fprintf(fileid, "Sample,Time,X,Y,R,Theta\n");
%% Vectors & Constansts

k = 1;
blocksize = 10000;

t       = zeros(1,blocksize);
X       = zeros(1,blocksize);
Y       = zeros(1,blocksize);
R       = zeros(1,blocksize);
theta   = zeros(1,blocksize);
%% Cleanup

cleanup = onCleanup(@() cleanupDAQ(s,fileid));
%% Data Aquisition
tic
try
    while true
        % Resizes vectors for long data runs
        if k > length(X)
            X(end+blocksize) = 0;
            Y(end+blocksize) = 0;
            R(end+blocksize) = 0;
            theta(end+blocksize) = 0;
            t(end+blocksize) = 0;
        end
        
        % Collects data    
        response = writeread(s,"SNAP?1,2,3,4");
        if ~isempty(response)
            values = sscanf(response, "%f,%f,%f,%f");
        else
            values = [];
        end
        % Stores data in vectors
        if numel(values) == 4
            X(k)     = values(1);
            Y(k)     = values(2);
            R(k)     = values(3);
            theta(k) = values(4);
            
            t(k) = toc;
            % Writes data to file
            fprintf(fileid, "%d,%f,%f,%f,%f,%f\n", k, t(k), X(k), Y(k), R(k), theta(k));
            k = k + 1;
        else
            warning("Incomplete response at sample %d", k);
        end
         
    end
catch ME
    rethrow ME
end
%% Function After exe
function cleanupDAQ(~,fileid)
    if fileid > 0
        fclose(fileid);
    end
end




