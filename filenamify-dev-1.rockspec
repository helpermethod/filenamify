rockspec_format = '3.0'
package = 'filenamify'
version = 'dev-1'
source = {
   url = 'https://github.com/helpermethod/filenamify'
}
description = {
   license = 'MIT'
}
dependencies = {
  'lua >= 5.1',
	'lamda = 0.1.0'
}
test_dependencies = {
  'busted = 2.0.rc12-1'
}
test = {
  type = 'busted'
}
