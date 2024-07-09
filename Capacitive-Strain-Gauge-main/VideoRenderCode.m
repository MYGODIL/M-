%% important : if you already have variable V in your code, change the variable V in this code to another name.


%% put this code at the beginning of for loop. (outside loop)

fullscreenmode = 2 ; % 1 = fullscreen mode (slow downs the preview) , 2 = defalut figure size (faster preview mode)
mymovie = 0 ; % 0 = don't render the movie , 1 = render the movie

if mymovie == 1
    myclock = clock ; % clock time stamp for file name 
    v = VideoWriter(['filename' date num2str(myclock(6))],'MPEG-4') ; % name of the file, type of the file
    v.FrameRate = 60 ; % framerate
    open(v) ;    % open video editor
end

if fullscreenmode == 1
    fig1 = figure('WindowState','maximized','menubar','none','Toolbar','none'); % maximized figure window
    set(gca,'units','normalized','position',[0 0 1 1]); % zero margin
elseif fullscreenmode == 2
    fig1 = figure('menubar','none','Toolbar','none') ; % autosize
    set(gca,'units','normalized','position',[0 0 1 1]); % zero margin
end
%% put this code after drawnow . (inside for loop)
         
if mymovie == 1
    myframe = getframe(gcf) ;
    writeVideo(v,myframe) ;
end

%% put this code after ending of for loop. (outside loop)

if mymovie == 1    
    close(v) ;
end