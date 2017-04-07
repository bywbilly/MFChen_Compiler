import string
import os

os.system("java -jar /usr/local/lib/antlr-4.5.2-complete.jar MFChen.g4")
os.system("javac *.java")

os.system("java org.antlr.v4.gui.TestRig MFChen program -gui -tree < test1.cpp" )
