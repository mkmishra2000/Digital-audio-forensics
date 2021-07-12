function AutomaticGainControl(Sound, gain, N)

    STEREO =2;
    THRESHOLD_VALUE   = -40 ;


    OUTPUT_POWER_MIN  = -30 ;
    OUTPUT_POWER_MAX  = +30 ;

% read the number of channel(s) and  size of the input signal
    [m,n]=size(Sound);

% check validation input signal size and number of samples
if((1 == m) || (m < N))
        num2str(' Warning : input signal length is less than samples exiting ...')  %optional for testing
        %if input channel(s) are invalid then exit from the function
        y=0;
        return 
end

    % check for input signal is not zero if zero exit
    if( 0 == any(Sound))
            num2str('input signal is ZERO exiting ...')  %optional for testing
            %if input channel(s) are invalid then exit from the function
            y = Sound(1:N,:); 
            return 
    end

    % calculate input power
    p_db=10*log10(sum(Sound(1:N,:).^2)/N);                                  
    num2str(p_db,'\n input power in db %5f')                            %optional for testing

% check for threshold 
    if( min(p_db) < THRESHOLD_VALUE )
            num2str('input power level is below threshold exiting ...')  %optional for testing
            %if input below threshold then output = input
            y = Sound(1:N,:); 
            return 
    end

    % check for output power limits
    if( (gain_level < OUTPUT_POWER_MIN) || (gain_level > OUTPUT_POWER_MAX) )
            num2str('output power level is out of range exiting ...')  %optional for testing
            %if required output power is out of range then output = input
            y = Sound(1:N,:); 
            return 
    end


    output_power_Normal = 10.^(gain_level/10);

    energy = sum(x(1:N,:).^2);

    if( n == STEREO)

        num2str('input signal is STEREO.')  %optional for testing

        % calculate the multiplication factors K1 and K2 for stereo signal  
        K1 = sqrt( (output_power_Normal*N) / energy(:,1));
        K2 = sqrt( (output_power_Normal*N) / energy(:,2)); 

        % multiply K with input samples to get required stereo output samples      
        y(1:N,1) = x(1:N,1) * K1;
        y(1:N,2) = x(1:N,2) * K2;

    end

    p_db=10*log10(sum(y.^2)/N);                    %optional for testing                             
    num2str(p_db,'\n output power in db %5f')      %optional for testing

% You can comment out the optional part it is just for testing
end