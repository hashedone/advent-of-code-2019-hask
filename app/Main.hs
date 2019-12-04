module Main where

import qualified Day4
solution = Day4.advanced

main :: IO ()
main = interact $ show . solution . lines
