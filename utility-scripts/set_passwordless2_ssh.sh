#!/bin/bash

sh-keygen -t rsa -P '' -f ~/.ssh/id2_rsa
cat ~/.ssh/id2_rsa.pub >> ~/.ssh/authorized_keys
scp -r ~/.ssh/ user@slave2:~/
