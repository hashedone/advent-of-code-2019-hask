import Test.HUnit
import Data.List
import Data.Tuple.Extra
import qualified Day1
import qualified Day1Test

tests = TestList $ concat [
    Day1Test.tests
    ]

main :: IO ()
main =  runTestTT tests >>= print
