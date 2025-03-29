#!/usr/bin/env bb
(require '[babashka.process :refer [shell process exec]])
(require '[clojure.string :as str])

#_(defn riverctl2 [& args]
  (shell (str "riverctl " (str/join " " (mapv name args)))))

(defn riverctl
  ([args]
   (shell (str "riverctl " args)))
  ([cmd args]
   (shell (str "riverctl " (name cmd) " " args))))

(defn rivertile
  [cmd]
  (shell (str "rivertile " cmd)))

(defn riverctl-map
  ([k cmd]
   (riverctl-map :normal k cmd))
  ([mode k cmd]
   (riverctl (str "map " (name mode) " " k " " cmd))))

;; TODO maybe switch to something like this?
;; map of config
;; fn that sets it up
(def setup
  {:map
   {:normal
    {"Super+Shift Return" "spawn foot"
     "Super E"            "spawn emacs"}}
   :background-color       ""
   :border-color-focused   ""
   :border-color-unfocused ""})

;; ---
;; APPS
;; ---
(riverctl-map "Super+Shift Return" "spawn foot")
(riverctl-map "Super E" "spawn emacs")
(riverctl-map "Super D" "spawn fuzzel")

;; ---
;; NAV
;; ---

;; Super+Q to close the focused view
(riverctl-map "Super Q" "close")

;; Super+Shift+E to exit river
(riverctl-map "Super+Shift E" "exit")

;; Super+J and Super+K to focus the next/previous view in the layout stack
(riverctl-map "Super J" "focus-view next")
(riverctl-map "Super K" "focus-view previous")

;; Super+Shift+J and Super+Shift+K to swap the focused view with the next/previous
;; view in the layout stack
(riverctl-map "Super+Shift J" "swap next")
(riverctl-map "Super+Shift K" "swap previous")

;; Switch focus between monitors
(riverctl-map "Super N" "focus-output next")
(riverctl-map "Super P" "focus-output previous")
(riverctl-map "Super+Shift N" "send-to-output next")
(riverctl-map "Super+Shift P" "send-to-output previous")

;; Super+Return to bump the focused view to the top of the layout stack
(riverctl-map "Super Return" "zoom")

;; Super+H and Super+L to decrease/increase the main ratio of rivertile(1)
(riverctl-map "Super H" "send-layout-cmd rivertile \"main-ratio -0.05\"")
(riverctl-map "Super L" "send-layout-cmd rivertile \"main-ratio +0.05\"")

;; Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
(riverctl-map "Super+Shift H" "send-layout-cmd rivertile \"main-count +1\"")
(riverctl-map "Super+Shift L" "send-layout-cmd rivertile \"main-count -1\"")

;; Super+Alt+{H,J,K,L} to move views
(riverctl-map "Super+Alt H" "move left 100")
(riverctl-map "Super+Alt J" "move down 100")
(riverctl-map "Super+Alt K" "move up 100")
(riverctl-map "Super+Alt L" "move right 100")

;; Super+Alt+Control+{H,J,K,L} to snap views to screen edges
(riverctl-map "Super+Alt+Control H" "snap left")
(riverctl-map "Super+Alt+Control J" "snap down")
(riverctl-map "Super+Alt+Control K" "snap up")
(riverctl-map "Super+Alt+Control L" "snap right")

;; Super+Alt+Shift+{H,J,K,L} to resize views
(riverctl-map "Super+Alt+Shift H" "resize horizontal -100")
(riverctl-map "Super+Alt+Shift J" "resize vertical 100")
(riverctl-map "Super+Alt+Shift K" "resize vertical -100")
(riverctl-map "Super+Alt+Shift L" "resize horizontal 100")

;; Super + Left Mouse Button to move views
(riverctl "map-pointer normal Super BTN_LEFT move-view")

;; Super + Right Mouse Button to resize views
(riverctl "map-pointer normal Super BTN_RIGHT resize-view")

;; Super + Middle Mouse Button to toggle float
(riverctl "map-pointer normal Super BTN_MIDDLE toggle-float")

(->> (range 1 10)
     (map (fn [i]
            (let [tags (bit-shift-left 1 (- i 1))]
              (riverctl-map (str "Super " i) (str "set-focused-tags " tags))
              (riverctl-map (str "Super+Shift " i) (str "set-view-tags " tags))
              (riverctl-map (str "Super+Control " i) (str "toggle-focused-tags " tags))
              (riverctl-map (str "Super+Shift+Control " i) (str "toggle-view-tags " tags)))))
     dorun)

(let [all-tags (- (bit-shift-left 1 32) 1)]
  (riverctl-map "Super 0" (str "set-focused-tags " all-tags))
  (riverctl-map "Super+Shift 0" (str "set-view-tags " all-tags)))

;; fullscreen
(riverctl-map "Super F" "toggle-fullscreen")

;; TODO setup passthrough?
;; Declare a passthrough mode. This mode has only a single mapping to return to
;; normal mode. This makes it useful for testing a nested wayland compositor
;; riverctl declare-mode passthrough

;; Super+F11 to enter passthrough mode
;; riverctl map normal Super F11 enter-mode passthrough

;; Super+F11 to return to normal mode
;; riverctl map passthrough Super F11 enter-mode normal
;; (riverctl-map "None XF86AudioRaiseVolume" "spawn 'pactl set-sink-volume @DEFAULT_SINK@ +5%'")
;; (riverctl-map "None XF86AudioLowerVolume" "spawn 'pactl set-sink-volume @DEFAULT_SINK@ -5%'")
;; (riverctl-map "None XF86AudioMute" "spawn 'pactl set-sink-mute @DEFAULT_SINK@ toggle'")
(riverctl-map "None XF86AudioRaiseVolume" "spawn 'pulsemixer --change-volume +5'")
(riverctl-map "None XF86AudioLowerVolume" "spawn 'pulsemixer --change-volume -5'")
;; mute doesnt work? check via?
(riverctl-map "None XF86AudioMute" "spawn 'pulsemixer --toggle-mute sink-1'")
;; background and border color
(riverctl "background-color 0x26263B")
(riverctl "border-color-focused 0xb4befe")
(riverctl "border-color-unfocused 0x313244")

;; Make all views with an app-id that starts with "float" and title "foo" start floating.
;; (riverctl "rule-add -app-id 'float*' -title 'foo' float")

;; Make all views with app-id "bar" and any title use client-side decorations
;; (riverctl "rule-add -app-id \"bar\" csd")

;; Set the default layout generator to be rivertile and start it.
;; River will send the process group of the init executable SIGTERM on exit.
(riverctl "default-layout rivertile")

;; TODO how to run background process in babashka?
;; (rivertile "-view-padding 6 -outer-padding 6 &")

;; TODO this doesnt  work sometime?
(riverctl "spawn \"wlr-randr --output DP-1 --mode 2560x1080@74.99097 --adaptive-sync enabled\"")
(riverctl "spawn \"wlr-randr --output DP-2 --mode 2560x1440@74.971001 --pos 2560,0 --adaptive-sync enabled\"")

;; panel
;; TODO see if its running before spawning
(riverctl "spawn \"waybar\"")
