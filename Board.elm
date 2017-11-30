module Board exposing (Board, Plays, Position, initialBoard, MoveResult(..), move, winPlay, drawableBoard)

import Player exposing (..)
import Dict exposing (Dict)


type alias Board =
    { dimensions : ( Int, Int )
    , plays : Plays
    }


type alias Plays =
    Dict Position Player


type alias Position =
    ( Int, Int )


initialBoard : Board
initialBoard =
    { dimensions = ( 10, 10 )
    , plays = Dict.empty
    }


type MoveResult
    = Ok Board Position
    | OutOfBoardError


move : Board -> Int -> Player -> MoveResult
move board column player =
    let
        position =
            nextPositionForColumn board column
    in
        case positionInBoard board position of
            True ->
                Ok { board | plays = Dict.insert position player board.plays } position

            False ->
                OutOfBoardError


winPlay : Board -> ( Position, Player ) -> Bool
winPlay board ( position, player ) =
    let
        results =
            linesToCheck position
                |> List.map
                    (\line ->
                        line
                            |> List.map (\p -> getPosition board.plays p)
                            |> List.map
                                (\pp ->
                                    if pp == Just player then
                                        1
                                    else
                                        0
                                )
                            |> checkLine
                    )
    in
        results |> List.foldr (||) False



-- private API


drawableBoard : Board -> List (List (Maybe Player))
drawableBoard board =
    let
        ( columns, rows ) =
            board.dimensions
    in
        List.range 1 columns
            |> List.map
                (\c ->
                    List.range 1 rows
                        |> List.map
                            (\y ->
                                getPosition board.plays ( c, y )
                            )
                )


checkLine : List Int -> Bool
checkLine line =
    let
        continuousNum =
            line
                |> List.foldl
                    (\y x ->
                        if x == 4 then
                            4
                        else
                            x * y + y
                    )
                    0
    in
        continuousNum == 4


linesToCheck : Position -> List (List Position)
linesToCheck ( x, y ) =
    let
        directions =
            [ ( 0, 1 ) --  |
            , ( 1, 0 ) --  -
            , ( 1, 1 ) --  /
            , ( 1, -1 ) -- \
            ]
    in
        directions
            |> List.map
                (\( a, b ) ->
                    List.range -3 3
                        |> List.map
                            (\mult ->
                                ( a * mult + x, b * mult + y )
                            )
                )


getPosition : Plays -> Position -> Maybe Player
getPosition plays position =
    Dict.get position plays


positionInBoard : Board -> Position -> Bool
positionInBoard board position =
    let
        ( x, y ) =
            board.dimensions

        ( a, b ) =
            position
    in
        List.member a (List.range 1 x) && List.member b (List.range 1 y)


nextPositionForColumn : Board -> Int -> Position
nextPositionForColumn board column =
    let
        nextPosition ( a, b ) =
            case getPosition board.plays ( a, b ) of
                Nothing ->
                    ( a, b )

                _ ->
                    nextPosition ( a, b + 1 )
    in
        nextPosition ( column, 1 )
