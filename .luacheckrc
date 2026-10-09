-- Runs on top of the base config of factorio-mod-tools (lua/luacheckrc.lua), which sets std, the Factorio globals and
-- allow_defined_top: add to its tables here.

-- upstream style, kept as is so the code stays close to the original
for _, code in ipairs({
  "611", "612", "613", "614", -- whitespace-only lines and trailing whitespace
}) do
  ignore[#ignore + 1] = code
end
files["weather/paracelsin.lua"] = {
  ignore = {
    "211", -- unused common_effects
    "542", -- empty if branch
  },
}
