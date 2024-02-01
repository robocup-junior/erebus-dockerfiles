# C++ Example

This is a very simple example C++ controller. 

To build the controller, we use CMake. The included `Makefile` and `Makefile.include` are modified versions of the official Webots makefiles for building C/C++ controllers. They are modified to make them slightly easier to work with when using Docker (more specifically, you don't need to have your directory name the same as the entry point file, etc.).

It is recommended to use these modified makefiles for compiling any C/C++ projects. Please note that `Makefile.include` shouldn't be modified, and only custom variables should need to be added to the `Makefile` to make them compatible with your project.
