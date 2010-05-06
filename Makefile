RTS = +RTS -N2 -RTS
GHC = ghc $(RTS) -hidir ../build/ -odir ../build/

all:
	$(GHC) -main-is Web --make Web && ./Web

clean:
	rm -f *.html Web
