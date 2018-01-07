#!/usr/bin/python
import sys
import os

doc=open(sys.argv[1]).read()

for k,v in os.environ.items():
  doc = doc.replace('$'+'{'+k+'}',v)

print doc
