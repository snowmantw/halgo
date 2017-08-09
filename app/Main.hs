module Main where

import System.IO (putStr)
import Ex0201 (sampleSuffixes, stressSuffixes)
import Control.Monad (mapM_)
import Text.Show (show)

main :: IO ()
main = do
  putStr "["
  mapM_ (putStr.show) stressSuffixes
  putStr "]\n"

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
