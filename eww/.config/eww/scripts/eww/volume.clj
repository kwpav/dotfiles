(ns eww.volume
  (:require
   [babashka.process :refer [shell]]
   [clojure.string :as str]))

(defn get-volume
  []
  (-> (shell {:out :string :err :string} "pulsemixer --get-volume")
      :out
      (str/split #" ")
      first))

(defn -main
  []
  (-> (get-volume)
      parse-long
      prn))

(comment
  (get-volume)
  :comment)
