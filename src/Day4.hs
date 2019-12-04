module Day4
    ( basic
    , advanced
    ) where

import Data.List
import Data.List.Split

range :: String -> [Int]
range s =
    let l = splitOn "-" s in
    let low = read $ head l in
    let high = read $ l !! 1 in
    [low..high]

adj :: String -> Bool
adj s = or $ zipWith (==) s (drop 1 s)

adjEx :: String -> Bool
adjEx s =
    any (\(c1, c2, c3, c4) -> c1 /= c2 && c2 == c3 && c3 /= c4) $
    zip4
    (' ':s)
    s
    (drop 1 s)
    (drop 2 (s ++ " "))

raising :: String -> Bool
raising s = and $ zipWith (<=) s (drop 1 s)

basic :: [String] -> Int
basic (input:_) =
    length $
    filter adj $
    filter raising $
    map show $
    range input

advanced :: [String] -> Int
advanced (input:_) =
    length $
    filter adjEx $
    filter raising $
    map show $
    range input

