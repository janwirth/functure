{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Aeson as Aeson
import GHC.Generics
import AWSLambda
import AWSLambda.Events.S3Event
import qualified Data.HashMap.Strict as HashMap
import Flow
import Lib

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
  pure <| Response 200 (Payload (sayHello "You"))

p :: Aeson.Value -> IO ()
p val = do
  case val of
    Aeson.Object o -> do
      print o
      print (HashMap.lookup "httpMethod" o)
    _ -> print "dope"
