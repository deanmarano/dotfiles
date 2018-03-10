----
-- User configuration file for lsyncd.
--
-- Simple example for default rsync, but executing moves through on the target.
--

settings {
    logfile = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd-status.log",
    statusInterval = 20
}

sync {
   default.rsyncssh,
   source="/home/dean",
   host="dean@fusion",
   targetdir="/mnt/eta/home/pixelbook",
   exclude= { ".cache", "tmp", "node_modules", ".lock", ".wakatime" },
   rsync = {
     archive = true,
     compress = false,
     whole_file = false
   }
}
