import UserTask1Source
import Test.Hspec

main = hspec $ do
    describe "task 1" $ do
        it "user correctly define the @a@ variable" $ do
            a `shouldBe` 50
        it "negative case. just for example of many @it@" $ do
            a `shouldNotBe` 50
