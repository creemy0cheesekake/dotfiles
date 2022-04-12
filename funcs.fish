function cnct -a ssid password
    nmcli d wifi list >> /dev/null
    eval "nmcli d wifi connect $ssid password $password"
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

function zip
    eval "7z a '$argv.zip' '$argv'"
end
# funcsave zip

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
    if test -n "$branch"
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
    set msg ""

    for arg in $argv
       msg+="$arg "
    end

    # remove trailing whitespace
    set msg (msg | xargs)

    git add .
    git commit -m "$msg"

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
        npm i -S "$package"
        npm i -D "@types/$package"
    end
end
# funcsave tsi

function mkcdir -a dir
    mkdir "$dir"
    cd "$dir"
end
# funcsave mkcdir

