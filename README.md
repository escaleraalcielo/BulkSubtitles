# BulkSubtitles
Repository with information about adding subtitles to a video using MKVTOOLNIX
## Dependencies
- [MKVToolNix](https://www.fosshub.com/MKVToolNix.html)

## Usage
0. Download MKVToolNix.
1. Edit the bat file for desired config (view the How to configurate the bat file section)
2. Move the .bat file to the folder desired to be converted.
3. Execute .bat and wait.
4. The converted files can be found on the `mkvmerge_out` folder


## Contact
I'm Daniel Martinez and live in Mexico, I'm an mechatronical engineer, you can found me on fi.danielmartinez@gmail.com

## How to configurate the bat file?
0. Download MKVToolNix.
1. Open `mkvtoolnix-gui.exe`.
2. Add any of the MKV files to be processed (drag-and-drop works just fine).
3. Perform your changes within the GUI (disable tracks, rename tracks, set default tracks, etc.).
4. Go to `Menu Bar > Multiplexer > Show command line`, and select the escaper arguments for Windows CMD, for example I had the next arguments
`"C:/Program Files/MKVToolNix\mkvmerge.exe" --ui-language en --output ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA ^(1^).mkv^" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.mkv^" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`
  What I need to do: 1) Select default audio track as english, 2) Label track as english, 3) Select default subtitle, as spanish, 4) Label track subtitle as spanish
  
5.Now, open notepad, paste the command and delete everything before `--output` 
Replace `--output` with `-o`
Replace video destination with this `"./mkvmerge_out/%%~nf.mkv"`

Example
Before:
`"C:/Program Files/MKVToolNix\mkvmerge.exe" --ui-language en --output ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA ^(1^).mkv^" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.mkv^" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

After:
`o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.mkv^" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

6. Now replace video origin from the previous output with `%%f` 

Example:
Before
`o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.mkv^" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

After:
`o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

7. Now replace the subtitle origin from the previous output with `%%~nf.srt`
WARNING: THIS COMMAND IS NOT PERFECT AS ONLY WORKS FOR ONE SUBTITLE EXTENSION AT TIME.
For use with your subtitles you must do the next.
    something.srt - `%%~nf.srt`
    something.es.srt - `%%~nf.es.srt`
    something.spa.srt - `%%~nf.spa.srt`
I'm still working on some worarround for this problem

Example: for use with .spa.srt subtitles
Before
`o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"E:\Videos\Series\Modern Family\Season 9\Modern Family - S09E01 - Lake Life.SDTV.SVA.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

After:
`o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"%%~nf.spa.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

The finnal command line should look like this `o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"%%~nf.spa.srt^" ^"^)^" --track-order 0:0,0:1,1:0`

8. Preparing the batch file
On another notepad you must enter this code, replacing the route of your MKVTOOLNIX installation:
  `@echo off
  set mkvmerge="C:\Program Files\MKVToolNix\mkvmerge.exe"
  if not exist "mkvmerge_out" (mkdir "mkvmerge_out")
  @echo off
  @for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o `YOUR FINNAL COMMAND LINE
  `echo.
  echo ============================
  echo Done. Press any key to exit.
  pause>nul`
  
  Example:
  `@echo off
  set mkvmerge="C:\Program Files\MKVToolNix\mkvmerge.exe"
  if not exist "mkvmerge_out" (mkdir "mkvmerge_out")
  @echo off
  @for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --default-track 0:yes --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f" ^"^)^" --language 0:spa --track-name 0:Spanish --default-track 0:yes ^"^(^" ^"%%~nf.spa.srt^" ^"^)^" --track-order 0:0,0:1,1:0`
  
9. Save the file as .bat, and copy it to your desired video folder.
10. Workarround for the different subtitles extensions
If the subtitle extension is not found the script don't execute, so, I ran the file with different settings for the different subtitles.
You can see the bat file in `SubsSpanish` in this repository
So, my bat file is 
`@for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f^" ^"^)^" --language 0:spa --track-name ^"0:Espanol^" --default-track 0:yes ^"^`(^" ^"%%~nf.srt^" ^"^)^" `--track-order 0:0,0:1,1:0`
`@for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f^" ^"^)^" --language 0:spa --track-name ^"0:Espanol^" --default-track 0:yes ^"^`(^" ^"%%~nf.spa.srt^" ^"^)^" `--track-order 0:0,0:1,1:0`
`@for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --language 1:eng --track-name 1:English --default-track 1:yes ^"^(^" ^"%%f^" ^"^)^" --language 0:spa --track-name ^"0:Espanol^" --default-track 0:yes` ^"^(^" ^"%%~nf.es.srt^" ^"^)^" `--track-order 0:0,0:1,1:0`



## Based on
Serede work https://github.com/Serede/mkvtoolnix-batch  
Random stackoverflow question https://stackoverflow.com/questions/17312480/remux-contents-of-multiple-files-to-mkv-using-batch  Random videohelp question 
https://forum.videohelp.com/threads/383442-remux-all-files-to-mkv

## License
Code licensed under GNU General Public License v3.0.
