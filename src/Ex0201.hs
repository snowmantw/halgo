
module Ex0201
    ( suffixes
    ) where

--
-- suffixes [1,2,3,4] = [[1,2,3,4], [2,3,4], [3,4], [4], []]
--
-- Should generate in O(n) time, O(n) space.
-- 
suffixes :: [] a -> [] [] a
suffixes xs@(x:xss) = doSuffixes xss [xs]

doSuffixes :: ([] a) [] -> [] [] a
doSuffixes []   r = r ++ []
doSuffixes x:xs r = doSuffixes xs (r ++ [xs])

{- Time and space analysis
 -
 -}
