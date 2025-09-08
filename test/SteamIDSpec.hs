module SteamIDSpec (spec) where
import Test.Hspec
-- import Control.Exception (evaluate)
-- import SteamID (parseSteamID)


spec :: Spec
spec = do
    describe "SteamID" $ do
        it "should parse valid SteamIDs" $ do
           (True) `shouldBe` (True)
git remote add origin git@github.com:leighmacdonald/steamid-hs.git