module Main where

import System.Environment
import Parser

main :: IO ()
main = getArgs >>= print . eval . readExpr . head
