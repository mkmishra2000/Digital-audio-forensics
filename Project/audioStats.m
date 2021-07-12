%Vishnu... thank you for electronics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name :- MANAS KUMAR MISHRA
% Audio forensic in the matlab
% Task :- Show the basic statistics of the signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function audioStats(Audio, fsample)

    % Divide the both channel sounds

    firstChannel = Audio(:,1);
    secondChannel = Audio(:,2);

    % Length of the channel
    Nfirst = length(firstChannel);
    Nsecond = length(secondChannel);
    
    % Maximum values of the channel
    MaxValFirst = max(firstChannel);
    MaxValSecond= max(secondChannel);
    
    disp(['Max value in first Channel = ' num2str(MaxValFirst)]);
    disp(['Max value in second Channel = ' num2str(MaxValSecond)]);
    
    % Minimum values in the channel
    minValFirst = min(firstChannel);
    minValSecond= min(secondChannel);
    
    disp(['Minimum value in first Channel = ' num2str(minValFirst)]);
    disp(['Minimum value in second Channel = ' num2str(minValSecond)]);
    
    % compute and display the the mean, standard deviation and varience values
    u_first = mean(firstChannel);
    u_second = mean(secondChannel);
    std_first = std(firstChannel);
    std_second = std(secondChannel);
    var_first = var(firstChannel);
    var_second = var(secondChannel);

    disp(['Mean value in first channel = ' num2str(u_first)]);
    disp(['Mean value in second channel= ' num2str(u_second)]);

    disp(['standard deviation of first channel= ' num2str(std_first)]);
    disp(['standard deviation of second channel= ' num2str(std_second)]);
    
    disp(['Variance of first channel= ' num2str(var_first)]);
    disp(['Variance of second channel= ' num2str(var_second)]);

    % Reference power  is 1 watt
    powerRef = 1;
    
    powerFirst =  sum(abs(firstChannel).^2)/Nfirst;
    powerSecond = sum(abs(secondChannel).^2)/Nsecond;
    
    % In dB
    powerFirstdB = 10*log10((powerFirst/powerRef));
    powerseconddB = 10*log10((powerSecond/powerRef));

    
    disp(['Power in first channel in dB= ' num2str(powerFirstdB)]);
    disp(['Power in second channel in dB= ' num2str(powerseconddB)]);
    
    disp(['Sampling frequency in Hz =', num2str(fsample)]);
end
