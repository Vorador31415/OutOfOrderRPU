# OutOfOrderRPU
- eine High-IPC CPU mit eigener Instructionset extra für FPGAs 

# Anforderungen
- 4way SMT
- SuperScalar
- OutOfOrder: RenamingBuffer und ReOrderBuffer
- ohne Extra-DecoderStufe, da RISC-Design
- InteruptTable frei im Speicher belegbar
- Call-Stack frei belegbar
- Prozess-Configurations-Tabelle frei im Speicher belegbar
- jede Stage mit eigener Clockdomain 
