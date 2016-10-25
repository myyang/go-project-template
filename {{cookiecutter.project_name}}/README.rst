{{cookiecutter.project_name}}
=============================

This is {{cookiecutter.project_name}} project

Setup
-----

Recommend gvm_ to manage golang development environment.

.. _gvm: https://github.com/moovweb/gvm

.. code:: shell

    git clone "{{cookiecutter.project_name}}_repository_url"

Development
-----------

Use makefile pre-defined commands:

Build
~~~~~

Build executable file.

.. code:: shell

   make build

Debug
~~~~~

Build debug executable file. Please also read `official docs`_ about debugging.

.. code:: shell

    make debug
    gdb {{cookiecutter.project_name}}

.. _`official docs`: https://golang.org/doc/gdb

Test
~~~~

Testing source code.

.. code:: shell

    make test

Coverage report:

.. code:: shell

    make coverage

Benchmark
~~~~~~~~~

Benchmarking performance or memory. The built executable file can also be used to in GDB.

Performance:

.. code:: shell

    make bench

Memory:

.. code:: shell

    make benchalloc
