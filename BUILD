load("@org_tensorflow_tensorboard//tensorboard/defs:vulcanize.bzl", "tensorboard_html_binary")
load("@org_tensorflow_tensorboard//tensorboard/defs:web.bzl", "tf_web_library")
load("@org_tensorflow_tensorboard//tensorboard/defs:zipper.bzl", "tensorboard_zip_file")

py_binary(
    name = "gr_tensorboard_main",
    srcs = ["main.py"],
    main = "main.py",
    deps = [
        "//paramplot:paramplot_plugin",
        "//runsenabler:runsenabler_loader",
        "@org_pocoo_werkzeug",
        "@org_tensorflow_tensorboard//tensorboard:default",
        "@org_tensorflow_tensorboard//tensorboard:program",
    ],
)

py_binary(
    name = "gr_tensorboard",
    srcs = ["main_bazel.py"],
    data = ["assets.zip"],
    main = "main_bazel.py",
    deps = [":gr_tensorboard_main"]
)

tf_web_library(
    name = "index",
    srcs = ["index.html"],
    path = "/",
    deps = [
        "//paramplot:paramplot_dashboard",
        "//runsenabler:runsenabler_dashboard",
        "@org_tensorflow_tensorboard//tensorboard/components/tf_imports:webcomponentsjs",
        "@org_tensorflow_tensorboard//tensorboard/components/tf_tensorboard",
        "@org_tensorflow_tensorboard//tensorboard/components/tf_tensorboard:default_plugins",
    ],
)

tensorboard_zip_file(
    name = "assets",
    deps = [":index"],
)
