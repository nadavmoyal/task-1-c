CC=gcc 
AR=ar
FLAGS= -Wall -g

all: loopd loops  recursived recursives mains maindloop maindrec 

loopd: libclassloops.so
loops: libclassloops.a
recursived: libclassrec.so
recursive: libclassrec.a

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c -lm	
	
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm		

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) -c advancedClassificationRecursion.c NumClass.h -lm


libclassloops.a: basicClassification.o  advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a  basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o  advancedClassificationRecursion.o
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o 
libclassrec.so: basicClassification.o  advancedClassificationRecursion.o
	$(CC) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o 

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a -lm	
maindloop: main.o 
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm
maindrec: main.o 
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm
.PHONY: clean all

clean:
	rm -f *.o *.a *.so loops recursived loopd mains maindloop maindrec