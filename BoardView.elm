module BoardView exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (..)
import Model exposing (..)


-- Change this by the real board


drawableBoard =
    [ [ Nothing, Nothing, Nothing ]
    , [ Nothing, Nothing, Just Player1 ]
    , [ Just Player2, Just Player2, Just Player1 ]
    ]


view : Model -> Element Styles FieldVariations msg
view model =
    row BoardStyle
        []
        (drawableBoard
            |> List.map
                (\boardColumn ->
                    column NoStyle
                        []
                        (boardColumn
                            |> List.map
                                (\fieldContent ->
                                    boardField fieldContent model.nextPlayer
                                )
                        )
                )
        )


boardField : Maybe Player -> Player -> Element Styles FieldVariations msg
boardField fieldContent nextPlayer =
    el BoardField
        [ (vary (NextPlayer nextPlayer) True)
        , (vary (Content fieldContent) True)
        , width (px 20)
        , height (px 20)
        ]
        empty
