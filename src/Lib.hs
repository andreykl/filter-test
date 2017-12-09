module Lib
    (
      runFilterEmails,
      runFilterNumbersRu
    ) where

import Data.List (isInfixOf)

-- standalone usage example:
--   filterFile "/tmp/inputfile.txt" "/tmp/output-emails.txt" (filter $ elem '@')
filterFile inputFile outputFile fltr = do
  content <- readFile inputFile
  writeFile outputFile (unlines . fltr . lines $ content)

runFilter outputFile fltr = \filename -> do
  case filename of
    Just fn -> filterFile fn outputFile fltr
    Nothing -> putStrLn "No file selected"

runFilterEmails outputFile = runFilter outputFile (filter $ elem '@')
runFilterNumbersRu outputFile = runFilter outputFile (filter $ isInfixOf "+7")
