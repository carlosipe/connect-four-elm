module BoardView exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (..)
import Model exposing (..)
import Element.Events exposing (onClick)
import Msg exposing (Msg)
import Board exposing (drawableBoard)
import Player exposing (..)


view : Model -> Element Styles FieldVariations Msg
view model =
    row BoardStyle
        [ spacing 5, padding 10, width (px 400) ]
        (Board.drawableBoard model.board
            |> List.indexedMap
                (\columnNumber boardColumn ->
                    column NoStyle
                        [ onClick (Msg.Play (columnNumber + 1))
                        , spacing 5
                        ]
                        (boardColumn
                            |> List.map
                                (\fieldContent ->
                                    boardField fieldContent model.currentPlayer
                                )
                        )
                )
        )


boardField : Maybe Player -> Player -> Element Styles FieldVariations Msg
boardField fieldContent currentPlayer =
    el BoardField
        [ (vary (CurrentPlayer currentPlayer) True)
        , (vary (Content fieldContent) True)
        , width (px 50)
        , height (px 50)
        ]
        empty
