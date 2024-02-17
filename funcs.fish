function cnct -a ssid password
    nmcli d wifi list >> /dev/null
    eval "nmcli d wifi connect '$ssid' password '$password'"
end
# funcsave cnct

function gdf -a url
    eval "wget (echo $url | sed "s/github/raw\.githubusercontent/" | sed "s/\/blob//")"
end
# funcsave gdf

function gc -a url two three
    if test (count $argv) -eq 3
        if "$three" == "cd"
            cd ("$url" | sed "s/.*\///" | xargs)
        end
        eval "git clone https://github.com/$url.git $two"
    else
        if "$two" == "cd"
            cd ("$url" | sed "s/.*\///" | xargs)
        end
        eval "git clone https://github.com/$url.git"
    end
end
# funcsave gc

# function zip
#     set dir (echo $argv | sed 's:/*$::')
#     eval "7z a '$dir.zip' '$dir'"
# end
# funcsave zip

function uz
    set file ""
    set o "0"
    set d "0"
    set c "0"
    for i in $argv
        if echo $i | grep "^-"
            if echo $i | grep "o"
                set o "1"
            end
            if echo $i | grep "d"
                set d "1"
            end
            if echo $i | grep "c"
                set c "1"
            end
        else
            set file "$file $i"
        end
    end
    set file (echo "$file" | xargs)

    if test $o = 0
        eval "7z e '$file'"
    else
        set name (echo $file | sed 's/\.[^.]*$//')
        while not mkdir $name
            set name "$name-1"
            break
        end
        eval "7z e '$file' -o'./$name'"
        eval "find '$name' -empty -type d -delete"
    end
    if test $d = 1
        tp $file
    end
    if test $c = 1
        set name (echo $file | sed 's/\.[^.]*$//')
		cd $name
    end
    eval "find ./ -empty -type d -delete"
end
# funcsave uz

function wifi
    set dev "wlp62s0"
    sudo echo STARTING... 
    eval "sudo ip link set $dev down"
    eval "sudo macchanger $dev -r -b"
    eval "sudo ip link set $dev up"
    echo DONE! 
end
# funcsave wifi

function p
    set branch (git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    if not test -n "$branch"
        set branch $1
    end

    git push origin "$branch"
end
# funcsave p

function sc
    git add .
    git commit -m "$argv"
    git push origin (git branch | sed -n -e 's/^\* \(.*\)/\1/p')

    echo "DONE!"

    read -sn1 -p ''
    clear
end
# funcsave sc

function c
    git add .
    # git commit -m "$argv"
    git commit -m "$(echo "$argv" | xargs)"

    echo "DONE!"

    read -sn1 -p ''
    clear
end
# funcsave c

function forcepush -a branch
    eval "git push origin $branch --force"
end
# funcsave forcepush

function tsi
    for package in $argv
        yarn add "$package"
        yarn add -D "@types/$package"
    end
end
# funcsave tsi

function mkcdir -a dir
    mkdir -p "$dir"
    cd "$dir"
end
# funcsave mkcdir

function massmv
    set destination $argv[-1]
    set list $argv[1..-2]
    for i in $list
        eval "mv $i $destination"
    end
end
# funcsave massmv

# function cd
# 	z $argv && ls
# end
# # funcsave cd

function create-svelte
    set name ""
    set ts ""
    set c ""
    for i in $argv
        if echo $i | grep "^--ts" >> /dev/null
                set ts "1"
        else if echo $i | grep "^-c\$" >> /dev/null
                set c "1"
        else
            set name "$name $i"
        end
    end
    set name (echo "$name" | xargs)
    if test -z "$ts"
        eval "yarn create vite --template svelte $name" 
        builtin cd $name && rm -rf .vscode && yarn
        if test -z "$c"
            cd .. >> /dev/null
        end
    else
        eval "yarn create vite --template svelte-ts $name" 
        builtin cd $name && rm -rf .vscode && yarn
        if test -z "$c"
            cd .. >> /dev/null
        end
    end
end
# funcsave create-svelte

function swap -a file1 file2
    set temp (mktemp -dp /home/arjun/.local/share) && mv "$file1" $temp && mv "$file2" "$file1" && mv "$temp/$file1" "$file2" || set temp (mktemp -dp /tmp) && sudo mv "$file1" $temp && sudo mv "$file2" "$file1" && sudo mv "$temp/$file1" "$file2" 
end
# funcsave swap

function toggletapping
	set temp (xinput --list-props 'DELL0A75:00 06CB:7A13 Touchpad' | grep 'libinput Tapping Enabled (')
	set current (string sub --start=-1 $temp)
	if test $current = '1'
		xinput --set-prop 'DELL0A75:00 06CB:7A13 Touchpad' 'libinput Tapping Enabled' 0
	else
		xinput --set-prop 'DELL0A75:00 06CB:7A13 Touchpad' 'libinput Tapping Enabled' 1
	end
end
# funcsave toggletapping

function switchmouse
	if xmodmap -pp | head -5 | tail -1 | grep 3
		xinput set-button-map "Bluetooth Mouse M557 Mouse" 1 2 3
	else
		xinput set-button-map "Bluetooth Mouse M557 Mouse" 3 2 1
	end
end
# funcsave switchmouse
