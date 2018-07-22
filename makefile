VALAC=valac
VALAFILES=main.vala
VALAPKGS=--pkg gtk+-3.0
VALAPTS=

EXEC=main

default:
	$(VALAC) $(VALAFILES) -o $(EXEC) $(VALAPKGS) $(VALAOPTS)

run:
	./$(EXEC)
