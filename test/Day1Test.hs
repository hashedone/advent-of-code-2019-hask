module Day1Test
    (tests
    ) where 

import qualified Day1
import Test.HUnit

day1Basic = TestCase(
    sequence_ [
        2 @=? Day1.basic [12],
        2 @=? Day1.basic [14],
        654 @=? Day1.basic [1969],
        33583 @=? Day1.basic [100756]
        ]
    )

day1Advanced = TestCase(
    sequence_ [
        2 @=? Day1.advanced [14],
        966 @=? Day1.advanced [966],
        50346 @=? Day1.advanced [100756]
        ]
    )

tests = [
    TestLabel "Day 1 Basic" day1Basic,
    TestLabel "Day 1 Advaced" day1Advanced
    ]
