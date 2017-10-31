board = randi(2,10) -1;
% pboard is used to see if the previous board is exactly the same as the
% new. If this is true and we are not on the first loop,
pboard = 1;
while (~(isequal(board,pboard)))
    imshow(board, 'InitialMagnification', 'fit');
    drawnow;
    pboard = board;
    board = simulate(board);
end
disp('End of execution')