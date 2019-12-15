.PHONY: build-freeplane
build-freeplane:
	./freeplane/build.sh

.PHONE: run-freeplane
run-freeplane: run-gui.sh
	./run-gui.sh freeplane || ./freeplane/build.sh && ./run-gui.sh freeplane