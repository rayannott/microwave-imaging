import os

def abs_path_from_filename(filename):
    return os.path.abspath(os.path.join("data", "dummy", f"{filename}.img"))
