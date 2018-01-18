--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:96520b9b93be7e57ac77c14291565401:01cb3d346f2ddc1849a0a8faacc8b7d2:91cf219afacbd5c53980a23ca86e3529$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- Comp 1_00001
            x=928,
            y=38,
            width=52,
            height=12,

            sourceX = 274,
            sourceY = 285,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00002
            x=436,
            y=74,
            width=92,
            height=20,

            sourceX = 255,
            sourceY = 272,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00003
            x=302,
            y=74,
            width=132,
            height=28,

            sourceX = 236,
            sourceY = 260,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00004
            x=766,
            y=2,
            width=174,
            height=34,

            sourceX = 215,
            sourceY = 249,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00005
            x=2,
            y=2,
            width=204,
            height=40,

            sourceX = 201,
            sourceY = 239,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00006
            x=398,
            y=2,
            width=186,
            height=36,

            sourceX = 210,
            sourceY = 245,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00007
            x=208,
            y=40,
            width=162,
            height=32,

            sourceX = 221,
            sourceY = 252,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00008
            x=164,
            y=74,
            width=136,
            height=28,

            sourceX = 234,
            sourceY = 259,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00009
            x=2,
            y=78,
            width=126,
            height=26,

            sourceX = 239,
            sourceY = 262,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00010
            x=372,
            y=40,
            width=158,
            height=32,

            sourceX = 223,
            sourceY = 253,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00011
            x=208,
            y=2,
            width=188,
            height=36,

            sourceX = 209,
            sourceY = 245,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00012
            x=586,
            y=2,
            width=178,
            height=34,

            sourceX = 213,
            sourceY = 248,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00013
            x=690,
            y=72,
            width=152,
            height=30,

            sourceX = 226,
            sourceY = 255,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00014
            x=844,
            y=72,
            width=144,
            height=30,

            sourceX = 230,
            sourceY = 257,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00015
            x=586,
            y=38,
            width=174,
            height=32,

            sourceX = 215,
            sourceY = 250,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00016
            x=532,
            y=72,
            width=156,
            height=30,

            sourceX = 224,
            sourceY = 255,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00017
            x=2,
            y=44,
            width=160,
            height=32,

            sourceX = 222,
            sourceY = 252,
            sourceWidth = 900,
            sourceHeight = 506
        },
        {
            -- Comp 1_00018
            x=762,
            y=38,
            width=164,
            height=32,

            sourceX = 220,
            sourceY = 251,
            sourceWidth = 900,
            sourceHeight = 506
        },
    },
    
    sheetContentWidth = 990,
    sheetContentHeight = 106
}

SheetInfo.frameIndex =
{

    ["Comp 1_00001"] = 1,
    ["Comp 1_00002"] = 2,
    ["Comp 1_00003"] = 3,
    ["Comp 1_00004"] = 4,
    ["Comp 1_00005"] = 5,
    ["Comp 1_00006"] = 6,
    ["Comp 1_00007"] = 7,
    ["Comp 1_00008"] = 8,
    ["Comp 1_00009"] = 9,
    ["Comp 1_00010"] = 10,
    ["Comp 1_00011"] = 11,
    ["Comp 1_00012"] = 12,
    ["Comp 1_00013"] = 13,
    ["Comp 1_00014"] = 14,
    ["Comp 1_00015"] = 15,
    ["Comp 1_00016"] = 16,
    ["Comp 1_00017"] = 17,
    ["Comp 1_00018"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
