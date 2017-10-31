function [newboard] = simulate(board)
%simulate simulates the game of life
%   ---
arrsize = size(board);
newboard = board;
for xx = 1:arrsize(1)
    for yy= 1:arrsize(2)
        n = getNeighbours(board, xx, yy);
        if (n < 2 || n > 3)
            % die
            newboard(xx,yy) = 0;
        elseif (n == 3)
            % spawn
            newboard(xx,yy) = 1;
        end
    end
end
end

function [count] = getNeighbours(board, sx, sy)
%getNeighbours count neighbours to cell at sx,sy
%   convolution of 3x3 [1 1 1; 1 0 1; 1 1 1], returning the value of the center
%   element
neighbours = [-1 1; 0, 1; 1 1; -1 0; 1 0; -1 -1; 0 -1; 1 -1];
count = 0;
boardsize = size(board);
for i = 1:8
    x = neighbours(i,1)+sx;
    y = neighbours(i,2)+sy;
    % are we wrapping or not, for now, consider out of bounds as empty,
    % later we may want to make the world into a sphere.
    if (~((x == 0) || (x > boardsize(1))) ...
            && ~((y == 0) || (y > boardsize(2))))
        count = count + board(x, y);
    end
    
end
end

