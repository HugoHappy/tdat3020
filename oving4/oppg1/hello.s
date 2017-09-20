# Prints "Hello world from Trondheim!" 3 times to standard output. 
.section .data                        # This section is for declaring initialized data

  message: .ascii "Hello world from Trondheim!\n"    # Declare message
  length: .byte 28                    # Length of the message


.section .text                        # This is where the actual assembly code is written

  .global _start                      # The .text section must begin with the declaration global _start,
                                      # which just tells the kernel where the program execution begins


_start:                               # Execution begins here
  movl $3, %ecx                      # Set counter to 3

top:
  pushl %ecx                          # Store counter on the stack

  # Set parameters for kernel system call:
  movl $4, %eax                       # The system call for write
  movl $2, %ebx                       # File descriptor 2 - standard error
  movl $message, %ecx                 # Put the memory address of message in ecx
  movl (length), %edx                 # (length) is the value at the memory address of length
  int $0x80                           # Call the kernel

  popl %ecx                           # Restore counter from the stack
  decl %ecx                           # Decrease counter
  jnz top                             # If counter is not 0, jump to top:


  # Set parameters for kernel system call:
  movl $1, %eax                       # The system call for exit (sys_exit)
  movl $2, %ebx                       # Exit with return code of 2 (error)
  int $0x80                           # Call the kernel
