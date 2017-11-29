module View exposing (view)

import Html
import Model exposing (..)
import Msg exposing (Msg)
import Styles exposing (..)
import Element exposing (column)
import Element.Attributes exposing (padding)


-- partials

import HeaderView
import BoardView


view : Model -> Html.Html Msg
view model =
    Element.layout stylesheet <|
        column NoStyle
            [ padding 10 ]
            [ HeaderView.view model.nextPlayer
            , BoardView.view model
            ]
