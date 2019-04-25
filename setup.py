from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

extensions = Extension(
    name="tdm_ripper",
    sources=["pytdm_ripper.pyx"], #,"lib/tdm_ripper.cpp"],
    # libraries=["tdm_ripper"],
    library_dirs=["lib"],
    include_dirs=["lib"],
    language='c++',
    extra_compile_args=['-stdlib=libc++','-std=c++11'],
    extra_link_args=['-std=c++11'],
)

setup(
    name="tdm_ripper",
    ext_modules=cythonize(extensions)
)
