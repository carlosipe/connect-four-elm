module Model exposing (..)


type alias Model =
    { nextPlayer : Player
    , winner : Maybe Player
    , board : Board
    }


initialModel : Model
initialModel =
    Model Player2 Nothing initialBoard


type Player
    = Player2
    | Player1


type alias Board =
    { width : Int
    , height : Int
    }


initialBoard : Board
initialBoard =
    Board 7 7
