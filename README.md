# python-обертка над С-кодом

Порядок сборки для Windows:
1. создать папку build в корне
2. cd build
3. cmake path_to_dit/CMakeLists.txt
4. build
5. в директории D:\courses\wrapper_python_under_C\build\lib\Release появится pywrapper

Окружение в котором протестирован код:
1. Windows 10
2. C compiler MSVC 19.37.32822.0
3. MSBuild 17.7.2+d6990bcfa
4. cmake version 3.27.4
5. python 3.10.11

В обертке используется cython: https://cython.org/

В репозитории располагаются следующие папки:
- headers - заголовочные файлы с-кода						
- sources - файлы с реализацией с-кода		
- wrapper
	- CmakeLists.txt 
	- FindCython.cmake https://github.com/nest/nest-simulator/blob/master/cmake/FindCython.cmake
	- pywrapper.pyx
	- UseCython.cmake https://github.com/nest/nest-simulator/blob/master/cmake/UseCython.cmake
	- wrapper.pxd
- CmakeLists.txt
- example.py
- README.md

1. В файлах `.h` и `.c` реализованы функции статической библиотеки. В C бибилиотке реализована функция *test* ```float test(float *TestArray, int n)```
Функция принимает numpy array и длину массива и возвращает сумму его элементов.
2. В `wrapper_test/wrapper/CMakeLists.txt` описана сборку модуля `pywrapper`. Для написания `wrapper_test/wrapper/CMakeLists.txt` используется https://cmake.org/cmake/help/latest/module/FindPython.html или https://cmake.org/cmake/help/latest/module/FindPython3.html
Перед запуском сборки CMakeLists нужно установть ```pip install Cython``` ```pip install numpy``` и убедится, что *Python* есть в *Path*.
3. В корневой диреткории в `/CMakeLists.txt` установлена выходная папка для сборки библиотек `build\lib`; добавлена поддиректория с `wrapper`; добавлена сборка статической библиотеки на C 
4. Собирать в режиме *Release*
5. В файле `.pyx` код написан на *Pyrex* https://docs.fileformat.com/ru/programming/pyx/


В C бибилиотке реализовать следующую функцию *test* ```float test(float *TestArray)```
Функция принимает numpy array и возвращает сумму его элементов

Функцию *test* вызвать в `examle.py`:
```
import sys
sys.path.append(r'path_to_dir\wrapper_python_under_C\build\lib\Release')
import pywrapper as pw
import numpy as np

meta = np.array([20.3, 20.0, 1.0, 23.77, 61.4, 0.0], dtype=np.float32)

out = pw.test(meta, len(meta))

print(out) #126.47000122070312
```



