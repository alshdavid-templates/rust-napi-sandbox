set windows-shell := ["pwsh", "-NoLogo", "-NoProfileLoadTime", "-Command"]
lib_name := "napi_sandbox"

profile := env_var_or_default("profile", "debug")

profile_cargo := \
if \
  profile != "debug" { "--profile " + profile } \
else \
  { "" }


dylib := \
if \
  os() == "windows" { lib_name + ".dll" } \
else if \
  os() == "macos" { "lib" + lib_name + ".dylib" } \
else if \
  os() == "linux" { "lib" + lib_name + ".so" } \
else \
  { os() }

root_dir :=  justfile_directory()
out_dir :=  join(justfile_directory(), "target", profile)

build:
    @test -d node_modules || npm install
    cd napi_sandbox && npx napi build {{profile_cargo}}

run:
    just build
    node {{root_dir}}/cmd/index.js

fmt:
  cargo +nightly fmt
  
