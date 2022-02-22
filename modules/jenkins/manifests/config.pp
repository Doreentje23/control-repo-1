# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::config
class jenkins::config {
  file_line {'auto_unlock_jenkins': 
    line      => 'JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false"',
    replace   => true,
    path      => 'etc/default/jenkins',
    match     => '^JENKINS_JAVA_OPTIONS=",*"$',
    notify    => Service['jenkins'],
    require   => Package['jenkins'],
  }

 file_line {'jenkins_port':}
   path    => 'etc/default/jenkins',
   replace => true,
   line    => "JENKINS_PORT=\"${jenkins::jenkinsport}\""
   match   => '^JENKINS_PORT=".*"$',
   notify  => Service['jenkins'],
   require => Package['jenkins'],
}
