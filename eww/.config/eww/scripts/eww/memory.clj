;; #!/usr/bin/env bb
(ns eww.memory
  (:require
   [babashka.process :refer [shell]]
   [clojure.string :as str]))

(defn get-memory-usage
  []
  (shell {:out :string :err :string} "free -m"))

(comment
  ()(filter seq (str/split (first (filter #(str/starts-with? % "Mem:") (str/split-lines (:out (get-memory-usage)))))
                           #" "))

  (-> (shell {:out :string}
             "free -m | grep Mem | awk '{print ($3/$2)*100}'"))
  :comment)
