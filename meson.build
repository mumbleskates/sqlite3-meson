project(
  'sqlite3-meson', 'c',
  version : '0.0.1',
  default_options : [
    'warning_level=1',
    'buildtype=release',
  ],
)

sqlite3_folder = 'sqlite-amalgamation-3460000/'

thread_dep = dependency('threads')

cc = meson.get_compiler('c')
dl_dep = cc.find_library('dl', required : false)
m_dep = cc.find_library('m', required: false)

sqlite_args = [
  '-DSQLITE_DQS=0',
  '-DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1',  # default to "normal"
  '-DSQLITE_ENABLE_FTS5',
  '-DSQLITE_ENABLE_JSON1',
  '-DSQLITE_ENABLE_RTREE',
  '-DSQLITE_ENABLE_UNLOCK_NOTIFY',
]
if cc.get_id() == 'msvc' and get_option('default_library') != 'static'
  sqlite_args += ['-DSQLITE_API=__declspec(dllexport)']
endif

sqlite3_lib = library(
  'sqlite3',
  sqlite3_folder + 'sqlite3.c',
  c_args : sqlite_args,
  dependencies : [thread_dep, dl_dep, m_dep],
)
sqlite3_dep = declare_dependency(
  link_with : sqlite3_lib,
  include_directories : sqlite3_folder,
)

sqlite3_shell = executable(
  'sqlite3_shell',
  sqlite3_folder + 'shell.c',
  dependencies : [sqlite3_dep],
)
