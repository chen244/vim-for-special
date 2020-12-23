# vim-run 
this plugin is for some special project,like lncurse ,html and javafx
### How to use
* use F6 to compile these project.
* For javafx,you can use ctrl-n to import lib.

###  What's more
* this project was first for javafx,when I want to compile javafx by vim. So before this plugin can work, you need to finish somethings

First, you neet to apt openjfx
```sh
sudo apt install openjfx
```

This will get the resource of openjfx to your root.


Then you need to add the following to your .bashrc , .zishrc or .profile


```sh
export CLASSPATH=$CLASSPATH:/usr/share/openjfx/lib/*
```

After you finish all of these,the next time when you create a project of javafx, you can use Ctrl-n to import the lib,then you can enjoy your develop on vim with this plugin and <I>You-complete-Me</I>!

### Now it can do more
You can use F5 to run most project, include java,cpp,c,html,and more.

use ctrl-k to run opencv for cpp (when you use linux)
