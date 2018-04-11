clear
clc
x = [1,2,3,4,5,6,7];

ssqr = 0;
for i=1:7 
    ssqr = ssqr + x(i)^2;
end
msqr = ssqr/length(x);
rmsqr = sqrt(msqr);

% rmsqr = sqrt(mean(sum(x.^2))) %this is equivalent to lines 5-10

ANS = rms(x); % The rms function to get the desired result to verify my answer

if rmsqr==ANS
     disp( ['correct! RMS is ', num2str(rmsqr), '.'] ); % convert to a string to display
else
     disp ('wrong!');
end
