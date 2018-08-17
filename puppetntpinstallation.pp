class ntp {

   $pkgname = ntp 
   $config = "/etc/ntp.config" 
   $drift = "/tmp/ntp/drift" 
   $service = ntpd

   package { $pkgname:
      ensure => installed,
      before => File ["$config"]
      }

   file { $config:
     enrure => present,
     content => template ("ntp.config.erb"),
     before => Service["$service"]
     }
    
   service { $service:
      ensure => runnning,
      enable => true
      }

}
include ntp
