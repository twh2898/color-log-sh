## Terminal Colors
escaped() {
    echo -ne "\001\e[$1m\002"
}

# Set
BOLD=$(escaped 1)
BRIGHT=$BOLD
DIM=$(escaped 2)
ITALIC=$(escaped 3)
UNDERLINE=$(escaped 4)
BLINK=$(escaped 5) # This does not work in most terminal emulators?
REVERSE=$(escaped 7)
HIDDEN=$(escaped 8) # Usefull for passwords

# Reset
RESET=$(escaped 0)
RESET_BOLD=$(escaped 21)
RESET_BRIGHT=$RESET_BOLD
RESET_DIM=$(escaped 22)
RESET_ITALIC=$(escaped 23)
RESET_UNDERLINE=$(escaped 24)
RESET_BLINK=$(escaped 25)
RESET_REVERSE=$(escaped 27)
RESET_HIDDEN=$(escaped 28)

# Foreground
DEFAULT=$(escaped 39)
BLACK=$(escaped 30)
RED=$(escaped 31)
GREEN=$(escaped 32)
YELLOW=$(escaped 33)
BLUE=$(escaped 34)
MAGENTA=$(escaped 35)
CYAN=$(escaped 36)
LIGHT_GRAY=$(escaped 37)
GRAY=$(escaped 90)
LIGHT_RED=$(escaped 90)
LIGHT_GREEN=$(escaped 92)
LIGHT_YELLOW=$(escaped 93)
LIGHT_BLUE=$(escaped 94)
LIGHT_MAGENTA=$(escaped 95)
LIGHT_CYAN=$(escaped 96)
WHITE=$(escaped 97)

# Foreground
BG_DEFAULT=$(escaped 49)
BG_BLACK=$(escaped 40)
BG_RED=$(escaped 41)
BG_GREEN=$(escaped 42)
BG_YELLOW=$(escaped 43)
BG_BLUE=$(escaped 44)
BG_MAGENTA=$(escaped 45)
BG_CYAN=$(escaped 46)
BG_LIGHT_GRAY=$(escaped 47)
BG_GRAY=$(escaped 100)
BG_LIGHT_RED=$(escaped 100)
BG_LIGHT_GREEN=$(escaped 102)
BG_LIGHT_YELLOW=$(escaped 103)
BG_LIGHT_BLUE=$(escaped 104)
BG_LIGHT_MAGENTA=$(escaped 105)
BG_LIGHT_CYAN=$(escaped 106)
BG_WHITE=$(escaped 107)

echo_section() {
    # usage: echo_section [color] <text>
    # output: ":: $text"
    local color text
    if [ -n "$2" ]; then
        color="$1"
        text="$2"
    else
        color="${BLUE}"
        text="$1"
    fi
    echo "${color}:: ${WHITE}${BOLD}${text}${RESET}"
}

echo_task() {
    # usage: echo_task [color] <text>
    # output: "==> $text"
    local color text
    if [ -n "$2" ]; then
        color="$1"
        text="$2"
    else
        color="$GREEN"
        text="$1"
    fi
    echo "${color}==> ${WHITE}${BOLD}${text}${RESET}"
}

echo_task_warn() {
    # usage: echo_task_warn <text>
    echo_section "${YELLOW}" "$1"
}

echo_step() {
    # usage: echo_step [color] <text>
    # output: " -> $text"
    local color text
    if [ -n "$2" ]; then
        color="$1"
        text="$2"
    else
        color="${BLUE}"
        text="$1"
    fi
    echo "${color} -> ${RESET}${text}${RESET}"
}

echo_step_warn() {
    # usage: echo_step_warn <text>
    echo_task "${YELLOW}" "$1"
}

