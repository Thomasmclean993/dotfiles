set screenWidth to 5120
set screenHeight to 1440
set leftWidth to screenWidth * 0.25
set middleWidth to screenWidth * 0.5

-- Right side calculations
set rightX to leftWidth + middleWidth
set rightWidth to screenWidth - rightX - 50  -- Remaining space

tell application "Vivaldi"
    activate
    set bounds of front window to {0, 0, leftWidth, screenHeight}
end tell

tell application "iTerm"
    activate
    set bounds of front window to {leftWidth, 0, rightX, screenHeight}
end tell

tell application "Obsidian"
    activate
    delay 0.5  -- Give the app time to launch
end tell

tell application "System Events"
    tell process "Obsidian"
        set position of first window to {rightX, 0}
        set size of first window to {rightWidth, screenHeight}  -- 5120-3840 = 1280 width
    end tell
end tell
