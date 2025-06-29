return {
	"epwalsh/obsidian.nvim", priority = 1000 , config = true,
	opts = {
		workspaces = {
  		{
    		name = "HVAR",
      	path = "/home/artur/obsidian/",
    	},
		},
		templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
  	},
 		disable_frontmatter = true,
		ui = {
    	enable = false,
    },
	},
}
