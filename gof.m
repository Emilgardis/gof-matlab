if ~exist('boardsize', 'var')
    boardsize = 20;
end
% make new figure
h = figure;
board = randi(2,boardsize) -1;
% pboard is used to see if the previous board is exactly the same as the
% new. If this is true, exit the loop.
pboard = 1;
while (~(isequal(board,pboard)))
    imshow(~board, 'InitialMagnification', 'fit');
    drawnow;
    pboard = board;
    board = simulate(board);
end
disp('End of execution')