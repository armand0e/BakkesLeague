import os
import sys
import subprocess

path = input("Please input your Rocket League path (e.g. C:\Program Files (x86)\Steam\steamapps\common\rocketleague): ")
os.system(f'copy "files\bmrl.vbs" "{path}\Binaries\Win64\bmrl.vbs"')
os.system(f'copy "files\epic\bmrl.bat" "{path}\Binaries\Win64\bmrl.bat"')