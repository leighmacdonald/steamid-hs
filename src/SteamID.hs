{-# LANGUAGE BangPatterns #-}

module SteamID (
    intToSteamID,
    stringToSteamID,
    accountIdToSteamId64,
    SteamID,
) where

data Universe
    = UniverseInvalid
    | UniversePublic
    | UniverseBeta
    | UniverseInternal
    | UniverseDev
    | UniverseRC
    deriving (Enum, Show, Eq)

data AccountType
    = Invalid
    | Individual
    | MultiSeat
    | GameServer
    | AnonGameServer
    | Pending
    | ContentServer
    | Clan
    | Chat
    | P2PSuperSeeder
    | AnonUser
    deriving (Enum, Show, Eq)

data Instance
    = InstanceAll
    | InstanceDesktop
    | InstanceConsole
    | InstanceWeb
    deriving (Enum, Show, Eq)

data Format
    = Steam
    | Steam3
    | Steam64
    | AccountID
    | Link
    | Vanity
    deriving (Enum, Show, Eq)

data ParseError = ParseError !String

type SteamID = Int

minSID :: SteamID
minSID = 76561197960265728

minGID :: SteamID
minGID = 103582791429521408

-- instanceMask = 0x000FFFFF
-- clanMask = shiftR (instanceMask + 1 :: Int) 1
-- lobby = shiftR (instanceMask + 1) 2
-- mmsLobby = shiftR (instanceMask + 1) 3

stringToSteamID :: String -> Maybe SteamID
stringToSteamID _ = Nothing
stringToSteamID i = Just $ read i

intToSteamID :: Int -> Either ParseError SteamID
intToSteamID 0 = Left $ ParseError "Error 0"
intToSteamID i = do
    let isValid = i >= minSID
    case isValid of
        Left -> Left (ParseError "Error")
        Right other -> Right (other)

accountIdToSteamId64 :: Int -> SteamID
accountIdToSteamId64 accountId = minSID + accountId * 2

-- sea - 1 lax - 2 lon - 1 frk - 1 chi 3
