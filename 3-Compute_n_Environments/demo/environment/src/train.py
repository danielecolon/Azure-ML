import os
import time
import platform
import mlflow

print("Hello from Azure ML environment demo")
print(f"Python version: {platform.python_version()}")
print(f"Working dir: {os.getcwd()}")

mlflow.log_param("demo", "environment")
mlflow.log_param("purpose", "show environment reuse")

for i in range(3):
    print(f"Step {i+1}/3")
    time.sleep(5)

print("Done")