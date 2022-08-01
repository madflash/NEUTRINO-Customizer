@echo off

@rem -----for NEUTRINO Customizer START-----
set DEFAULT_NAME_SCORE=score
set DEFAULT_NAME_VC=MERROW
set NAME_OUTPUT=

if "%1"=="" (
  echo  Notfound params.
  set NAME_SCORE=%DEFAULT_NAME_SCORE%
  set NAME_VC=%DEFAULT_NAME_VC%
  set NAME_OUTPUT=%DEFAULT_NAME_SCORE%
) else (
  set NAME_SCORE=%1
  set NAME_VC=%2
  set NAME_OUTPUT=%3
)
@rem -----for NEUTRINO Customizer END-----

setlocal enabledelayedexpansion
cd /d %~dp0

: Project settings
@rem Override by NEUTRINO CUSTOMIZER
set BASENAME=%NAME_SCORE%
set NumThreads=4

: musicXML_to_label.exe
set SUFFIX=musicxml

: NEUTRINO.exe
@rem Override by NEUTRINO CUSTOMIZER
set ModelDir=%NAME_VC%
set StyleShift=0

: WORLD.exe
set PitchShift=1.0
set FormantShift=1.0

: WORLD(beta version option)
set SmoothPitch=0.0
set SmoothFormant=0.0
set EnhanceBreathiness=0.0

: NSF.exe
set UseGpu=false
set GpuId=0

if /i %UseGPU%==true (
    set GpuFlag= -g -i %GpuId%
) else (
    set GpuFlag=
)

@rem -----Override output filenames by NEUTRINO Cunstomizer-----

echo %date% %time% : start MusicXMLtoLabel
bin\musicXMLtoLabel.exe score\musicxml\%BASENAME%.%SUFFIX% score\label\full\%BASENAME%.lab score\label\mono\%BASENAME%.lab

echo %date% %time% : start NEUTRINO
bin\NEUTRINO.exe score\label\full\%BASENAME%.lab score\label\timing\%BASENAME%.lab output\%BASENAME%.f0 output\%BASENAME%.mgc output\%BASENAME%.bap model\%ModelDir%\ -n %NumThreads% -k %StyleShift% -m -t

echo %date% %time% : start WORLD
bin\WORLD.exe output\%BASENAME%.f0 output\%BASENAME%.mgc output\%BASENAME%.bap -f %PitchShift% -m %FormantShift% -p %SmoothPitch% -c %SmoothFormant% -b %EnhanceBreathiness% -o output\%NAME_OUTPUT%_syn.wav -n %NumThreads% -t

echo %date% %time% : start NSF
bin\NSF.exe score\label\full\%BASENAME%.lab score\label\timing\%BASENAME%.lab output\%BASENAME%.f0 output\%BASENAME%.mgc output\%BASENAME%.bap .\model\%ModelDir%\model_nsf.bin output\%NAME_OUTPUT%_nsf.wav -n %NumThreads% %GpuFlag% -t

echo %date% %time% : end

if not %errorlevel%==""(
  echo %errorlevel%
)

PAUSE
EXIT
