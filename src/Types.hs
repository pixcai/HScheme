module Types (LispVal(..)) where

data LispVal = List [LispVal]
             | DottedList [LispVal] LispVal
             | Atom String
             | Number Integer
             | Float Double
             | Character Char
             | String String
             | Bool Bool

instance Show LispVal where
  show = showVal

showVal :: LispVal -> String
showVal (List value)           = "(" ++ unwordsList value ++ ")"
showVal (DottedList head tail) = "(" ++ unwordsList head ++ " . " ++ showVal tail ++ ")"
showVal (Atom value)           = value
showVal (Number value)         = show value
showVal (Float value)          = show value
showVal (Character value)      = show value
showVal (String value)         = "\"" ++ value ++ "\""
showVal (Bool True)            = "#t"
showVal (Bool False)           = "#f"

unwordsList :: [LispVal] -> String
unwordsList = unwords . map showVal
