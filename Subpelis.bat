REM Este archivo permite eritar de forma masiva videos de extensiones MP4, MKV y AVI para importar subtitulos y multiplexarlos en un nuevo archivo MKV, agregando subtitulos en espanol
@echo off
set mkvmerge="C:\Program Files\MKVToolNix\mkvmerge.exe"
if not exist "mkvmerge_out" (mkdir "mkvmerge_out")
@echo off
REM ES NECESARIO QUE EL SUBTITULO COINCIDA, ES ESTE CASO ESTE SCRIPT SOLO SIRVE PARA ARCHIVOS .SPA.srt, BUSCAR COMO MODIFICAR ESTO, en el apartado (^" ^"%%~nf.srt^" ^"^)
@for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --language 1:eng --track-name 1:English ^"^(^" ^"%%f^" ^"^)^" --language 0:spa --track-name 0:Spanish ^"^(^" ^"%%~nf.spa.srt^" ^"^)^" --language 0:eng --track-name 0:English ^"^(^" ^"%%~nf.eng.srt^" ^"^)^" --track-order 0:0,0:1,1:0,2:0
@for %%f in (*.mp4 *.mkv *.avi) do %mkvmerge% -o "./mkvmerge_out/%%~nf.mkv" --language 0:und --language 1:eng --track-name 1:English ^"^(^" ^"%%f^" ^"^)^" --language 0:es --track-name 0:Spanish ^"^(^" ^"%%~nf.spa.srt^" ^"^)^" --language 0:eng --track-name 0:English ^"^(^" ^"%%~nf.en.srt^" ^"^)^" --track-order 0:0,0:1,1:0,2:0
echo.
echo ============================
echo Done. Press any key to exit.
pause>nul


