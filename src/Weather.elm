module Weather exposing (main)

import Html exposing (text, Html, program)
import Time exposing (Time, every, second, inSeconds)

type alias Model = {cityState : String
                    ,condition : String
                    ,seconds   : Float}

type Msg = OnEntry String | OnClick | Tick Time

init : (Model, Cmd Msg)
init = ({cityState = "", condition = "", seconds = 0.0}, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg mod = 
   case msg of
     Tick t -> ({mod | seconds = inSeconds t}, Cmd.none)
     _      -> (mod, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions mod = every second Tick

view : Model -> Html Msg
view mod = text <| "Hello World: " ++ (toString (mod.seconds))

main : Program Never Model Msg
main = program
          { init = init
          , update = update
          , subscriptions = subscriptions
          , view = view }
