@echo off
for %%I in (.) do set CurrDirName=%%~nxI
::If the localization file is named incorrectly, it will error.
IF NOT EXIST "Localization.txt" goto errorfile
::If the file is not in the right location, it will error. Be sure to have your file in the correct location or change your localization path.
IF NOT EXIST "..\..\data\config\Localization.txt" goto errorlocation
IF EXIST "Localization.txt" goto fileconfirmed
:fileconfirmed
IF EXIST "..\..\data\config\Localization.txt" goto confirmed
:errorlocation                                                                                                                                                                                                        
color 0C
echo [![Error Detected]!]
echo.
echo.
echo It looks like you are trying to run the batch script from a different location. Make sure this mod in the correct location.
echo.
goto end
:errorfile                                                                                                                                                                                                      
color 0C
echo [![Error Detected]!]
echo.
echo.
echo You are missing the following files:
echo.
IF NOT EXIST "Localization.txt" echo Localization.txt
echo.
echo Make sure you have these files in the same place you are running this script.
echo Also make sure you haven't renamed them either.
echo.
goto end
:confirmed
color 0F 
echo More Vanilla Food Modlet
echo Please ensure this file runs correctly before closing. It is very important to run. Otherwise
echo All Food assets will not have descriptions
echo.  
pause
:install
IF EXIST "Localization.txt" copy "..\..\data\config\Localization.txt" "..\..\data\config\Localization.txt.bak"
copy "..\..\data\config\Localization.txt" LocalizationTEMP.txt
del "..\..\data\config\Localization.txt"
::PUT the common name of all your keys in "". For example, "rdm". Space is the delimiter.
FINDSTR /v "AT" LocalizationTEMP.txt > "../../data/config/Localization.txt"
type localization.txt >> "../../data/config/Localization.txt"
del "LocalizationTEMP.txt"
echo Finished, all descriptions have been loaded
goto end
:end
pause

