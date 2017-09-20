# Hello World in 32-bit Assembly

## Prerequisites
  * Linux
  * The C++ IDE [juCi++](https://github.com/cppit/jucipp) should be installed.

## Installing dependencies

### Debian based distributions
`sudo apt-get install binutils`

### Arch Linux based distributions
`sudo pacman -S binutils`

## Compiling and running
The `cp` command below adds assembly syntax highlighting and keyword completion to juCi++.
```sh
git clone https://github.com/ntnu-tdat3020/assembly-example
sudo cp assembly-example/asm.lang /usr/share/gtksourceview-3.0/language-specs/
juci assembly-example
```

The `--32` and `-m elf_i386` flags used below is to force 32 bit mode (we are using 32-bit instructions so that it works for both 32-bit and 64-bit systems)
### Alternative 1
In a terminal:
```sh
cd assembly-example
as --32 hello.s -o hello.o       # Compile source to object file that contains machine code
                                 # and usually also references to functions or variables found
                                 # in other object files or libraries.
ld -m elf_i386 hello.o -o hello  # Link object file and create executable. Normally, 
                                 # the machine code of several object files are here combined into 
                                 # one executable, but references to dynamic libraries are kept.
./hello                          # Run executable
```

### Alternative 2
Choose Run Command in the juCi++ Project menu, and run the following command:
```sh
as --32 hello.s -o hello.o && ld -m elf_i386 hello.o -o hello && ./hello
```

Note: if you make changes to the `hello.s` source file, remember to save it before running the above command.
