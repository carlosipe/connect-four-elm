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
    { width : Int
    , height : Int
    }


initialBoard : Board
initialBoard =
    Board 7 7
