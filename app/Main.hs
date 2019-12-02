module Main where

import qualified Day2
solution = Day2.advanced

main :: IO ()
main = interact $ show . solution . lines
