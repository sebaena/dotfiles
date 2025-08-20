# fft_test.py
from fft_module import compute_fft, compute_ifft
import math

# Generate a simple signal (e.g., a sine wave)
sampling_rate = 1000  # Hz
duration = 1  # second
frequency = 50  # Hz

# Generate time values and corresponding signal
t = [i / sampling_rate for i in range(int(sampling_rate * duration))]
signal = [math.sin(2 * math.pi * frequency * ti) for ti in t]

# Compute the FFT of the signal
fft_result = compute_fft(signal)

# Compute the IFFT of the FFT result (should give the original signal)
ifft_result = compute_ifft(fft_result)

# Display the results
print("Original Signal (first 10 samples):")
print(signal[:10])

print("\nFFT Result (first 10 samples of magnitude):")
print([abs(x) for x in fft_result[:10]])

print("\nReconstructed Signal from IFFT (first 10 samples):")
print(ifft_result[:10])

# Optional: Show the reconstructed signal and compare with the original
# The IFFT result should closely match the original signal

