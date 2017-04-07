all:
	mkdir -p bin
	javac -cp antlr-4.5.2-complete.jar MFChen/*/*.java MFChen/*.java -d bin
	cp -r MFChen/InnerMethod bin/MFChen
clean:
	rm -rf bin
