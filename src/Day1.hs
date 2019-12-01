module Day1
    ( basic
    , advanced
    ) where

fuelForMass :: Int -> Int
fuelForMass = flip (-) 2 . (`div` 3)

accFuelForMass :: Int -> Int
accFuelForMass =
    sum . takeWhile (> 0) . drop 1 . iterate fuelForMass

basic :: [Int] -> Int
basic = sum . map fuelForMass

advanced :: [Int] -> Int
advanced = sum . map accFuelForMass
