CC=gcc 
AR=ar
FLAGS= -Wall -g
BASIC=basicClassification.o
AD_LOOP=advancedClassificationLoop.o
AD_REC=advancedClassificationRecursion.o
all: loopd loops  recursived recursives mains maindloop maindrec 

loopd: libclassloops.so
loops: libclassloops.a
recursived: libclassrec.so
recursive: libclassrec.a

$(BASIC): basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c -lm	
	
$(AD_LOOP): advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm		

$(AD_REC): advancedClassificationRecursion.c NumClass.h
	$(CC) -c advancedClassificationRecursion.c NumClass.h -lm


libclassloops.a: $(BASIC)  $(AD_LOOP)
	$(AR) -rcs libclassloops.a  $(BASIC) $(AD_LOOP)

libclassrec.a: $(BASIC)  $(AD_REC)
	$(AR) -rcs libclassrec.a $(AD_REC) $(BASIC)

libclassloops.so: $(BASIC) $(AD_LOOP)
	$(CC) -shared -o libclassloops.so $(BASIC) $(AD_LOOP)
libclassrec.so: $(BASIC)  $(AD_REC)
	$(CC) -shared -o libclassrec.so $(BASIC) $(AD_REC) 

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