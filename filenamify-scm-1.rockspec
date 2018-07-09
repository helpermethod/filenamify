package = 'filenamify'
version = 'scm-1'
source = {
   url = '*** please add URL for source tarball, zip or repository here ***'
}
description = {
   homepage = '*** please enter a project homepage ***',
   license = '*** please specify a license ***'
}
dependencies = {}
build = {
   type = 'builtin',
   modules = {
      filenamify = 'src/filenamify.lua',
      fp = 'src/fp.lua',
      humanize = 'src/humanize.lua'
   }
}
