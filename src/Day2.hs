module Day2
    ( basic
    , advanced
    ) where

import Data.List.Index
import Data.List.Split

interpretOp :: Int -> [Int] -> [Int] -> [Int]
interpretOp 1 (l:r:res:_) state =
    setAt res (state !! l + state !! r) state
interpretOp 2 (l:r:res:_) state =
    setAt res (state !! l * state !! r) state

interpretAt :: Int -> [Int] -> Int
interpretAt pc state =
    let op = state !! pc in
    let args = drop (pc + 1) state in
    case op of
         99 -> head state
         _ -> interpretAt (pc + 4) $ interpretOp op args state

interpret :: Int -> Int -> [Int] -> Int
interpret noun verb =
    interpretAt 0 . setAt 1 noun . setAt 2 verb

parseInput :: [String] -> [Int]
parseInput =  concatMap $ map read . splitOn ","

basic :: [String] -> Int
basic = interpret 12 2 . parseInput

advanced :: [String] -> Int
advanced input =
    let program = parseInput input in
    head [noun * 100 + verb | noun <- [0..99],
                              verb <- [0..99],
                              interpret noun verb program == 19690720]
