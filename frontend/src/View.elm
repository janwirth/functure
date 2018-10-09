module View exposing (view)

import Html exposing (Html, text, pre, div, h1, img, button)
import Html.Attributes exposing (src, value, class)
import Html.Events exposing (onInput, onClick)
import Bulma.Elements exposing (title, TitleSize(..))
import Bulma.Layout exposing (section, hero)

import Model exposing ( .. )
import Msg exposing ( Msg(..) )

showStatus model =
  (String.fromInt model.match.round) ++
    " - " ++
    (Debug.toString model.match.phase)

view : Model -> Html Msg
view model =
    div [ class "section" ]
        [
          title H1 [] [ text <| showStatus model ]
        , pre [] [ text <| Debug.toString model ]
        , button [onClick NextTurn ] [text "Done"]
        ]
