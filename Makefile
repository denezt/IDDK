CC=gcc
NULL=/dev/null
APT_GET=apt-get
APT_FLG=-y
APT_CMD=install
PRG1=medusa
PRG2=snarf

all:
	@echo "Try 'make test' or 'make install'."	


test:
	@echo "Testing the makefile..."
	@$(CC) -v 2> $(NULL) && echo "Found C complier."
	@echo "Successfully executed!"
	@medusa	2> $(NULL) || echo "Error: Missing Medusa program, try 'apt-get install medusa'."


install:
	@printf "Installing Medusa [1]\n"
	@$(APT_GET) $(APT_FLG) $(APT_CMD) $(PRG1) || $(APT_GET) update && \
	$(APT_GET) $(APT_FLG) $(APT_CMD) $(PRG1) 
	
	@printf "Installing Snarf [2]\n"
	@$(APT_GET) $(APT_FLG) $(APT_CMD) $(PRG2) || $(APT_GET) update && \
	$(APT_GET) $(APT_FLG) $(APT_CMD) $(PRG2) 


