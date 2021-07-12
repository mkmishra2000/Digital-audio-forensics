%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio analysis in the matlab
% Task :- Apply the wiener filter techniques on audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function audioOut = wienerFilter(Sound, fsample, slienceTime)

    % Both channel audio
    firstChannel = Sound(:,1);
    secondChannel = Sound(:,2);
    
%     Apply filter on both channel sound
    audioOut1=  WienerScalart96(firstChannel, fsample, slienceTime);
    audioOut2 = WienerScalart96(secondChannel, fsample, slienceTime);

    audioOut = [audioOut1, audioOut2];
end