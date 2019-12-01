module Main where

import qualified Day1
solution = Day1.advanced

main :: IO ()
main = interact $ show . solution . map read . lines
