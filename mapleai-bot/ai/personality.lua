local Personality = {}

Personality.Modes = {
    default = "",
    calm = "Respond in a calm tone.",
    energetic = "Respond with high energy and enthusiasm.",
    formal = "Respond in a professional and formal manner.",
    playful = "Respond humorously and lightly."
}

function Personality.Get(mode)
    return Personality.Modes[mode] or Personality.Modes.default
end

return Personality
