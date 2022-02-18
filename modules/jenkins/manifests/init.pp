# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins {
  contains jenkins::install
  contains jenkins::configure
  contains jenkins::service

  Class['jenkins::install']
  -> Class ['jenkins::configure']
  ~> Class['jenkins::service']
}
