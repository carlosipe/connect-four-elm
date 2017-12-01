module Styles exposing (..)

import Color exposing (red, yellow, blue, white, black)
import Style exposing (..)
import Style.Color as Color
import Style.Border as Border
import Style.Font as Font
import Model exposing (..)
import Player exposing (..)


type Styles
    = NoStyle
    | BoardStyle
    | BoardField
    | HeaderStyle


type FieldVariations
    = CurrentPlayer Player
    | Content (Maybe Player)


stylesheet =
    Style.styleSheet
        [ style BoardField
            [ Border.rounded 50
            , Color.background white
            , variation (CurrentPlayer Player1)
                [ hover [ Color.background yellow ]
                ]
            , variation (CurrentPlayer Player2)
                [ hover [ Color.background red ]
                ]
            , variation (Content (Just Player2)) [ Color.background red ]
            , variation (Content (Just Player1)) [ Color.background yellow ]
            ]
        , style BoardStyle
            [ Color.background blue
            ]
        , style HeaderStyle
            [ Font.size 24 -- all units given as px
            , Font.typeface
                [ Font.font "Helvetica"
                , Font.font "Comic Sans"
                , Font.font "Papyrus"
                ]
            ]
        ]
