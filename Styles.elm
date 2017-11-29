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
            , variation (NextPlayer Yellow)
                [ hover [ Color.background yellow ]
                ]
            , variation (NextPlayer Red)
                [ hover [ Color.background red ]
                ]
            , variation (Content (Just Red)) [ Color.background red ]
            , variation (Content (Just Yellow)) [ Color.background yellow ]
            ]
        , style BoardStyle
            [ Color.background blue
            ]
        ]
