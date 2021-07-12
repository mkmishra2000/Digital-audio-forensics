%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio forensic in the matlab
% Task :- Show the spectrogram of the signal with chossen window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ShowSpectrogram(Audio, fsample)
    
    % Divide the both channel sounds

    firstChannel = Audio(:,1);
    secondChannel = Audio(:,2);

    % Length of the channel
    Nfirst = length(firstChannel);
    Nsecond = length(secondChannel);
    
    % Spectrogram of the audio signal

    prompt = {'Enter the window length less than total samples and more than 8'};
    dlgtitle = 'Window Length';
    definput = {'1024'};
    dims = [1 60];


    opts.Interpreter = 'tex';
    answer = inputdlg(prompt,dlgtitle,dims,definput,opts);
    winLen = str2num(answer{1});

    if winLen>8 && winLen <Nfirst
        quest = 'Enter the window type for spectrogram';
        dgltitle= 'Window selection';
        btn1 ='Hanning';
        btn2 ='Hamming';
        btn3 = 'Blackman';

        defbtn = btn1;

        answer = questdlg(quest, dgltitle, btn1, btn2, btn3, defbtn);

        switch answer
            case btn1
                win = hann(winLen, 'periodic'); %periodic flag is for spectral analysis.
            case btn2
                win = hamming(winLen, 'periodic');
            case btn3
                win = blackman(winLen, 'periodic');
        end
    end

    hop = round(winLen/4);

    noverlap = winLen - hop;

    nfft = round(2*winLen);

    [~, Fvalue1, Time1, STFT]=spectrogram(firstChannel, win, noverlap, nfft, fsample,'power');
    [~, Fvalue2, Time2, STFT3]=spectrogram(secondChannel, win, noverlap, nfft, fsample,'power');
    
    
    STFT2 = 10*log10(STFT);
    STFT4 = 10*log10(STFT3);
    
    figure;
    surf(Time1, Fvalue1, STFT2);
    shading interp
    axis tight
    box on
    view(0, 90);
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
    xlabel("Time");
    ylabel("frequency");
    title("Spectrogram of the first channel");

    
    [~, cmax] = caxis;
    caxis([max(-120, cmax-90), cmax])

    hClbr = colorbar;
    set(hClbr, 'FontName', 'Times New Roman', 'FontSize', 12)
    ylabel(hClbr, 'Magnitude, dBV^2')
    
    
    figure;
    surf(Time2, Fvalue2, STFT4);
    shading interp
    axis tight
    box on
    view(0, 90);
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
    xlabel("Time");
    ylabel("frequency");
    title("Spectrogram of the second channel");
    
    [~, cmax] = caxis;
    caxis([max(-120, cmax-90), cmax])

    hClbr = colorbar;
    set(hClbr, 'FontName', 'Times New Roman', 'FontSize', 14)
    ylabel(hClbr, 'Magnitude, dBV^2')
end