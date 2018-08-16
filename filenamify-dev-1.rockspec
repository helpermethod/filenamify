rockspec_format = '3.0'
package = 'filenamify'
version = 'dev-1'
source = {
   url = '*** please add URL for source tarball, zip or repository here ***'
}
description = {
   homepage = '*** please enter a project homepage ***',
   license = '*** please specify a license ***'
}
dependencies = {
  'lua >= 5.1, < 5.4'
}
test_dependencies = {
  'busted = 2.0.rc12-1',
  'luacov = 0.13.0-1',
  'luacov-coveralls = 0.2.2-1'
}
test = {
  type = 'busted'
}
