%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio analysis in the matlab
% Task :- Show the waveform of the signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function ShowWaveform(Audio, fsample)
    % Divide the both channel sounds

    firstChannel = Audio(:,1);
    secondChannel = Audio(:,2);

    % Length of the channel
    Nfirst = length(firstChannel);
    Nsecond = length(secondChannel);

    % timerange of the sound recording in both channels
    t_first = (0:Nfirst-1)/fsample;
    t_second = (0:Nsecond-1)/fsample;

    % plot the sound samples of both samples
    figure;
    subplot(2,1,1);
    plot(t_first, firstChannel, "linewidth", 0.8);
    xlim([0 max(t_first)]);
    grid minor;
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
    ylabel("Amplitude");
    xlabel("seconds");
    title("First channel sound samples");

    subplot(2,1, 2);
    plot(t_second, secondChannel, "linewidth", 0.8);
    xlim([0 max(t_second)]);
    grid minor;
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
    ylabel("Amplitude");
    xlabel("seconds");
    title("Second channel sound samples");

end