module Test.Money

import Money

%access export

assertEq : Eq a => (given : a) -> (expected : a) -> IO ()
assertEq g e = if g == e
                  then putStrLn "Test Passed"
                  else putStrLn "Test Failed"

testMoney : IO ()
testMoney = ?hole
