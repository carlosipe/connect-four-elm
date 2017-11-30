module Model exposing (..)

import Board exposing (Board)
import Player exposing (..)


type alias Model =
    { currentPlayer : Player
    , gameState : GameState
    , board : Board
    }


type GameState
    = Won Player
    | Playing


initialModel : Model
initialModel =
    Model Player2 Playing Board.initialBoard
