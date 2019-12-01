module Main where

import Lib

solution1 :: String -> String
solution1 = show . Lib.part1 . map read . lines

solution2 :: String -> String
solution2 = show . Lib.part2 . map read . lines

main :: IO ()
main = interact solution2
