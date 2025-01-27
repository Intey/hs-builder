import Test.Hspec
import Test.Hspec.Core.Runner
import Test.Hspec.Api.Format.V2

import MachineFormatter (formatter)

import UserTask1Source

main :: IO ()

main = hspecWith (useFormatter formatter defaultConfig) spec

spec :: Spec
spec = do
    describe "task 1" $ do
        it "user should define the @ToJSON@ for Int" $ do
            toJSON (5 :: Int) `shouldBe` "5"
        it "user should define the @ToJSON@ for Point 5 3" $ do
            toJSON (Point 5 3 :: Point Int) `shouldBe` "{\"x\": 5, \"y\": 3}"
        it "user should define the @ToJSON@ for Point 7 3" $ do
            toJSON (Point 7 3 :: Point Int) `shouldBe` "{\"x\":7, \"y\":3}"
