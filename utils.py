
def abs_path_from_filename(dummy_or_radar: str, filename: str):
    import os
    assert dummy_or_radar in ["dummy", "radar"], f"Unknown data folder: {dummy_or_radar}"
    return os.path.abspath(os.path.join("data", dummy_or_radar, f"{filename}.img"))

def load_labels():
    import json
    with open('data/dummy_labels.json') as f:
        dummy = json.load(f)
    with open('data/radar_labels.json') as f:
        radar = json.load(f)
    return dummy, radar
        
def output_stats(data):
    import numpy as np
    
    print('mean and std\n\t', np.mean(data, axis=0), np.std(data, axis=0))
    print('max and min\n\t', np.max(data, axis=0), np.min(data, axis=0))
