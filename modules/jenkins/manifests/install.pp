# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::install
class jenkins::install(
  String[1] $javaversion = '1.8.0'
) {

# Set variables
  $java_package = "java-${javaversion}-openjdk-devel"

# apt repo
  apt::source { 'jenkins-repo':
  ensure   => present,
  enable   => true,
  comment  => 'This is the apt source for the jenkins repo',
  location => 'https://pkg.jenkins.io/debian-stable binary/',
  key      => 0,
  }

# Install Jenkins repo  
  package {'java':
    ensure => present,
    name   => $java_package,
  }

  package {'jenkins':
    ensure  => present,
    require => Package['java']
  }
}

