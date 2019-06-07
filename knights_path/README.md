
## Knight's Path

Knight's Path objective is to find a path of the knight on the chess board, from point `A` to point `B`, of the specified length `L`.
Points `A` and `B` are represented with coordinates of the square `X/Y`.

## Implementation Description

- **next(X/Y, NX/NY)** –> where `X/Y` are the coordinates of a square and `NX/NY` are the coordinates of a next possible square. This predicate defines how a knight will travel across the chess board.

- **possible_moves(X/Y, NX/NY)** –> where `X/Y` are the coordinates of a square and NX/NY are coordinates of a next possible square. This predicate is responsible for keeping the numbers within 1-8 range. It uses **next** to get `NX/NY` coordinates.

- **path_loop(C, X/Y, End, L, Path, Lt)** –> where `C` is the counter, `X/Y` are the coordinates of the first square, `End` contains the coordinates of the end, `L` is the length of the path, `Path` is the list where path coordinates are stored and `Lt` is the path that is returned in the end. **Path_loop** is responsible for constructing possible paths. It starts from `X/Y` square and adds it to the list. Then **possible_moves** method is called to get the coordinates of all possible next squares. Next the counter `C` is incremented by 1. This process is repeated until `C >= L`. In the base case, the path stored in `Lt` is reversed and the result is stored in `NP`. The last item of `NP` is checked to see if it matches the `End` coordinates.

- **knightjourney(X/Y, End, L)** –> where `X/Y` are the coordinates of the first square, `End` contains the coordinates of the end and `L` is the length of the path. This predicate returns true if there is a valid path of length `L`. Otherwise it returns false. To construct valid paths **knightpath** is used.

- **knightpassthru(Path, X/Y, N)** –> where `Path` is a list of coordinates, `X/Y` are the coordinates of the any square, `N` is the position in the list. This predicate returns true if `X/Y` square is N-th element in the list. To do that the `nth1` method is used.

- **knightpath(X/Y, End, L, Path)** –> where `X/Y` are the coordinates of the first square, `End` contains the coordinates of the end, `L` is the length of the path and `Path` is a list of coordinates. This predicate uses **path_loop** to get the path. Before **path_loop** is used the length `L` is decremented by 1. It is done, because the first square coordinates are supplied to **path_loop** inside path list. When the `Path` is returned from **path_loop**, the length of `Path` is checked to find out if it matches `L`. If the match is successful, cut is used and only one path is returned. 
