# Bakkesleague
Open and close Bakkesmod with RocketLeague!

USAGE:

Automatically makes BakkesMod open and close with the opening and closing of Rocket League 

___________________________________________________________________________________________

INSTALLATION:

*Steam only* (Epic games rocket league not supported)

    - Run setup.exe

    - Open the steam launcher

    - Navigate to Rocket League in your library

    - Click the settings icon and navigate to properties

    - Scroll to the bottom and paste the following line into launch parameters:

    bmrl.vbs %COMMAND%

____________________________________________________________________________________________

FAQ/Troubleshooting:

1."The system cannot find the path specified"

    - Open Steam and navigate to Rocket League

    - Click on the settings icon and select Manage > Browse local files

    - Navigate to Binaries\Win64\ and copy the folder's path to your clipboard

    - Head back to the bakkesleague folder you downloaded and right click on "setup.bat"

    - On windows 11 and up, select "Show more options"

    - Select "Edit"

    - Change the path "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\" to the path you just copied. (IMPORTANT!! Don't forget to leave "bmrl.vbs" and "bmrl.bat" at the end of the new path you pasted in) (they should be on two separate lines, formatted similarly to the original file)

    - Save and close

    - Navigate to the files folder

    - Right click on "bmrl.bat"

    - On windows 11 and up, select "Show more options"

    - Select "Edit"

    - Change the path "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" to the path you copied earlier. (IMPORTANT!! Don't forget to leave "rocketleague.exe" at the end of the new path you pasted in)

2.BakkesMod isn't launching

    - Navigate to the files folder

    - Right click on "bmrl.bat"

    - On windows 11 and up, select "Show more options"

    - Select "Edit"

    - Change the path "C:\Program Files\BakkesMod\BakkesMod.exe" to the actual path to your local BakkesMod.exe file 
