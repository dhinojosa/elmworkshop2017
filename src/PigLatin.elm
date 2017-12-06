module PigLatin exposing (main, pigLatin)

import Html
import Html.Attributes as Attr
import Html.Events as Evts
import List.Extra as LExtra


type alias Model =
    String


--This is not framework specification


type Action
    = MyOnKeyChange String


main : Program Never Model Action
main =
    Html.beginnerProgram
        { model = ""
        , view = viewFunction
        , update = updateFunction
        }


palindrome : String -> String
palindrome =
    String.reverse

isCons : Char -> Bool
isCons c = not << List.member c <| ['a', 'e', 'i', 'o', 'u']

isVowel : Char -> Bool
isVowel c = not <| isCons c

processConsonantWord : Maybe (List Char, List Char) -> String
processConsonantWord res = case res of
                             Just (hd, tl) -> 
                                String.fromList
                                   <| tl ++ hd ++ (String.toList "ay")
                             Nothing -> "way"


-- proConsWord : List Char -> List Char -> String
-- proConsWord lc = case lc of
--                    [] -> ""
--                    a :: rest -> 
--                       if (isVowel a) then (String.toList lc)
--                       else (proConsWord rest) ++ [a]

pigLatin : String -> String
pigLatin s =
   let 
       lstOfChars = String.toList s
   in
       case lstOfChars of
          [] -> "" -- empty
          [a] ->
             if (isVowel a) then
                 (String.fromChar a) ++ "way" --one
             else
                 (String.fromChar a) ++ "ay"
          a :: rest ->
             if (isVowel a) then
                (String.fromList lstOfChars) ++ "way"
             else
                 processConsonantWord
                         (LExtra.splitWhen isVowel lstOfChars)


styleList : List ( String, String )
styleList =
    [ ( "background-color", "green" )
    , ( "color", "white" )
    ]


viewFunction : Model -> Html.Html Action
viewFunction mod =
    Html.div
        [ Attr.id "outer-div"
        , Attr.style styleList
        ]
        [ Html.text "Enter Word: "
        , Html.input [ Evts.onInput MyOnKeyChange ] []
        , Html.text mod
        ]


updateFunction : Action -> Model -> Model
updateFunction myAction prevModel =
    case myAction of
        MyOnKeyChange s ->
            pigLatin s
