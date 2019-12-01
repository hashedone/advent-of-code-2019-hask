module Lib
    ( part1
    , part2
    ) where

fuelForMass :: Int -> Int
fuelForMass = flip (-) 2 . (`div` 3)

accFuelForMass :: Int -> Int
accFuelForMass =
    sum . takeWhile (> 0) . drop 1 . iterate fuelForMass

part1 :: [Int] -> Int
part1 = sum . map fuelForMass

part2 :: [Int] -> Int
part2 = sum . map accFuelForMass
