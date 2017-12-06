module Sample exposing (main)

import Html exposing (text, Html, div)
import String
import List

stringWithSizeMultiply : String -> Int -> (String, Int)
stringWithSizeMultiply s n = (s, (stringLength s) * n)

(~) : Int -> Int -> (Int, (Int, Int))
(~) a b = (a,(a,b))

stringLength : String -> Int
stringLength = String.length

patternMatchList : List a -> String
patternMatchList xs = 
   case xs of
      []  -> "Empty"
      a :: [] -> "One"
      a :: b :: [] -> "Two"
      a :: b :: rest ->
          let items = ["2 with",
                       (toString << List.length <| rest),
                       " more"]
          in
             List.concat items

main : Html msg
main = div[][
            text
              << (++) "Hello, Elm, Good to meet you!"
              << toString
              <| stringWithSizeMultiply "Elm\'s World" 10
           , stringWithSizeMultiply "Elm's World 2" 10
               |> toString
               >> (++) "Hello, again, "
               >> text
           ,text << toString << List.map sqrt <| [1,2,3,4]
           ,text << patternMatchList <| [1,2,3,4]
       ]
