return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.6.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 30,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 5,
  nextobjectid = 53,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 2,
      margin = 1,
      columns = 7,
      image = "../sprites/tileset.png",
      imagewidth = 255,
      imageheight = 289,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 56,
      tiles = {
        {
          id = 7,
          type = "greyDoor"
        },
        {
          id = 14,
          type = "redDoor"
        },
        {
          id = 21,
          type = "blueDoor"
        },
        {
          id = 28,
          type = "coin"
        },
        {
          id = 31,
          type = "life"
        },
        {
          id = 32,
          type = "greyButton"
        },
        {
          id = 34,
          type = "spike"
        },
        {
          id = 35,
          type = "redDemony"
        },
        {
          id = 36,
          type = "player"
        },
        {
          id = 39,
          type = "redButton"
        },
        {
          id = 42,
          type = "blueDemony"
        },
        {
          id = 46,
          type = "greenButton"
        },
        {
          id = 48,
          type = "endLevel"
        },
        {
          id = 53,
          type = "blueButton"
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      id = 1,
      name = "Ground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 4, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 5, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 5, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 5, 5, 5, 5, 5, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 3, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      id = 3,
      name = "Shadows",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 13, 6, 6, 6, 6, 0, 13, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 13, 6, 6, 6, 6, 6, 6, 6, 6, 0,
        0, 7, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 42, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 14, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 0, 0, 14, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 13, 6, 21, 20, 6, 6, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 6, 6, 21, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 20, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 20, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      id = 4,
      name = "Solid",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        3, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Objects",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 11,
          name = "",
          type = "blueDoor",
          shape = "rectangle",
          x = 96,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 22,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "endLevel",
          shape = "rectangle",
          x = 96,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "blueButton",
          shape = "rectangle",
          x = 832,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 54,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "player",
          shape = "rectangle",
          x = 320,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "redDemony",
          shape = "rectangle",
          x = 288,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "blueDemony",
          shape = "rectangle",
          x = 320,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 43,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "redDoor",
          shape = "rectangle",
          x = 640,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 288,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 288,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 192,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 608,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 704,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 800,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 96,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 192,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 288,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 384,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 480,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "redButton",
          shape = "rectangle",
          x = 576,
          y = 896,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 192,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 288,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 384,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 480,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 576,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 608,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 608,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "coin",
          shape = "rectangle",
          x = 608,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "life",
          shape = "rectangle",
          x = 576,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 32,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "life",
          shape = "rectangle",
          x = 864,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 32,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "",
          type = "life",
          shape = "rectangle",
          x = 64,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 32,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
