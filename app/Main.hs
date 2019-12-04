module Main where

import qualified Day3
solution = Day3.extended

main :: IO ()
main = interact $ show . solution . lines
