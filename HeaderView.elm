module HeaderView exposing (view)

import Styles exposing (..)
import Element exposing (..)
import Element.Attributes exposing (padding)
import Model exposing (Model, GameState(..))
import Player exposing (..)
import Element.Events exposing (..)
import Msg exposing (Msg)


view : Model -> Element Styles variation Msg
view model =
    column NoStyle
        []
        [ el NoStyle [] (text (headerText model.gameState model.currentPlayer))
        ]


headerText : GameState -> Player -> String
headerText gameState currentPlayer =
    case gameState of
        Playing ->
            "Playing: " ++ playerToString currentPlayer

        Won player ->
            (playerToString player) ++ " wins"


playerToString : Player -> String
playerToString player =
    case player of
        Player1 ->
            "Player 1"

        Player2 ->
            "Player 2"
