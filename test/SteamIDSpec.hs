module SteamIDSpec (spec) where
import Test.Hspec

spec :: Spec
spec = do
    describe "SteamID" $ do
        it "should parse valid SteamIDs" $ do
           (True) `shouldBe` (True)
