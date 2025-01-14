local setup, tabby = pcall(require, "tabby.tabline")
if not setup then
  return
end

local theme = {
  tab = "TabLine",
  tail = "TabLine",
  win = "TabLineSel",
  fill = "TabLineFill",
  head = "TabLineFill",
  current_tab = "TabLineSel",
}

tabby.set(function(line)
  return {
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tail
      return {
        line.sep("", hl, theme.fill),
        tab.is_current() and "" or "",
        tab.number(),
        tab.name(),
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local bf = win.is_current() and theme.current_tab or theme.tab
      return {
        line.sep("", bf, theme.fill),
        win.is_current() and "" or "",
        win.buf_name(),
        line.sep(" ", theme.win, theme.fill),
        hl = win.is_current() and theme.current_tab or theme.tail,
        margin = " ",
      }
    end),
  }
end)
