cmake -S. -Bbuild
rm -rf docs
cmake --build build --target docs
