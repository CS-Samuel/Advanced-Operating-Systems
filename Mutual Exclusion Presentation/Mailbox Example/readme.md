
Source:https://macboypro.wordpress.com/2009/05/15/posix-message-passing-in-linux/


Compile Commands:
gcc -o external.out external.c
gcc -o central.out central.c

Run each process in a separate terminal like so:

./external.out 100 1

./external.out 22 2

./external.out 50 3

./external.out 40 4

./central.out 60

OUTPUT:

lee@isis:~$ ./central.out 60

Starting Server...

Temperature Stabilized: 49

Shutting down Server...

lee@isis:~$ ./external.out 100 1

Process 1 Temp: 49

lee@isis:~$ ./external.out 22 2

Process 2 Temp: 49

lee@isis:~$ ./external.out 50 3

Process 3 Temp: 49

lee@isis:~$ ./external.out 40 4

Process 4 Temp: 49
