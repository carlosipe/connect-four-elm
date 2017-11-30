module Styles exposing (..)

import Color exposing (red, yellow, blue, white, black)
import Style exposing (..)
import Style.Color as Color
import Style.Border as Border
import Model exposing (..)


type Styles
    = NoStyle
    | BoardStyle
    | BoardField


type FieldVariations
    = NextPlayer Player
    | Content (Maybe Player)


stylesheet =
    Style.styleSheet
        [ style BoardField
            [ Border.rounded 50
            , Color.background white
            , variation (NextPlayer Player1)
                [ hover [ Color.background yellow ]
                ]
            , variation (NextPlayer Player2)
                [ hover [ Color.background red ]
                ]
            , variation (Content (Just Player2)) [ Color.background red ]
            , variation (Content (Just Player1)) [ Color.background yellow ]
            ]
        , style BoardStyle
            [ Color.background blue
            ]
        ]
