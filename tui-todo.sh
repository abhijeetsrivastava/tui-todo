#!/bin/zsh

# default todo file list
declare -A TODO_CONFIG=(
  [FILE]="$HOME/agenda/inbox.md"
  [DIR]="$HOME/agenda/"
)

PS3='Choose one action to perform:'

todo() {
    select option in "create" "edit" "show" "exit"
    do 
        case "$option" in
            ("create") create
            ;;
            ("edit") edit
            ;;
            ("show") show
            ;;
            ("exit") break
            ;;
            *) echo "Please select correct option"
            ;;
        esac
    done
}

# function to create todo
# add timestamp when todo was added (optional)
create() {
    echo "Todo: "
    read thing
    echo "- [ ] $thing" >> $TODO_CONFIG[FILE] && echo "Created todo in $TODO_CONFIG[FILE]"
}


# function to edit todo
edit() {
    echo "edit from within vim using telescope"
}


# function show todo
show() {
    # cat $TODO_CONFIG[DIR]/*.md |grep "\- \[ \].*"
    while read -r line
    do
        case $line in
            "- [ ]"*)
                echo $line
            ;;
        esac
    done < $TODO_CONFIG[DIR]/*.md
}


todo
