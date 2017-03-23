more off
warning('off', 'Octave:shadowed-function')
setenv('PATH', ['C:\Users\csie\Desktop\project\2017-3-20\dev\build\install\x64\mingw\bin' pathsep getenv('PATH')])

cd('C:\Users\csie\Desktop\project\2017-3-20\dev\mexopencv')
addpath('C:\Users\csie\Desktop\project\2017-3-20\dev\mexopencv')
addpath('C:\Users\csie\Desktop\project\2017-3-20\dev\mexopencv\opencv_contrib')
addpath('C:\Users\csie\Desktop\project\2017-3-20\dev\mexopencv\+cv\private')                
addpath('C:\Users\csie\Desktop\project\2017-3-20\dev\mexopencv\opencv_contrib\+cv\private') 
mexopencv.make('opencv_path','C:\Users\csie\Desktop\project\2017-3-20\dev\build\install', 'opencv_contrib',true);