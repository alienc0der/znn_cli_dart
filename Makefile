default: all

all:
	echo Use 'make windows', 'make linux' or `make macos` to build the znn-cli binary

windows:
	mkdir build
	dart pub get
	dart compile exe ./bin/znn_cli.dart -o build\znn-cli.exe
	cp .\Resources\argon2_ffi_plugin.dll .\build
	cp .\Resources\libledger_ffi.dll .\build
	cp .\Resources\libpow_links.dll .\build
	
linux:
	mkdir -p build
	dart pub get
	dart compile exe ./bin/znn_cli.dart -o build/znn-cli
	cp ./Resources/libargon2_ffi_plugin.so ./Resources/libledger_ffi.so ./Resources/libpow_links.so ./build
	
macos:
	mkdir -p build
	dart pub get
	dart compile exe ./bin/znn_cli.dart -o build/znn-cli
	cp ./Resources/libargon2_ffi.dylib ./Resources/libledger_ffi.dylib ./Resources/libpow_links.dylib ./build
