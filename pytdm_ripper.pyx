
from tdm_ripper cimport tdm_ripper
import numpy as np

cdef class pytdmripper:

    # pointer to C++ instance (since there's no nullary constructor)
    cdef tdm_ripper *cripp

    def __cinit__(self, string tdmfile):
        self.cripp = new tdm_ripper(tdmfile)

    def __dealloc__(self):
        del self.cripp

    def show_channels(self):
        self.cripp.list_channels()

    def num_channels(self):
        return self.cripp.num_channels()

    def num_groups(self):
        return self.cripp.num_groups()

    def get_channel(self, int channelid):
        return np.asarray(self.cripp.get_channel(channelid))

    def print_channel(self, int channelid, const char* filename):
        self.cripp.print_channel(channelid,filename)

    # integrate into CONTI_HBS workflow by adding methods: (29.04.2019)
    #   tdm_loader.OpenFile(tmp_path + name_prefix + '/Messung.tdm', encoding='utf-8')
    #   .no_channel_groups()
    #   .no_channels(i)
    #   .channel_name(i, j)
    #   .channel(i, j)
    #   .close()
    #
    # evtl. get time_stamp of .tdm file in the unix format, i.e. #seconds since 01.01.0000 with average year having 365+97/400 = 365.2425 days
