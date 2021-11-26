make
clang -c main.c && clang -lasm -L. -o main main.o libasm.a
./main
rm main
rm main.o
