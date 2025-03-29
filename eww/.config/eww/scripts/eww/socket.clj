(ns eww.socket
  (:import
   ;; [java.nio.file Path]
   [java.net Socket UnixDomainSocketAddress StandardProtocolFamily]
   [java.nio.channels ServerSocketChannel SocketChannel]
   [java.nio ByteBuffer]
   [java.io DataInputStream DataOutputStream]))

;; https://github.com/babashka/babashka/issues/1511

;; https://nipafx.dev/java-unix-domain-sockets/
;; SWAYSOCK
(def address (UnixDomainSocketAddress/of (System/getenv "SWAYSOCK")))

#_(def server (future (doto (ServerSocketChannel/open StandardProtocolFamily/UNIX)
                      (.bind address)
                      (.accept))))

(defonce client
  (doto (SocketChannel/open StandardProtocolFamily/UNIX)
    (.connect address)))

;; (def command "1")
;; (def socket (Socket. address))

#_(defn dostuff [addr]
    (let [ch (SocketChannel/open StandardProtocolFamily/UNIX)]
      (loop [retry 0]
        (let [v (try (.connect ch addr)
                     (catch Exception e e))]
          (if (instance? Exception v)
            (if (< retry 10)
              (do (Thread/sleep 10)
                  (recur (inc retry)))
              (throw v))
            v)))
      (.close ch)) )

(comment
  address
  ;; (dostuff address)
  (System/getenv "SWAYSOCK")

  client

  ;; https://stackoverflow.com/questions/30046355/how-to-read-bytes-in-bytebuffer-with-clojure
  (let [buffer  (ByteBuffer/allocate 1024)
        #_#_arr (byte-array 2)]
    (.clear buffer)
    (.put buffer (.getBytes "GET_TREE"))
    (.flip buffer)
    (loop []
      (when (.hasRemaining buffer)
        (do
          (prn "client: "client)
          (prn "buffer: " buffer)
          (.write client buffer)
            (recur)))))

  (.getBytes "1")
  :comment)
