module Main where

import System.IO (putStr)
-- import Ex0201 (sampleSuffixes, stressSuffixes)
import Tree (Tree(..), left, morris)
import Control.Monad (mapM_, void)
import Text.Show (show)
import Debug.Trace (trace)
import SieveEratosthenes (exam)

treeA :: Tree Int
treeA = Tree 0 (Leaf 1) treeB

treeB :: Tree Int
treeB = Tree 3 (Leaf 4) (Leaf 5)

treeC :: Tree Int
treeC = Tree 97 (Leaf 98) (Leaf 99)

treeD :: Tree Int
treeD = Tree (-1) treeA treeC

main :: IO ()
main = putStrLn "Sieve Eratosthenes" >> exam (2^10)

{- With message printing
 -
main = do
  putStr "["
  mapM_ (putStr.show) stressSuffixes
  putStr "]\n"
-}

-- ** Wrong version **
--
-- main = void $ return $ fmap print sampleSuffixes
--
-- This will print nothing. Because only the first layer of IO will be executed by runtime.
-- (The wrapped IO won't be needed in any case, so no evaluation).
--
-- This wrong version represents that IO should always be the outmost Monad, and other effects
-- should be embedded inside it.
--
-- Instead of, mapM and mapM_ by define is explicitly "evaluate these (monadic) actions from left to right",
-- so it has the power to make effect happen.
-- 
