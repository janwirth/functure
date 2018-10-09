module Msg exposing ( Msg(..) )

import Http

-- Interactive Features of the App
type Msg
    = NextTurn
    | LoadData (Result Http.Error String)
