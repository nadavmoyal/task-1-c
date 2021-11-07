CC=gcc 
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=mylib.o
FLAGS= -Wall -g
all: loops recursives recursived loopd mains maindloop maindrec main.o

loops: libclassloops.a 
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so  

loops: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

recursives: basicClassification.o advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o 

recursived: basicClassification.o advancedClassificationRecursion.o
	$(CC) -shared -o libclassrec.so  basicClassification.o advancedClassificationRecursion.o 

loopd: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -o libclassloops.so  basicClassification.o advancedClassificationLoop.o

mains: main.o recursives
	$(CC) $(FLAGS) -o mains main.o libclassrec.a -lm

maindloop: main.o loopd
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm


main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c 

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c -lm	

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm		

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) -c advancedClassificationRecursion.c NumClass.h -lm	

.PHONY: clean all

clean:
	rm -f *.o *.a *.so loops recursived loopd mains maindloop maindrec
