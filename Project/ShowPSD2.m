%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio analysis in the matlab
% Task :- Show the priodogram of the signal with chossen window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ShowPSD2(Audio, fsample)

     % Divide the both channel sounds

    firstChannel = Audio(:,1);
    secondChannel = Audio(:,2);
    
    [pxx1, fc1] = pspectrum(firstChannel, fsample);
    [pxx2, fc2] = pspectrum(secondChannel, fsample);

    pxxLog1 = 10*log10(pxx1);
    pxxLog2 = 10*log10(pxx2);
    figure;
    subplot(2,2,1);
    plot(fc1,pow2db(pxx1),'linewidth', 1);
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Power Spectrum (dB)')
    title('Default Frequency Resolution (First channel)')

    subplot(2,2,3);
    semilogx(fc1, pxxLog1, 'r', 'linewidth', 1);
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Power Spectrum (dB)')
    title('Default Frequency Resolution n log scale (First channel)')

    subplot(2,2,2);
    plot(fc2,pow2db(pxx2),'linewidth', 1);
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Power Spectrum (dB)')
    title('Default Frequency Resolution (Second channel)')

    subplot(2,2,4);
    semilogx(fc2, pxxLog2, 'r', 'linewidth', 1);
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Power Spectrum (dB)')
    title('Default Frequency Resolution n log scale (Second channel)')

end