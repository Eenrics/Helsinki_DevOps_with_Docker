import signal
import time

def signal_handler(signum, frame):
    print(f"Received signal {signum}")

signal.signal(signal.SIGTERM, signal_handler)
signal.signal(signal.SIGKILL, signal_handler) # This will raise an error

while True:
    print("Running...")
    time.sleep(1)