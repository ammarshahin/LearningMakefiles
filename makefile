# Author: Ammar Shahin
# Date:   20/11/2019


############################### Variables #######################################

######### change here ########
_DEPS = code.h
_OBJ  = main.o code.o          
##############################
 
CC = gcc
CFLAGS = -I$(IDIR)

IDIR = ./inc
ODIR = ./obj
LDIR = ./lib
SDIR = ./src

LIBS = -lm

DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

OBJ  = $(patsubst %,$(ODIR)/%,$(_OBJ))


#******************************* Rules *******************************
all: app 

app: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

git: 
	git add .
	git commit -a -m "updating" 
	git push origin master

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 