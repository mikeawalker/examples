
from setuptools import setup 
__version__ = "0.0.0"


setup( 
    name='my-package', 
    version=__version__, 
    description='A basic example python package', 
    author='The author', 
    author_email='chad@bro.com', 
    packages=['src/my_package'], 
    install_requires=[ 
        'numpy',  
    ], 
) 