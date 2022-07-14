#!/bin/zsh

# default todo file list
# TODO move configuration to an associative array
TODO_FILES="./todo.md"

PS3='Choose one action to perform:'

todo() {
    select option in "create" "edit" "show" "exit"
    do 
        echo "The option chosen is: $option"
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
    echo "- [ ] $thing" >> $TODO_FILES && echo "Created todo in $TODO_FILES"
}


# function to edit todo
edit() {
    echo "edit from within vim using telescope"
}


# function show todo
show() {
    echo "inside show function"
    # cat $TODO_FILES | grep "\- \[ \].*"
    while read -r line
    do
        case $line in
            "- [ ]"*)
                echo $line
            ;;
        esac
    done < $TODO_FILES
}


todo
