module SteamIDSpec (spec) where

import SteamID (accountIdToSteamId64, intToSteamID)
import Test.Hspec

-- Steam STEAM_0:0:42372787
-- Steam64 476561198045011302
-- Steam3 [U:1:84745574]
-- AccountID 84745574
spec :: Spec
spec = do
    describe "AccountID To SteamID" $ do
        it "should convert correctly" $ do
            accountIdToSteamId64 12345 `shouldBe` 76561197960278018
    describe "Int -> Steam64" $ do
        it "should parse valid SteamIDs" $ do
            intToSteamID 476561198045011302 `shouldBe` 476561198045011302
