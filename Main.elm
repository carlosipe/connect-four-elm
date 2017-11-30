module Main exposing (..)

import Model exposing (Model, initialModel, GameState(..))
import View exposing (view)
import Msg exposing (Msg)
import Html
import Player exposing (..)
import Board exposing (Board)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case model.gameState of
        Won player ->
            ( model, Cmd.none )

        Playing ->
            case msg of
                Msg.Play column ->
                    case Board.move model.board column model.currentPlayer of
                        Board.OutOfBoardError ->
                            ( model, Cmd.none )

                        Board.Ok newBoard lastPosition ->
                            case Board.winPlay newBoard ( lastPosition, model.currentPlayer ) of
                                True ->
                                    ( { model
                                        | board = newBoard
                                        , gameState = Won model.currentPlayer
                                      }
                                    , Cmd.none
                                    )

                                False ->
                                    ( { model
                                        | board = newBoard
                                        , currentPlayer = Player.otherPlayer model.currentPlayer
                                      }
                                    , Cmd.none
                                    )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
