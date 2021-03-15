---
layout: post
title: Update Python on Debian (Ubuntu)
summary: Python, Debian, Ubuntu
---

I was experimenting with Flask and Flask-SocketIO and was trying to run the script I found that there was a required dependency missing 

```
secrets
```

From what I was able to figure out in this article: https://stackoverflow.com/questions/61547620/import-error-no-module-named-secrets-python-manage-py-not-working-after-pul


In order to solve the problem I found this amazing page where it helps you update your Python to Python3.7 version https://dev.to/serhatteker/how-to-upgrade-to-python-3-7-on-ubuntu-18-04-18-10-5hab


# update-alternatives

https://linuxhint.com/update_alternatives_ubuntu/

This command allows you to make a executable and add all the available versions to the alternatives database. Then you can easily set what version will be used by default.

*Adding alternatives*
```
$ sudo update-alternatives --install /usr/local/bin/python python /usr/bin/python2 20
```

- `/usr/local/bin/python` is the binary path of the python alternatives

*Manually Selecting Alternatives*

```
sudo update-alternatives --config python
```

