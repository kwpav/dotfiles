;; #!/usr/bin/env bb
(ns eww.workspace
  (:require
   [babashka.process :refer [shell process exec alive?]]
   [cheshire.core :as json]
   [clojure.java.io :as io]))

(defn get-workspaces []
  (-> (shell {:out :string :err :string} "swaymsg -t get_workspaces")
      :out
      (json/parse-string true)))

(defn get-workspace-data
  []
  (let [workspaces (get-workspaces)]
    (json/generate-string
     (map
      (fn [{:keys [name output focused visible] :as _workspace}]
        {output {:name name
                 :monitor output
                 :focused focused
                 :visible visible}})
      workspaces))))

(defn -main
  []
  (let [process (shell {:out :string :err :string}
                       "swaymsg -t subscribe -m '[\"workspace\"]'  --raw")]
    (while true
      (do (pr (get-workspace-data))
          (flush))))
  #_(let [process (shell {:out :string :err :string} "swaymsg -t subscribe -m '[\"workspace\"]'  --raw")]
      (while true
        (when process
          (prn (get-workspace-data))))
      ))

(comment
  (def swaymsg
    (process {:out :string} "swaymsg -t subscribe -m '[\"workspace\"]'  --raw"))
  (alive? swaymsg)
  (:out swaymsg)
  (:exit @swaymsg)
  (def stdin (io/writer (:in swaymsg)))
  (binding [*out* stdin]
    (println "hello"))
  (.close stdin)
  (slurp (:out swaymsg))
  (:exit @swaymsg)
  (alive? swaymsg)

  (let [stream (-> (process "ls") :out)]
    @(process {:in stream
               :out :inherit} "cat")
    nil)
  (get-workspaces)
  (get-workspace-data)
  ({:floating_nodes [],
    :num 1,
    :current_border_width 0,
    :layout "splith",
    :name "1",
    :deco_rect {:x 0, :y 0, :width 0, :height 0},
    :orientation "horizontal",
    :type "workspace",
    :urgent false,
    :output "DP-1",
    :geometry {:x 0, :y 0, :width 0, :height 0},
    :window nil,
    :window_rect {:x 0, :y 0, :width 0, :height 0},
    :representation "H[firefox-default]",
    :sticky false,
    :nodes [],
    :focused false,
    :id 4,
    :marks [],
    :focus [7],
    :percent nil,
    :visible true,
    :border "none",
    :rect {:x 60, :y 20, :width 2480, :height 1040},
    :fullscreen_mode 1}
   {:floating_nodes [],
    :num 2,
    :current_border_width 0,
    :layout "splith",
    :name "2",
    :deco_rect {:x 0, :y 0, :width 0, :height 0},
    :orientation "horizontal",
    :type "workspace",
    :urgent false,
    :output "DP-2",
    :geometry {:x 0, :y 0, :width 0, :height 0},
    :window nil,
    :window_rect {:x 0, :y 0, :width 0, :height 0},
    :representation "H[Emacs]",
    :sticky false,
    :nodes [],
    :focused true,
    :id 6,
    :marks [],
    :focus [16],
    :percent nil,
    :visible true,
    :border "none",
    :rect {:x 2580, :y 20, :width 2480, :height 1400},
    :fullscreen_mode 1})

  (json/parse-string
   "{ \"change\": \"focus\", \"old\": { \"id\": 4, \"type\": \"workspace\", \"orientation\": \"horizontal\", \"percent\": null, \"urgent\": false, \"marks\": [ ], \"focused\": false, \"layout\": \"splith\", \"border\": \"none\", \"current_border_width\": 0, \"rect\": { \"x\": 50, \"y\": 10, \"width\": 2500, \"height\": 1060 }, \"deco_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"window_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"geometry\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"name\": \"1\", \"window\": null, \"nodes\": [ { \"id\": 7, \"type\": \"con\", \"orientation\": \"none\", \"percent\": 1.0, \"urgent\": false, \"marks\": [ ], \"focused\": false, \"layout\": \"none\", \"border\": \"pixel\", \"current_border_width\": 3, \"rect\": { \"x\": 50, \"y\": 10, \"width\": 2500, \"height\": 1060 }, \"deco_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"window_rect\": { \"x\": 3, \"y\": 3, \"width\": 2494, \"height\": 1054 }, \"geometry\": { \"x\": 0, \"y\": 0, \"width\": 738, \"height\": 650 }, \"name\": \"workspace.clj - GNU Emacs at valinor\", \"window\": 8388632, \"nodes\": [ ], \"floating_nodes\": [ ], \"focus\": [ ], \"fullscreen_mode\": 0, \"sticky\": false, \"pid\": 930, \"app_id\": null, \"visible\": true, \"max_render_time\": 0, \"shell\": \"xwayland\", \"inhibit_idle\": false, \"idle_inhibitors\": { \"user\": \"none\", \"application\": \"none\" }, \"window_properties\": { \"class\": \"Emacs\", \"instance\": \"emacs\", \"title\": \"workspace.clj - GNU Emacs at valinor\", \"transient_for\": null } } ], \"floating_nodes\": [ ], \"focus\": [ 7 ], \"fullscreen_mode\": 1, \"sticky\": false, \"num\": 1, \"output\": \"DP-1\", \"representation\": \"H[Emacs]\" }, \"current\": { \"id\": 6, \"type\": \"workspace\", \"orientation\": \"horizontal\", \"percent\": null, \"urgent\": false, \"marks\": [ ], \"focused\": false, \"layout\": \"splith\", \"border\": \"none\", \"current_border_width\": 0, \"rect\": { \"x\": 2570, \"y\": 10, \"width\": 2500, \"height\": 1420 }, \"deco_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"window_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"geometry\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"name\": \"2\", \"window\": null, \"nodes\": [ { \"id\": 8, \"type\": \"con\", \"orientation\": \"none\", \"percent\": 1.0, \"urgent\": false, \"marks\": [ ], \"focused\": true, \"layout\": \"none\", \"border\": \"pixel\", \"current_border_width\": 3, \"rect\": { \"x\": 2570, \"y\": 10, \"width\": 2500, \"height\": 1420 }, \"deco_rect\": { \"x\": 0, \"y\": 0, \"width\": 0, \"height\": 0 }, \"window_rect\": { \"x\": 3, \"y\": 3, \"width\": 2494, \"height\": 1414 }, \"geometry\": { \"x\": 0, \"y\": 0, \"width\": 693, \"height\": 480 }, \"name\": \"swaymsg -t subscribe ~\\/.c\\/eww\", \"window\": null, \"nodes\": [ ], \"floating_nodes\": [ ], \"focus\": [ ], \"fullscreen_mode\": 0, \"sticky\": false, \"pid\": 1121, \"app_id\": \"foot\", \"visible\": true, \"max_render_time\": 0, \"shell\": \"xdg_shell\", \"inhibit_idle\": false, \"idle_inhibitors\": { \"user\": \"none\", \"application\": \"none\" } } ], \"floating_nodes\": [ ], \"focus\": [ 8 ], \"fullscreen_mode\": 1, \"sticky\": false, \"num\": 2, \"output\": \"DP-2\", \"representation\": \"H[foot]\" } }"
   true)

  :Comment)


