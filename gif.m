h = figure;
filename = 'animated.gif';
board = randi(2,20) -1;
% pboard is used to see if the previous board is exactly the same as the
% new. If this is true and we are not on the first loop,
pboard = 1;
n = 1;
while (~(isequal(board,pboard)))
    imshow(board, 'InitialMagnification', 'fit');
    drawnow;
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if n == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
    n = n + 1;
    pboard = board;
    board = simulate(board);
end
disp('End of execution')