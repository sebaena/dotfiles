# fft_module.py
import cmath

def compute_fft(signal):
    """
    Compute the FFT of a given signal using the Cooley-Tukey algorithm.

    Parameters:
        signal (list): Input signal to be transformed (list of complex numbers).

    Returns:
        list: The FFT result (list of complex numbers).
    """
    N = len(signal)

    # Base case: if signal length is 1, return the signal itself
    if N <= 1:
        return signal

    even = compute_fft(signal[0::2])  # FFT of the even-indexed elements
    odd = compute_fft(signal[1::2])   # FFT of the odd-indexed elements

    # Combine even and odd FFT results
    T = [cmath.exp(-2j * cmath.pi * k / N) * odd[k] for k in range(N // 2)]

    # Return combined result
    return [even[k] + T[k] for k in range(N // 2)] + [even[k] - T[k] for k in range(N // 2)]

def compute_ifft(signal):
    """
    Compute the Inverse FFT (IFFT) of a given signal using the Cooley-Tukey algorithm.

    Parameters:
        signal (list): Input signal to be transformed back (list of complex numbers).

    Returns:
        list: The IFFT result (list of complex numbers).
    """
    N = len(signal)

    # Base case: if signal length is 1, return the signal itself
    if N <= 1:
        return signal

    even = compute_ifft(signal[0::2])  # IFFT of the even-indexed elements
    odd = compute_ifft(signal[1::2])   # IFFT of the odd-indexed elements

    # Combine even and odd IFFT results
    T = [cmath.exp(2j * cmath.pi * k / N) * odd[k] for k in range(N // 2)]

    # Return combined result
    return [(even[k] + T[k]) / 2 for k in range(N // 2)] + [(even[k] - T[k]) / 2 for k in range(N // 2)]

