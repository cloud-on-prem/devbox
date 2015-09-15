# Immutable Dev Environment #

This is the code to set up an ansible/vagrant/virtualbox powered Ubuntu dev box.
The basic idea is that the tools and infrastructure contained in the box are cleanly separated from the actual workspace.
You can safely destroy the box/ rebuild it/upgrade it without losing any of your work. Use Neovim to work on your code or use your favourite Mac/Windows based text editor and compile/run stuff inside the VM like a pro.

### What's inside? ###

* [Ubuntu Wily Werewolf](https://atlas.hashicorp.com/ubuntu/boxes/wily64)
* Latest Go (1.5)
* Latest Ruby (2.2)
* [Neovim](https://github.com/neovim/neovim)
* Tmux
* Tons of other dev goodies

### How do I get set up? ###

* Download [Ansible Core](http://docs.ansible.com/ansible/intro_installation.html#getting-ansible)
* Download [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Clone this repo
* From inside the repo run `vagrant up`
* Grab a cup of coffee and wait while your awesome devbox comes to life.
* `vagrant ssh` when you want to get into the box.


* * *

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
