%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio analysis in the matlab
% Task :- Show the Histogram of the signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ShowHisto(Audio)

    % Divide the both channel sounds

    firstChannel = Audio(:,1);
    secondChannel = Audio(:,2);

    % Length of the channel
    Nfirst = length(firstChannel);
    Nsecond = length(secondChannel);
    
    
    figure;
    subplot(2,1,1);
    histogram(firstChannel, round(sqrt(Nfirst/10)), 'FaceColor', 'r');
    xlim([min((firstChannel)) max((firstChannel))])
%     ylim([0 1.1*max(get(hHist, 'Values'))])
    grid on
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 10)
    xlabel('Amplitude, V')
    ylabel('Number of samples')
    title('Histogram of the first audio channel')

    subplot(2,1,2);
    histogram(secondChannel, round(sqrt(Nsecond/10)), 'FaceColor', 'r');
    xlim([min((secondChannel)) max((secondChannel))])
%     ylim([0 1.1*max(get(hHist, 'Values'))])
    grid on;
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 10)
    xlabel('Amplitude, V')
    ylabel('Number of samples')
    title('Histogram of the second audio channel')

    

    
end