module BoardView exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (..)
import Model exposing (..)


type alias FieldContent =
    Maybe Player


view : Model -> Element Styles FieldVariations msg
view model =
    let
        width =
            model.board.width

        height =
            model.board.width
    in
        column BoardStyle
            []
            (List.range 1 width
                |> List.map (\_ -> boardRow model model.nextPlayer)
            )


boardRow : Model -> Player -> Element Styles FieldVariations msg
boardRow model nextPlayer =
    row NoStyle
        [ padding 5, spacing 5 ]
        (List.range 1 model.board.height
            |> List.map (\_ -> boardField (fieldContent model 3) nextPlayer)
        )


fieldContent : Model -> Int -> FieldContent
fieldContent model position =
    Nothing


boardField : FieldContent -> Player -> Element Styles FieldVariations msg
boardField content nextPlayer =
    el BoardField
        [ (vary (NextPlayer nextPlayer) True)
        , (vary (Content content) True)
        , width (px 20)
        , height (px 20)
        ]
        empty
