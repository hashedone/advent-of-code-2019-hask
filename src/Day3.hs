module Day3
    ( basic
    , extended
    ) where

import Data.Maybe
import Data.List.Split

data Point = Point { x :: Int,
                     y :: Int}
                     deriving Show

data Line = Line { from :: Point,
                   to :: Point }
                   deriving Show

data LineEx = LineEx { steps :: Int,
                       line :: Line }
                       deriving Show

dist :: Point -> Point -> Int
dist (Point x1 y1) (Point x2 y2) = abs (x1 - x2) + abs (y1 - y2)

len :: Line -> Int
len (Line from to) = dist from to

parsePoint :: String -> Point 
parsePoint ('U':tail) = Point 0 $ read tail
parsePoint ('R':tail) = Point (read tail) 0
parsePoint ('D':tail) = Point 0 $ -read tail
parsePoint ('L':tail) = Point (-read tail) 0

translate :: Point -> Point -> Point
translate (Point x y) (Point ox oy) = Point (x + ox) (y + oy)

updateFrom :: Line -> Point -> Line
updateFrom (Line _ to) from = Line from to

newLine :: Point -> Point -> Line
newLine origin trans = Line origin $ translate origin trans

exWire :: [Line] -> [LineEx]
exWire lines =
    scanl
        (\exl l -> LineEx (steps exl + len (line exl)) l)
        (LineEx 0 $ head lines)
        (tail lines)

buildWire :: [Point] -> [Line]
buildWire points =
    scanl
        (newLine . to)
        (Line (Point 0 0) $ head points)
        (tail points)

parse :: String -> [Line]
parse =
    buildWire . map parsePoint . splitOn ","

parseEx :: String -> [LineEx]
parseEx = exWire . parse

between :: Int -> Int -> Int -> Bool
between a b c
    | a <= c && c <= b = True
    | b <= c && c <= a = True
    | otherwise = False

intersect :: Line -> Line -> Maybe Point
intersect
    (Line (Point fxf fyf) (Point fxt fyt))
    (Line (Point sxf syf) (Point sxt syt))
    | fxf == fxt && syf == syt && between sxf sxt fxf && between fyf fyt syf =
        Just $ Point fxf syf
    | fyf == fyt && sxf == sxt && between syf syt fyf && between fxf fxt sxf =
        Just $ Point sxf fyf
    | otherwise = Nothing

intersectEx :: LineEx -> LineEx -> Maybe Int
intersectEx l1 l2 =
    (\p -> dist p (from $ line l1) + dist p (from $ line l2) + steps l1 + steps l2) <$>
    intersect (line l1) (line l2)

basic :: [String] -> Int
basic (wire1in:wire2in:_) =
    let wire1 = parse wire1in in
    let wire2 = parse wire2in in
    minimum $
    filter (> 0) $
    map (dist $ Point 0 0) $
    mapMaybe (uncurry intersect)
    [(l1, l2) | l1 <- wire1, l2 <- wire2]

-- extended :: [String] -> Int
extended (wire1in:wire2in:_) =
    let wire1 = parseEx wire1in in
    let wire2 = parseEx wire2in in
    minimum $
    filter (> 0) $
    mapMaybe (uncurry intersectEx)
    [(l1, l2) | l1 <- wire1, l2 <- wire2]
