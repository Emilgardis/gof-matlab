%board = uint8(zeros(20,20));
pboard = board;
first = 1;
while (~(isequal(board,pboard)) || (first == 1))
    first = 0;
    pboard = board;
    board = simulate(board);
    spy(board)
    pause(1)
end
disp('End of execution')