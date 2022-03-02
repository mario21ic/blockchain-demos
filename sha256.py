#!/usr/bin/env python
# usage:
# ./sha256.py string

import sys
import hashlib


def main(text):
    m = hashlib.sha256()
    m.update(str.encode(text))
    #print("sha256: ", m.digest())

    print("text: ", text)
    print("sha256: ", m.hexdigest())

    text = text + "xD"
    m.update(str.encode(text))
    print("text: ", text)
    print("sha256: ", m.hexdigest())

if __name__=="__main__":
    main(sys.argv[1])
