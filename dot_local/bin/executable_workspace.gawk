#!/bin/gawk -f

BEGIN {
  if ("SWAYSOCK" in ENVIRON) {
    cmd_fmt = "sway"
  } else if ("I3SOCK" in ENVIRON) {
    cmd_fmt = "i3-msg"
  } else {
    print "neither i3 nor sway detect"
    exit
  }
}

$3 == "(focused)" {
	switch(move_type) {
	case "left":
		if ($2 == 1)
			$2=num_of_workspaces+1
		system(cmd_fmt" workspace "$2-1)
		exit

	case "right":
		if ($2 == num_of_workspaces)
			$2=0
		system(cmd_fmt" workspace "$2+1)
		exit

	case "container_left":
		if ($2 == 1)
			$2=num_of_workspaces+1
		system(cmd_fmt" move container to workspace "$2-1", workspace "$2-1)
		exit

	case "container_right":
		if ($2 == num_of_workspaces)
			$2=0
		system(cmd_fmt" move container to workspace "$2+1", workspace "$2+1)
		exit
	}
}
