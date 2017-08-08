
module Ex0201
    ( suffixes
    , sampleSuffixes
    , stressSuffixes
    ) where

--
-- suffixes [1,2,3,4] = [[1,2,3,4], [2,3,4], [3,4], [4], []]
--
-- Should generate in O(n) time, O(n) space.
-- 
suffixes :: [] a -> [] ([] a)
suffixes xs = doSuffixes xs [xs]

doSuffixes :: [] a -> [] ([] a) -> [] ([] a)
doSuffixes []     r = r ++ []
doSuffixes (x:xs) r = doSuffixes xs (r ++ [xs])

{- ---
 - Time analysis:
 - 
 - doSuffixes: will take N times for length N list
 -
 - ---
 - Space analysis:
 -
 - doSuffixes:
 -
 - 1. For every new element as input: it will generate a new (1 + P) length list, where P < N
 - 2. Do N times, so new lists occupy M space where M = 1 + 2 + 3 +..N = N^2/2 
 - 3. In theory, although it generates N new lists, but since those lists will be GCed soon, so only the latest one size N will be eventually kept
 - 4. Therefore, the total space of this program is: 2N, from the original list and the final generated list
 - 5. And if the original list is not used it can save to N.
 -}

sampleSuffixes = suffixes [1,2,3,4]
stressSuffixes = suffixes [1..ceiling (2^^32)]
