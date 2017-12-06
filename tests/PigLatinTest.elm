module PigLatinTest exposing (..)

import PigLatin exposing (pigLatin)
import Test exposing (..)
import Expect

suite : Test
suite = describe "pig latin" [
          describe "empty string" [
            test "that a pig latin of empty is empty" <|
              \_ ->
                 let
                     r = PigLatin.pigLatin ""
                 in
                    Expect.equal r ""
            , test "that an a is equal away" <|
              \_ ->
                 let
                     r = PigLatin.pigLatin "a"
                 in
                    Expect.equal r "away"
             , test "that an b is equal bay" <|
              \_ ->
                 let
                     result = PigLatin.pigLatin "b"
                 in
                    Expect.equal result "bay"
             , test "that an brain is equal bay" <|
              \_ ->
                 let
                     result = PigLatin.pigLatin "brain"
                 in
                    Expect.equal result "ainbray"
          ]
        ]
