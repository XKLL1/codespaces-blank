local Theme = {}

Theme.Colors = {
    BackgroundTop = Color3.fromRGB(35, 35, 37),
    BackgroundBottom = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(90, 135, 255),
    Text = Color3.fromRGB(235, 235, 235),
    SubtleText = Color3.fromRGB(170, 170, 170),
    Border = Color3.fromRGB(70, 70, 70),
    Success = Color3.fromRGB(50, 200, 120),
    Error = Color3.fromRGB(230, 60, 60)
}

Theme.Font = Enum.Font.GothamMedium
Theme.Round = UDim.new(0, 12)

return Theme
