from utils import load_labels
import numpy as np

def main() -> None:
    dummy_labels, radar_labels = load_labels()

    filenames = list(dummy_labels.keys())
    by_x = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][0])
    by_y = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][1])
    by_z = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][2])
    by_x_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][0]**2)
    by_y_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][1]**2)
    by_z_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['p_pivot'][2]**2)
    by_xyz_sqr = sorted(filenames, key=lambda x: np.sum(np.array(dummy_labels[x]['p_pivot'])**2))
    by_alpha = sorted(filenames, key=lambda x: dummy_labels[x]['alpha'])
    by_beta = sorted(filenames, key=lambda x: dummy_labels[x]['beta'])
    by_gamma = sorted(filenames, key=lambda x: dummy_labels[x]['gamma'])
    by_alpha_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['alpha']**2)
    by_beta_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['beta']**2)
    by_gamma_sqr = sorted(filenames, key=lambda x: dummy_labels[x]['gamma']**2)
    by_alphabetagamma_sqr = sorted(
        filenames, 
        key=lambda x: np.sum(np.array([dummy_labels[x]['alpha'], dummy_labels[x]['beta'], dummy_labels[x]['gamma']])**2)
    )
    to_pickle = {
        'by_x': by_x,
        'by_y': by_y,
        'by_z': by_z,
        'by_x_sqr': by_x_sqr,
        'by_y_sqr': by_y_sqr,
        'by_z_sqr': by_z_sqr,
        'by_xyz_sqr': by_xyz_sqr,
        'by_alpha': by_alpha,
        'by_beta': by_beta,
        'by_gamma': by_gamma,
        'by_alpha_sqr': by_alpha_sqr,
        'by_beta_sqr': by_beta_sqr,
        'by_gamma_sqr': by_gamma_sqr,
        'by_alphabetagamma_sqr': by_alphabetagamma_sqr,
    }

if __name__ == '__main__':
    main()
