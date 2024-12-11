function cnct {
    local ssid=$1 password=$2
    nmcli d wifi list >> /dev/null
    eval "nmcli d wifi connect '$ssid' password '$password'"
}

function gdf {
    local url=$1
    eval "wget $(echo $url | sed 's/github/raw.githubusercontent/' | sed 's/\/blob//')"
}

function gc {
    local url=$1 two=$2 three=$3
    if [ $# -eq 3 ]; then
        if [ "$three" = "cd" ]; then
            cd "$(echo "$url" | sed 's/.*\///' | xargs)"
        fi
        eval "git clone https://github.com/$url.git $two"
    else
        if [ "$two" = "cd" ]; then
            cd "$(echo "$url" | sed 's/.*\///' | xargs)"
        fi
        eval "git clone https://github.com/$url.git"
    fi
}

function uz {
    local file="" o="0" d="0" c="0"
    for i in "$@"; do
        if echo $i | grep "^-"; then
            if echo $i | grep "o"; then
                o="1"
            fi
            if echo $i | grep "d"; then
                d="1"
            fi
            if echo $i | grep "c"; then
                c="1"
            fi
        else
            file="$file $i"
        fi
    done
    file=$(echo "$file" | xargs)

    if [ $o -eq 0 ]; then
        eval "7z e '$file'"
    else
        local name=$(echo $file | sed 's/\.[^.]*$//')
        while ! mkdir "$name"; do
            name="$name-1"
            break
        done
        eval "7z e '$file' -o'./$name'"
        eval "find '$name' -empty -type d -delete"
    fi
    if [ $d -eq 1 ]; then
        tp $file
    fi
    if [ $c -eq 1 ]; then
        name=$(echo $file | sed 's/\.[^.]*$//')
        cd $name
    fi
    eval "find ./ -empty -type d -delete"
}

function wifi {
    local dev="wlp62s0"
    sudo echo STARTING...
    eval "sudo ip link set $dev down"
    eval "sudo macchanger $dev -r -b"
    eval "sudo ip link set $dev up"
    echo DONE!
}

function p {
    local branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    if [ -z "$branch" ]; then
        branch=$1
    fi

    git push origin "$branch"
}

function sc {
    git add .
    git commit -m "$*"
    git push origin $(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

    echo "DONE!"

	read -s -k '?Press any key to continue.'
    clear
}

function c {
    git add .
    git commit -m "$(echo "$*" | xargs)"

    echo "DONE!"

	read -s -k '?Press any key to continue.'
    clear
}

function function forcepush {
    local branch=$1
    eval "git push origin $branch --force"
}

function tsi {
    for package in "$@"; do
        yarn add "$package"
        yarn add -D "@types/$package"
    done
}

function mkcdir {
    local dir=$1
    mkdir -p "$dir"
    cd "$dir"
}

function massmv {
    local destination=${@[-1]}
    local list=("${@:1:$#-1}")
    for i in "${list[@]}"; do
        eval "mv $i $destination"
    done
}

function swap {
    local file1=$1 file2=$2
    local temp=$(mktemp -dp /home/arjun/.local/share) && mv "$file1" $temp && mv "$file2" "$file1" && mv "$temp/$file1" "$file2" || temp=$(mktemp -dp /tmp) && sudo mv "$file1" $temp && sudo mv "$file2" "$file1" && sudo mv "$temp/$file1" "$file2"
}

function toggletapping {
    local temp=$(xinput --list-props 'DELL0A75:00 06CB:7A13 Touchpad' | grep 'libinput Tapping Enabled (')
    local current=${temp: -1}
    if [ $current -eq 1 ]; then
        xinput --set-prop 'DELL0A75:00 06CB:7A13 Touchpad' 'libinput Tapping Enabled' 0
    else
        xinput --set-prop 'DELL0A75:00 06CB:7A13 Touchpad' 'libinput Tapping Enabled' 1
    fi
}

function switchmouse {
    if xmodmap -pp | head -5 | tail -1 | grep 3; then
        xinput set-button-map "Bluetooth Mouse M557 Mouse" 1 2 3
    else
        xinput set-button-map "Bluetooth Mouse M557 Mouse" 3 2 1
    fi
}
