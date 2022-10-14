# https://github.com/denysdovhan/spaceship-prompt

# ohmyzsh plugin settings
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  time          # Time stamps section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_DIR_TRUNC_PREFIX=…/
SPACESHIP_DIR_COLOR=blue
SPACESHIP_GIT_BRANCH_COLOR=cyan
SPACESHIP_GIT_STATUS_COLOR=cyan
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR=241
SPACESHIP_EXEC_TIME_COLOR=241
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
