# This script should be run in the parent directory of gr_tensorboard
cd gr_tensorboard && 
bazel build --incompatible_remove_native_http_archive=false --incompatible_package_name_is_a_function=false :gr_tensorboard &&
cd .. &&
rm -rf gr_tensorboard/assets/assets.zip && 
cp gr_tensorboard/bazel-bin/assets.zip gr_tensorboard/assets/assets.zip && 
python gr_tensorboard/setup.py sdist bdist_wheel --python-tag py3 && 
pip3 install dist/grtensorboard-0.0.8-py3-none-any.whl