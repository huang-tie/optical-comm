%% Select appropriate optimized clipping ratio

if sim.quantiz

    casestr = ['ENOB = ' num2str(sim.ENOB) ', ' sim.type ', CS = ' num2str(ofdm.CS)];
       
    switch casestr
        case 'ENOB = 5, preemphasis, CS = 16'
            Fnl = (15:5:50)*1e9;
            
            RCLIPTX = [4.0 3.9 3.7 3.7 3.7 3.7 3.7 3.7];       % optmized clipping ratio
            RCLIPRX = [3.6 3.6 3.5 3.4 3.4 3.4 3.4 3.4];       % optmized clipping ratio

        case 'ENOB = 5, palloc, CS = 16'
            Fnl = (15:5:50)*1e9;

            RCLIPTX = [3.8 3.7 3.7 3.7 3.7 3.7 3.7 3.7];       % optmized clipping ratio
            RCLIPRX = [3.5 3.5 3.5 3.4 3.4 3.4 3.4 3.4];       % optmized clipping ratio

        case 'ENOB = 6, preemphasis, CS = 16'
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [4.2 4.0 3.9 3.7 3.7 3.7 3.7 3.7 3.7];       % optmized clipping ratio
            RCLIPRX = [3.5 3.5 3.5 3.5 3.5 3.4 3.4 3.4 3.4];       % optmized clipping ratio

        case 'ENOB = 6, preemphasis, CS = 64'
            Fnl = (15:5:50)*1e9;

            RCLIPTX = [4.2 4.1 4.0 4.0 4.0 4.0 4.0 4.0];       % optmized clipping ratio
            RCLIPRX = [3.8 3.8 3.8 3.8 3.8 3.8 3.8 3.8];       % optmized clipping ratio

        case 'ENOB = 6, palloc, CS = 16'
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [3.9 3.8 3.7 3.7 3.7 3.7 3.7 3.7 3.7];       % optmized clipping ratio
            RCLIPRX = [3.5 3.5 3.4 3.4 3.4 3.4 3.4 3.4 3.4];       % optmized clipping ratio

        case 'ENOB = 6, palloc, CS = 64'
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [4.4 4.3 4.1 4.1 3.9 3.9 3.9 3.9 3.9];       % optmized clipping ratio
            RCLIPRX = 0.2+[3.5 3.5 3.4 3.4 3.4 3.4 3.4 3.4 3.4];       % optmized clipping ratio

        otherwise
            error('invalid option!')
    end
    
    if isfield(tx.modulator, 'fc')
        loc = find(tx.modulator.fc == Fnl);

        if isempty(loc)
            error('No clipping ratio for selected frequency')
        else
            sim.rcliptx = RCLIPTX(loc);
            sim.rcliprx = RCLIPRX(loc); 
        end
    end
else
    casestr = [sim.type ', CS = ' num2str(ofdm.CS)];
    
    switch casestr
        case 'preemphasis, CS = 16'
            Fnl = (10:5:50)*1e9;
            
            RCLIPTX = [4.2 4.0 3.9 3.7 3.7 3.7 3.7 3.7 3.7];
        
        case 'preemphasis, CS = 64'
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [4.3 4.2 4.1 4.0 4.0 4.0 4.0 4.0 4.0];
            
        case 'palloc, CS = 16'
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [3.9 3.8 3.7 3.7 3.7 3.7 3.7 3.7 3.7];
        
        case 'palloc, CS = 64'       
            Fnl = (10:5:50)*1e9;

            RCLIPTX = [4.4 4.3 4.1 4.1 3.9 3.9 3.9 3.9 3.9];
        otherwise
            error('invalid option!');
    end

    if isfield(tx.modulator, 'fc')
        loc = find(tx.modulator.fc == Fnl);

        if isempty(loc)
            error('No clipping ratio for selected frequency')
        else
            sim.rcliptx = RCLIPTX(loc);
        end
    end
end

disp(casestr)
    