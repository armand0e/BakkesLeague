import os
import sys
import subprocess

path = input("Please input your Rocket League path (default: C:\Program Files\Epic Games\rocketleague): ")
os.system(f'copy "files\bmrl.vbs" "{path}\Binaries\Win64\bmrl.vbs"')
os.system(f'copy "files\steam\bmrl.bat" "{path}\Binaries\Win64\bmrl.bat"')