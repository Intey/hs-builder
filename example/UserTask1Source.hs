module UserTask1Source where

class ToJSON a where 
  toJSON :: a -> String

data Point a = Point a a
data Category = Secret | NonSecret
data SensitivePayload = SensitivePayload 
    { dataCategory :: Category
    , poi :: Point Int 
    }

instance ToJSON Int where
    toJSON = show 

instance ToJSON a => ToJSON (Point a) where
    toJSON (Point x y) = "{\"x\":" ++ toJSON x ++ "," ++ "\"y\":" ++ toJSON y ++ "}"

instance ToJSON Category where
    toJSON Secret = "\"secret\""
    toJSON NonSecret = "\"nonsecret\""

instance ToJSON SensitivePayload where 
    toJSON (SensitivePayload cat point) = "{\"category\":" ++ toJSON cat ++ ", \"poi\":" ++ toJSON point ++ "}"

