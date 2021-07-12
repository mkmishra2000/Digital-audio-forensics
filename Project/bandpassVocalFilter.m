%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio analysis in the matlab
% Task :- Apply the bandpass filter from 250Hz to 4000Hz on audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function resultantAudio = bandpassVocalFilter(Sound, order,fsample, Audiolevel)
    
    %Lower and Higher end frequnecy of vocal range
    lowerF = 250;
    higherF =4000;
    
    %Noramlized Frequencies
    w_cutoff_lower= 2*pi*lowerF/fsample;
    w_cutoff_high = 2*pi*higherF/fsample;
    
    %FIR filter design.
    filterCofficients = fir1(order,[w_cutoff_lower, w_cutoff_high]);
    
%     Plot the filter response
    figure;
    freqz(filterCofficients, 1, 512);
    
    % Both channel audio
    firstChannel = Sound(:,1);
    secondChannel = Sound(:,2);
    
    % Apply filter on the first and second channel
    First_Channel = filter(filterCofficients, Audiolevel, firstChannel);
    second_Channel = filter(filterCofficients, Audiolevel, secondChannel);

    resultantAudio = [First_Channel , second_Channel];

end