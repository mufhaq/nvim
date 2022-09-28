local nwd = require("nvim-web-devicons")
local allIcons = nwd.get_icons()

for key, value in pairs(allIcons) do
	nwd.set_icon({
		[key] = {
			icon = value["icon"] .. " ",
			color = value["color"],
			cterm_color = value["cterm_color"],
			name = value["name"],
		},
	})
end
