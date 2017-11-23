disp('Enter a number to get the corresponding board start')
fprintf('1: Example 1\n2: Example 2\n:3 Acorn\n4: Random\n5: Preset (by user)\n')
inp = input('#:');
title_ = '';
if isempty(inp) || inp == 4
    clear board
    clear boardsize
elseif inp == 1
    title_ = 'Example 1';
    board = zeros(16);
    % Verticals
    board(5:9,5) = 1;
    board(7:11,11) = 1;
    % Horizontals
    board(5,7:11) = 1;
    board(11,5:9) = 1;
elseif inp == 2
    title_ = 'Example 2';
    board = zeros(16);
    board(5,6:11) = [0 1 0 0 1 0];
    board(6,6:11) = [0 1 1 1 1 0];
    board(7,6:11) = [1 0 0 0 0 1];
    board(8,6:11) = [1 0 1 1 0 1];
    board(9,6:11) = [1 0 0 0 0 1];
    board(10,6:11)= [0 1 1 1 1 0];
elseif inp == 3
    title_ = 'Acorn';
    board = zeros(60,100);
    board(30-1,50-3:50+3) = [0 1 0 0 0 0 0];
    board(30,50-3:50+3)   = [0 0 0 1 0 0 0];
    board(30+1,50-3:50+3) = [1 1 0 0 1 1 1]; 
end

if ~exist('boardsize', 'var') || isempty(boardsize)
    boardsize = [50,100];
end
if ~exist('board', 'var') || isempty(board)
    board = randi(2,boardsize) -1;
else
   boardsize = size(board);
end
% make new figure
h = figure;
% pboard is used to see if the previous board is exactly the same as the
% new. If this is true, exit the loop.
pboard = 1;
generation = 0;
while (~(isequal(board,pboard)))
    imshow(~board, 'InitialMagnification', 'fit');
    title(sprintf('%s Generation %d', title_, generation));
    drawnow;
    pboard = board;
    board = simulate(board);
    generation = generation + 1;
end
disp('End of execution')