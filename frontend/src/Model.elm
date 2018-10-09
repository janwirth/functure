module Model exposing (..)

demoMatch : Match
demoMatch = {
    competitors =  [
        Competitor "Daimler" Nothing "Some strategy"
      , Competitor "BMW" Nothing "Another strategy"
      , Competitor "VW" Nothing "Another strategy"
      , Competitor "Mitsubishi" Nothing "Another strategy"
    ]
  , customers =  [Customer "German Market", Customer "Chinese Market", Customer "US Market"]
  , phase = Offer
  , round = 1
  , end = 3
  }

type alias Competitor = {
      name : String
    , logo : Maybe String
    , strategy : String
  }

type alias Customer = {
    name : String
  }

type Phase = Intro | Offer | Negotiate | Evaluate | Over

---- MODEL ----
type alias Match = {
    competitors : List Competitor
  , customers : List Customer
  , phase : Phase
  , end : Int
  , round : Int
  }

type alias Model =
  {
    match : Match
  , text : Maybe String
  }
