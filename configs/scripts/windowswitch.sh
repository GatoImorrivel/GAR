TARGETWORKSPACE=$1
PREVINDEX=$(cat ~/.config/scripts/currentwindow)
WORKSPACEAMOUNT=7

function update_windows () {
  for i in $(seq 1 $WORKSPACEAMOUNT); do
    if [ $i == $TARGETWORKSPACE ]; then
      eww update workspace${i}="workspaceActive"
    else
      eww update workspace${i}="workspaceInactive"
    fi
  done
  bspc desktop -f "$TARGETWORKSPACE"
  echo $TARGETWORKSPACE > ~/.config/scripts/currentwindow
  echo $PREVINDEX > ~/.config/scripts/previouswindow
}

# Handles changing to the workspace in front of the current workspace
if [[ $TARGETWORKSPACE -gt $WORKSPACEAMOUNT ]]; then
  echo "invalid target workspace"
  exit 1
fi

if [ $TARGETWORKSPACE == '-n' ]; then
  if [[ $PREVINDEX -ge $WORKSPACEAMOUNT ]]; then
    CURRENTINDEX=1
  else
    CURRENTINDEX=$(( $PREVINDEX + 1))
  fi
  TARGETWORKSPACE=$CURRENTINDEX

  update_windows 
  
  exit 2
fi

# Handles changing to the workspace behind the current workspace
if [ $TARGETWORKSPACE == '-p' ]; then 
  if [[ $PREVINDEX -le 1 ]]; then
    CURRENTINDEX=7
  else
    CURRENTINDEX=$(( $PREVINDEX - 1))
  fi
  TARGETWORKSPACE=$CURRENTINDEX

  update_windows 

  exit 3
fi

# Handles changing to the last focused workspace
if [ $TARGETWORKSPACE == '-l' ]; then
  TARGETWORKSPACE=$(cat ~/.config/scripts/previouswindow)
  update_windows
fi

# Default is just to update to target index
update_windows 

