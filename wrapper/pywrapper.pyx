import numpy as np
cimport numpy as np

import pyximport
cimport wrapper as w

from libc.stdint cimport uintptr_t
import ctypes

def test(np.ndarray[np.float32_t, ndim=1, mode='c']TestArray, int n):
    MetaArray = np.ascontiguousarray(TestArray, dtype = np.float32)
    meta_ptr = <float*>np.PyArray_DATA(TestArray)
    res = <float>w.test(meta_ptr, n)
    return res