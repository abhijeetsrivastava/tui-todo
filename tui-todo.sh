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
    echo "- [ ] $thing" >> $TODO_FILES && echo "Created todo"
}


# function to edit todo
# set schedule todo
# set deadline for todo
edit() {
    echo "inside edit function"
}

# function todo state


# function show todo
show() {
    echo "inside show function"
}


# function pretify todo list
pretty_show() {
    echo "inside pretify todo list"
}

create
