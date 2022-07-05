# Compile and EXecute C to LLVM
# It is assumed that all the LLVM tools are under the folder `build/bin/`

import argparse
from operator import contains
import subprocess
import sys

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def main():
    parser = argparse.ArgumentParser(description='CEXllvm - Compile and EXecute C to LLVM')
    parser.add_argument('source', type=str)

    args = parser.parse_args()
    filename = args.source
    
    filename = sys.argv[1][:-2]
    
    # emit LLVM
    cmd1 = "clang -emit-llvm -S " + filename + ".c -o " + filename + ".ll"
    execute(cmd1)

    # apply pass to .ll file
    cmd2 = "build/bin/opt -S --enable-new-pm=0 -load build/lib/CFGVerification.so -verify_cfg -o "+filename+"_new.ll "+filename+".ll"
    execute(cmd2)

    # compile the new file into assembly
    cmd4 = "build/bin/llc " +filename+"_new.ll -o "+filename+"_new.s"
    execute(cmd4)

    # create the binary from the assembly
    cmd5 = "clang "+filename+"_new.s -o "+filename+"_new -no-pie"
    execute(cmd5)

    print("Do you want to execute the program? [y/n]")
    choice = input()
    if choice == "y":
        cmd3 = "./"+filename+"_new"
        execute(cmd3)


def execute(cmd):
    print(bcolors.OKBLUE + "executing: " + cmd + "..." + bcolors.ENDC)
    subprocess.run(cmd, shell=True, check=True)
    print(bcolors.OKGREEN + "[done]" + bcolors.ENDC)

if __name__ == "__main__":
    main()
