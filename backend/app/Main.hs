{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Aeson as Aeson
import GHC.Generics
import AWSLambda
import AWSLambda.Events.S3Event
import qualified Data.HashMap.Strict as HashMap
import Flow
import Lib
import Text.Groom

instance Aeson.ToJSON Response where
    toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.ToJSON Payload where
    toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

data Response = Response {
    statusCode  :: Int
  , body :: Payload
  } deriving (Generic, Show)

data Payload = Payload {
    text :: String
  } deriving (Generic, Show)

main = lambdaMain handler

handler :: Aeson.Value -> IO Response
handler evt = do
  putStrLn "This should go to logogs"
  p evt
  pure <| Response 200 (Payload (sayHello (getNameFromEvt evt)))

getParams :: Aeson.Value -> Maybe Aeson.Object
getParams evt =
  case evt of
    Aeson.Object o -> case HashMap.lookup "pathParameters" o of
      Just o2 -> case o2 of
        Aeson.Object o3 -> Just o3
        _ -> Nothing
      _ -> Nothing
    _ -> Nothing

getNameFromEvt = getName . getParams

getName :: Maybe Aeson.Object -> String
getName params =
  case params of
    Just p -> case HashMap.lookup "name" p of
      Just n -> case n of
        Aeson.String ns -> show ns
        _ -> "noString"
      _ -> "noName"
    _ -> "noParams"

debug = putStrLn . groom

p :: Aeson.Value -> IO ()
p val = do
  case val of
    Aeson.Object o -> do
      debug o
      print (HashMap.lookup "httpMethod" o)
    _ -> print "dope"
