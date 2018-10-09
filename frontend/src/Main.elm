module Main exposing (..)

import Browser
import View exposing (view)
import Foo

import Http
import Json.Decode as Decode

import Model exposing (..)
import Msg exposing (Msg(..))

init : ( Model, Cmd Msg )
init =
    ( {
      match = demoMatch,
      text = Nothing
    }, Cmd.none )

nextTurn match =
  if match.end == match.round then { match | phase = Over } else
    let
      round = case match.phase of
        Evaluate -> match.round + 1
        _ -> match.round
      phase = case match.phase of
        Intro -> Offer
        Offer -> Negotiate
        Negotiate -> Evaluate
        Evaluate -> Offer
        Over -> Over
    in
      { match
        | round = round
        , phase = phase
      }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NextTurn ->
        ({ model | match = nextTurn model.match }, send)
    LoadData res -> case res of
      Ok val -> ({ model | text = Just val }, Cmd.none)
      Err _ -> ( model, Cmd.none)
        

getData : Http.Request String
getData =
  Http.get "http://localhost:3000/myfunc" decodeData

---- PROGRAM ----

decodeData =
    (Decode.field "text" Decode.string)

main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }


send : Cmd Msg
send =
  Http.send LoadData getData
