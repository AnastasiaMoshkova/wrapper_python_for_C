import sys
import os
sys.path.append(r'path_to_dir\wrapper_python_for_C\build\lib\Release')
import pywrapper as pw
import numpy as np

meta = np.array([20.3, 20.0, 1.0, 23.77, 61.4, 0.0], dtype=np.float32)

out = pw.test(meta, len(meta))

print(out) #126.47000122070312
