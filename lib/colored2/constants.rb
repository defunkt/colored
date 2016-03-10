module Colored2
  COLORS  = {
    black:     30,
    red:       31,
    green:     32,
    yellow:    33,
    blue:      34,
    magenta:   35,
    cyan:      36,
    white:     37
  }
  EFFECTS = {
    clear:      0,
    bold:       1,
    dark:       2,
    italic:     3,
    underlined: 4,
    reversed:   7,
    plain:      21, # non-bold
    normal:     22
  }
  ESCAPES = COLORS.merge(EFFECTS)
end
