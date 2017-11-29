module Main exposing (..)

import Html exposing (..)


type alias Model =
    { nextPlayer : Player
    , winner : Maybe Player
    , board : Board
    }


initialModel : Model
initialModel =
    Model Red Nothing initialBoard


type Player
    = Red
    | Yellow


type alias Board =
    Int


initialBoard : Board
initialBoard =
    10


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


view : Model -> Html Msg
view model =
    text "hey"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


type Msg
    = NoOp


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
