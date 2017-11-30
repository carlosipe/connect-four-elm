module HeaderView exposing (view)

import Styles exposing (..)
import Element exposing (..)
import Element.Attributes exposing (padding)
import Model exposing (..)


view : Player -> Element Styles variation msg
view nextPlayer =
    el NoStyle [] (text ("Next player: " ++ (playerColor nextPlayer)))


playerColor : Player -> String
playerColor player =
    case player of
        Player1 ->
            "Player 1"

        Player2 ->
            "Player 2"
