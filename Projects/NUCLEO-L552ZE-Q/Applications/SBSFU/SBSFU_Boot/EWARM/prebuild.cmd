iccarm.exe --cpu=Cortex-M33 -DBL2 -DMCUBOOT_IMAGE_NUMBER=2 -I%1\..\..\Linker  %1\stm32l552xx_bl2.icf  --silent --preprocess=ns %1\bl2.icf.i 2>&1