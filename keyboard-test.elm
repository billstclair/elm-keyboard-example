----------------------------------------------------------------------
--
-- keyboard-test.elm
-- Copyright (c) 2016 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE.txt
--
----------------------------------------------------------------------

import Keyboard

import String
import Char
import Html exposing (Html, Attribute, div, text, h2, p, span, a)
import Html.Attributes exposing (style, href)
import Html.App as Html
import Debug exposing (log)
import Platform.Sub exposing (batch)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { press: Int
  , down: Int
  , up: Int
  }

qm : Int
qm = Char.toCode '?'

model : Model
model = { press = qm
        , down = qm
        , up = qm
        }

type Msg
  = KeyPressed Int
  | KeyDown Int
  | KeyUp Int

init : (Model, Cmd Msg)
init = (model, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
      KeyPressed key ->
        ({ model | press = log "KeyPressed:" key }, Cmd.none)
      KeyDown key ->
        ({ model | down = log "KeyDown:" key }, Cmd.none)
      KeyUp key ->
        ({ model | up = log "KeyUp:" key }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  batch [ Keyboard.presses KeyPressed
        , Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]

bold: Attribute a
bold =
  style [ ("fontWeight", "bold") ]

br : Html a
br =
  Html.br [] []

displayCode : Int -> String -> Html a
displayCode code label =
  span []
    [span [ bold ] [ text (label ++ ": ") ]
    , text <| toString code
    , text " / '"
    , text <| String.fromList [ Char.fromCode code ]
    , text "'"
    ]
  
view : Model -> Html Msg
view model =
  div []
    [ h2 [] [ text "Elm Keyboard Test" ]
    , p [] [ displayCode model.press "press"
           ,br
           , displayCode model.down "down"
           ,br
           , displayCode model.up "up"
           ]
    , p [] [ text "Press keys and their keycodes will appear above." ]
    , p [] [ text "Only the arrow keys (and escape) get presses for for me in Firefox." ]
    , p [] [ text "The arrow keys do NOT get presses in Safari, Chrome, or Opera,"
           , text " but the other keys do."
           ]
    , p [] [ text "See "
           , a [ href "https://github.com/elm-lang/keyboard/issues/3" ]
             [ text "github.com/elm-lang/keyboard/issues/3" ]
           , text ": \"Not all key codes work in every browser.\""
           ]
    , p [] [ text "Source code: "
           , a [ href "https://github.com/billstclair/elm-keyboard-example" ]
             [ text "github.com/billstclair/elm-keyboard-example" ]
           , text "."
           ]
    ]
