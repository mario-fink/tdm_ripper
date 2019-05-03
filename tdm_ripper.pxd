# cython: language_level = 3
# distutils: language = c++

# use some C++ STL libraries
from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "tdm_ripper.cpp":
    pass

cdef extern from "tdm_ripper.hpp":
    cdef cppclass tdm_ripper:
        tdm_ripper(string) except +
        void list_channels()
        int num_channels()
        int no_channels(int)
        int num_groups()
        int no_channel_groups()
        string channel_name(int,int)
        string channel_unit(int,int)
        vector[double] get_channel(int)
        vector[double] channel(int,int)
        void print_channel(int,const char*)
        # dummy method for compatibility
        void close()
