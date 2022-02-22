# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins(
   String $jenkinsport,
) {
  contains jenkins::install
  contains jenkins::config
  contains jenkins::service

  Class['jenkins::install']
  -> Class ['jenkins::config']
  ~> Class['jenkins::service']
}
