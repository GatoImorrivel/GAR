CURRENTWORKSPACEVARPREFIX="activeWorkspace: "
PREVIOUSWORKSPACEVARPREFIX="previousWorkspace: "

CURRENTWORKSPACE="$(eww state -a | grep "activeWorkspace")"
CURRENTWORKSPACE="${CURRENTWORKSPACE#"$CURRENTWORKSPACEVARPREFIX"}"

PREVIOUSWORKSPACE="$(eww state -a | grep "previousWorkspace")"
PREVIOUSWORKSPACE="${PREVIOUSWORKSPACE#"$PREVIOUSWORKSPACEVARPREFIX"}"

ACTION=$1
TARGETWORKSPACE=$2
WORKSPACEAMOUNT=7

windowSwitch() {
  bspc desktop -f $1
  eww update activeWorkspace=$1
  eww update previousWorkspace="${CURRENTWORKSPACE}"
}

if [ $ACTION == '-c' ]; then
  if [[ $TARGETWORKSPACE -gt $WORKSPACEAMOUNT ]] || [[ $TARGETWORKSPACE -lt 1 ]]; then
    echo "Invalid target workspace"
    exit 1
  fi
fi


case $ACTION in
  -n)
    NEXT="$(( $CURRENTWORKSPACE + 1 ))"
    windowSwitch $NEXT     
    ;;
  -b)
    BEHIND="$(( $CURRENTWORKSPACE - 1 ))"
    windowSwitch $BEHIND    
    ;;
  -l)
    windowSwitch $PREVIOUSWORKSPACE
    ;;
  -c)
    windowSwitch $TARGETWORKSPACE
    ;;
  *)
    "Invalid flags"
    exit 2
    ;;
esac
