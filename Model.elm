module Model exposing (..)


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
