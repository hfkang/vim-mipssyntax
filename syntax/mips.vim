" Vim syntax file
" Language: Nios2
" Original Author: Alex Brick <alex@alexrbrick.com>
" Maintainer: Francis Kang
" Last Change: 2016 Oct 23
" Based on Alex Brick's syntax file:
" http://www.vim.org/scripts/script.php?script_id=2045

" Init {{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syntax case match
"}}}

" Basics {{{
syntax match niosComment /#.*/
syntax match niosNumber /\<[-]\?\d\+\>/ " Decimal numbers
syntax match niosNumber /\<-\?0\(x\|X\)[0-9a-fA-F]\+\>/ " Hex numbers
syntax region niosString start=/"/ skip=/\\"/ end=/"/
syntax match niosLabelColon /:/ contained
syntax match niosLabel /\w\+:/ contains=niosLabelColon
"}}}

" Registers {{{
" O32 Calling Convention {{{
syntax match niosRegister "\$zero"
syntax match niosRegister "\$at"
syntax match niosRegister "\$v0"
syntax match niosRegister "\$v1"
syntax match niosRegister "\$a0"
syntax match niosRegister "\$a1"
syntax match niosRegister "\$a2"
syntax match niosRegister "\$a3"
syntax match niosRegister "\$t0"
syntax match niosRegister "\$t1"
syntax match niosRegister "\$t2"
syntax match niosRegister "\$t3"
syntax match niosRegister "\$t4"
syntax match niosRegister "\$t5"
syntax match niosRegister "\$t6"
syntax match niosRegister "\$t7"
syntax match niosRegister "\$s0"
syntax match niosRegister "\$s1"
syntax match niosRegister "\$s2"
syntax match niosRegister "\$s3"
syntax match niosRegister "\$s4"
syntax match niosRegister "\$s5"
syntax match niosRegister "\$s6"
syntax match niosRegister "\$s7"
syntax match niosRegister "\$t8"
syntax match niosRegister "\$t9"
syntax match niosRegister "\$k0"
syntax match niosRegister "\$k1"
syntax match niosRegister "\$gp"
syntax match niosRegister "\$sp"
syntax match niosRegister "\$fp"
syntax match niosRegister "\$ra"
"}}}

" N32 and N64 Calling Convention {{{
syntax match niosRegister "\$a4"
syntax match niosRegister "\$a5"
syntax match niosRegister "\$a6"
syntax match niosRegister "\$a7"
syntax match niosRegister "\$s8"
"}}}
let i = 0
while i < 32
    " This is for the regular registers
    execute 'syntax match niosRegister "\$' . i . '\(\d\+\)\@!"'
    " And this is for the FP registers
    execute 'syntax match niosRegister "\$f' . i . '\(\d\+\)\@!"'
    let i = i + 1
endwhile
"}}}

" Directives {{{
syntax match niosDirective "\.2byte"
syntax match niosDirective "\.4byte"
syntax match niosDirective "\.8byte"
syntax match niosDirective "\.aent"
syntax match niosDirective "\.align"
syntax match niosDirective "\.aascii"
syntax match niosDirective "\.asciiz"
syntax match niosDirective "\.byte"
syntax match niosDirective "\.comm"
syntax match niosDirective "\.cpadd"
syntax match niosDirective "\.cpload"
syntax match niosDirective "\.cplocal"
syntax match niosDirective "\.cprestore"
syntax match niosDirective "\.cpreturn"
syntax match niosDirective "\.cpsetup"
syntax match niosDirective "\.data"
syntax match niosDirective "\.double"
syntax match niosDirective "\.dword"
syntax match niosDirective "\.dynsym"
syntax match niosDirective "\.end"
syntax match niosDirective "\.endr"
syntax match niosDirective "\.ent"
syntax match niosDirective "\.extern"
syntax match niosDirective "\.file"
syntax match niosDirective "\.float"
syntax match niosDirective "\.fmask"
syntax match niosDirective "\.frame"
syntax match niosDirective "\.globl"
syntax match niosDirective "\.gpvalue"
syntax match niosDirective "\.gpword"
syntax match niosDirective "\.half"
syntax match niosDirective "\.kdata"
syntax match niosDirective "\.ktext"
syntax match niosDirective "\.lab"
syntax match niosDirective "\.lcomm"
syntax match niosDirective "\.loc"
syntax match niosDirective "\.mask"
syntax match niosDirective "\.nada"
syntax match niosDirective "\.nop"
syntax match niosDirective "\.option"
syntax match niosDirective "\.origin"
syntax match niosDirective "\.repeat"
syntax match niosDirective "\.rdata"
syntax match niosDirective "\.sdata"
syntax match niosDirective "\.section"
syntax match niosDirective "\.set"
syntax match niosDirective "\.size"
syntax match niosDirective "\.space"
syntax match niosDirective "\.struct"
syntax match niosDirective "\.text"
syntax match niosDirective "\.type"
syntax match niosDirective "\.verstamp"
syntax match niosDirective "\.weakext"
syntax match niosDirective "\.word"
"}}}

" Instruction Sets {{{
" MIPS1 {{{
" Instructions {{{
syntax keyword niosInstruction add addi addiu addu
syntax keyword niosInstruction and andi
syntax keyword niosInstruction bc0f bc0t bc1f bc1t bc2f bc2t bc3f bc3t
syntax keyword niosInstruction beq beqz
syntax keyword niosInstruction bgez bgezal bgtz
syntax keyword niosInstruction blez bltz bltzal
syntax keyword niosInstruction bne bnez
syntax keyword niosInstruction break
syntax keyword niosInstruction c0 c1 c2 c3
syntax keyword niosInstruction cfc0 cfc1 cfc2 cfc3
syntax keyword niosInstruction ctc0 ctc1 ctc2 ctc3
syntax keyword niosInstruction div divu
syntax keyword niosInstruction j jal jalr jalx jr
syntax keyword niosInstruction lb lbu lh lhu lui
syntax keyword niosInstruction lw lwc0 lwc1 lwc2 lwc3 lwl lwr
syntax keyword niosInstruction mfc0 mfc1 mfc2 mfc3 mfhi mflo
syntax keyword niosInstruction mtc0 mtc1 mtc2 mtc3 mthi mtlo
syntax keyword niosInstruction mult multu
syntax keyword niosInstruction neg negu
syntax keyword niosInstruction nor not or ori
syntax keyword niosInstruction rem remu rfe
syntax keyword niosInstruction sb sh
syntax keyword niosInstruction sll sllv slt slti sltiu sltu
syntax keyword niosInstruction sra srav srl srlv
syntax keyword niosInstruction sub subu
syntax keyword niosInstruction sw swc0 swc1 swc2 swc3 swl swr
syntax keyword niosInstruction syscall
syntax keyword niosInstruction tlbp tlbr tlbwi tlbwr
syntax keyword niosInstruction xor xori

syntax match niosInstruction "abs\.d"
syntax match niosInstruction "abs\.s"
syntax match niosInstruction "add\.d"
syntax match niosInstruction "add\.s" 
syntax match niosInstruction "c\.eq\.d"
syntax match niosInstruction "c\.eq\.s"
syntax match niosInstruction "c\.f\.d"
syntax match niosInstruction "c\.f\.s"
syntax match niosInstruction "c\.le\.d"
syntax match niosInstruction "c\.le\.s"
syntax match niosInstruction "c\.lt\.d"
syntax match niosInstruction "c\.lt\.s"
syntax match niosInstruction "c\.nge\.d"
syntax match niosInstruction "c\.nge\.s"
syntax match niosInstruction "c\.ngl\.d"
syntax match niosInstruction "c\.ngle\.d"
syntax match niosInstruction "c\.ngle\.s"
syntax match niosInstruction "c\.ngl\.s"
syntax match niosInstruction "c\.ngt\.d"
syntax match niosInstruction "c\.ngt\.s"
syntax match niosInstruction "c\.ole\.d"
syntax match niosInstruction "c\.ole\.s"
syntax match niosInstruction "c\.olt\.d"
syntax match niosInstruction "c\.olt\.s"
syntax match niosInstruction "c\.seq\.d"
syntax match niosInstruction "c\.seq\.s"
syntax match niosInstruction "c\.sf\.d"
syntax match niosInstruction "c\.sf\.s"
syntax match niosInstruction "c\.ueq\.d"
syntax match niosInstruction "c\.ueq\.s"
syntax match niosInstruction "c\.ule\.d"
syntax match niosInstruction "c\.ule\.s"
syntax match niosInstruction "c\.ult\.d"
syntax match niosInstruction "c\.ult\.s"
syntax match niosInstruction "c\.un\.d"
syntax match niosInstruction "c\.un\.s"
syntax match niosInstruction "cvt\.d\.s"
syntax match niosInstruction "cvt\.d\.w"
syntax match niosInstruction "cvt\.s\.d"
syntax match niosInstruction "cvt\.s\.w"
syntax match niosInstruction "cvt\.w\.d"
syntax match niosInstruction "cvt\.w\.s"
syntax match niosInstruction "div\.d"
syntax match niosInstruction "div\.s"
syntax match niosInstruction "l\.s"
syntax match niosInstruction "mov\.d"
syntax match niosInstruction "mov\.s"
syntax match niosInstruction "mul\.d"
syntax match niosInstruction "mul\.s"
syntax match niosInstruction "neg\.d"
syntax match niosInstruction "neg\.s"
syntax match niosInstruction "s\.s"
syntax match niosInstruction "sub\.d"
syntax match niosInstruction "sub\.s"
"}}}

" Alias {{{
syntax keyword niosAlias b bal
syntax keyword niosAlias ehb
syntax keyword niosAlias nop ssnop
"}}}

" Macros {{{
syntax keyword niosMacro abs
syntax keyword niosMacro bge bgeu bgt bgtu ble bleu blt Highlights bltu
syntax keyword niosMacro cop0 cop1 cop2 cop3
syntax keyword niosMacro la lca ld li
syntax keyword niosMacro move
syntax keyword niosMacro mul mulo mulou
syntax keyword niosMacro rol ror
syntax keyword niosMacro sd seq sge sgeu sgt sgtu
syntax keyword niosMacro sle sleu sne
syntax keyword niosMacro ulh ulhu ulw ush usw

syntax match niosMacro "l\.d"
syntax match niosMacro "li\.d"
syntax match niosMacro "li\.s"
syntax match niosMacro "s\.d"
syntax match niosMacro "trunc\.w\.d"
syntax match niosMacro "trunc\.w\.s"
"}}}
"}}}

" MIPS2 {{{
" Instructions {{{
syntax keyword niosInstruction bc0fl bc0tl bc1fl bc1tl bc2fl bc2tl bc3fl bc3tl
syntax keyword niosInstruction beql beqzl
syntax keyword niosInstruction bgezall bgezl bgtzl
syntax keyword niosInstruction blezl bltzall bltzl
syntax keyword niosInstruction bnel bnezl
syntax keyword niosInstruction flush
syntax keyword niosInstruction invalidate
syntax keyword niosInstruction lcache
syntax keyword niosInstruction ldc1 ldc2 ldc3 ll
syntax keyword niosInstruction sc scache sdc1 sdc2 sdc3
syntax keyword niosInstruction sync
syntax keyword niosInstruction teq teqi
syntax keyword niosInstruction tge tgei tgeiu tgeu
syntax keyword niosInstruction tlt tlti tltiu tltu
syntax keyword niosInstruction tne tnei

syntax match niosInstruction "ceil\.w\.d"
syntax match niosInstruction "ceil\.w\.s"
syntax match niosInstruction "floor\.w\.d"
syntax match niosInstruction "floor\.w\.s"
syntax match niosInstruction "round\.w\.d"
syntax match niosInstruction "round\.w\.s"
syntax match niosInstruction "sqrt\.d"
syntax match niosInstruction "sqrt\.s"
syntax match niosInstruction "sync\.l"
syntax match niosInstruction "sync\.p"
"}}}

" Macros {{{
syntax keyword niosMacro bgel bgeul bgtl bgtul
syntax keyword niosMacro blel bleul bltl bltul
"}}}
"}}}

" MIPS3 {{{
syntax keyword niosInstruction cache
syntax keyword niosInstruction clo clz
syntax keyword niosInstruction dabs dadd daddi daddiu daddu
syntax keyword niosInstruction dctr dctw
syntax keyword niosInstruction ddiv ddivu
syntax keyword niosInstruction deret
syntax keyword niosInstruction di
syntax keyword niosInstruction dla dlca dli
syntax keyword niosInstruction dmfc0 dmfc1 dmfc2 dmfc3
syntax keyword niosInstruction dmtc0 dmtc1 dmtc2 dmtc3
syntax keyword niosInstruction dmul dmulo dmulou dmult dmultu
syntax keyword niosInstruction dneg dnegu
syntax keyword niosInstruction drem dremu
syntax keyword niosInstruction drol dror
syntax keyword niosInstruction dsll dsll32 dsllv
syntax keyword niosInstruction dsra dsra32 dsrav dsrl dsrl32 dsrlv
syntax keyword niosInstruction dsub dsubu
syntax keyword niosInstruction ei
syntax keyword niosInstruction eret
syntax keyword niosInstruction ext
syntax keyword niosInstruction ins
syntax keyword niosInstruction ldl ldr lld lwu
syntax keyword niosInstruction madd maddu
syntax keyword niosInstruction mfhc1 mfhc2
syntax keyword niosInstruction msub msubu
syntax keyword niosInstruction mthc1 mthc2
syntax keyword niosInstruction pause
syntax keyword niosInstruction rdhwr rdpgpr
syntax keyword niosInstruction rorv rotl rotr rotrv
syntax keyword niosInstruction scd
syntax keyword niosInstruction sdbbp sdl sdr
syntax keyword niosInstruction seb
syntax keyword niosInstruction seh
syntax keyword niosInstruction sync_acquire synci sync_release
syntax keyword niosInstruction sync_mb sync_rmb sync_wmb
syntax keyword niosInstruction udi0 udi1 udi2 udi3 udi4 udi5 udi6 udi7 udi8 udi9
syntax keyword niosInstruction udi10 udi11 udi12 udi13 udi14 udi15
syntax keyword niosInstruction uld usd
syntax keyword niosInstruction wait
syntax keyword niosInstruction wrpgpr
syntax keyword niosInstruction wsbh

syntax match niosInstruction "ceil\.l\.d"
syntax match niosInstruction "ceil\.l\.s"
syntax match niosInstruction "cvt\.d\.l"
syntax match niosInstruction "cvt\.l\.d"
syntax match niosInstruction "cvt\.l\.s"
syntax match niosInstruction "cvt\.s\.l"
syntax match niosInstruction "floor\.l\.d"
syntax match niosInstruction "floor\.l\.s"
syntax match niosInstruction "jalr\.hb"
syntax match niosInstruction "jr\.hb"
syntax match niosInstruction "round\.l\.d"
syntax match niosInstruction "round\.l\.s"
syntax match niosInstruction "trunc\.l\.d"
syntax match niosInstruction "trunc\.l\.s"
"}}}

" MIPS4 32 {{{
syntax keyword niosInstruction movf movn movt movz
syntax keyword niosInstruction pref

syntax match niosInstruction "movf\.d"
syntax match niosInstruction "movf\.s"
syntax match niosInstruction "movn\.d"
syntax match niosInstruction "movn\.s"
syntax match niosInstruction "movt\.d"
syntax match niosInstruction "movt\.s"
syntax match niosInstruction "movz\.d"
syntax match niosInstruction "movz\.s"
"}}}

" MIPS4 32R2 {{{
syntax keyword niosInstruction ldxc1
syntax keyword niosInstruction lwxc1
syntax keyword niosInstruction prefx
syntax keyword niosInstruction sdxc1
syntax keyword niosInstruction swxc1

syntax match niosInstruction "madd\.d"
syntax match niosInstruction "madd\.s"
syntax match niosInstruction "msub\.d"
syntax match niosInstruction "msub\.s"
syntax match niosInstruction "nmadd\.d"
syntax match niosInstruction "nmadd\.s"
syntax match niosInstruction "nmsub\.d"
syntax match niosInstruction "nmsub\.s"
syntax match niosInstruction "recip\.d"
syntax match niosInstruction "recip\.s"
syntax match niosInstruction "rsqrt\.d"
syntax match niosInstruction "rsqrt\.s"
"}}}

" MIPS5 32R2 {{{
syntax keyword niosInstruction luxc1
syntax keyword niosInstruction suxc1

syntax match niosInstruction "abs\.ps"
syntax match niosInstruction "add\.ps"
syntax match niosInstruction "alnv\.ps"
syntax match niosInstruction "c\.eq\.ps"
syntax match niosInstruction "c\.f\.ps"
syntax match niosInstruction "c\.le\.ps"
syntax match niosInstruction "c\.lt\.ps"
syntax match niosInstruction "c\.nge\.ps"
syntax match niosInstruction "c\.ngl\.ps"
syntax match niosInstruction "c\.ngle\.ps"
syntax match niosInstruction "c\.ngt\.ps"
syntax match niosInstruction "c\.ole\.ps"
syntax match niosInstruction "c\.olt\.ps"
syntax match niosInstruction "c\.seq\.ps"
syntax match niosInstruction "c\.sf\.ps"
syntax match niosInstruction "c\.ueq\.ps"
syntax match niosInstruction "c\.ule\.ps"
syntax match niosInstruction "c\.ult\.ps"
syntax match niosInstruction "c\.un\.ps"
syntax match niosInstruction "cvt\.ps\.s"
syntax match niosInstruction "cvt\.s\.pl"
syntax match niosInstruction "cvt\.s\.pu"
syntax match niosInstruction "madd\.ps"
syntax match niosInstruction "mov\.ps"
syntax match niosInstruction "movf\.ps"
syntax match niosInstruction "movn\.ps"
syntax match niosInstruction "movt\.ps"
syntax match niosInstruction "movz\.ps"
syntax match niosInstruction "msub\.ps"
syntax match niosInstruction "mul\.ps"
syntax match niosInstruction "neg\.ps"
syntax match niosInstruction "nmadd\.ps"
syntax match niosInstruction "nmsub\.ps"
syntax match niosInstruction "pll\.ps"
syntax match niosInstruction "plu\.ps"
syntax match niosInstruction "pul\.ps"
syntax match niosInstruction "puu\.ps"
syntax match niosInstruction "sub\.ps"
"}}}

" MIPS64 {{{
syntax keyword niosInstruction dclo dclz
"}}}

" MIPS64R2 {{{
" Instructions {{{
syntax keyword niosInstruction dext dextm dextu
syntax keyword niosInstruction dins dinsm dinsu
syntax keyword niosInstruction dror32 drorv drotr32 drotrv
syntax keyword niosInstruction dsbh dshd
"}}}

" Macros {{{
syntax keyword niosMacro drotl drotr
"}}}
"}}}
"}}}

" Pseudo things {{{
" Some compilers and emulators support some
" of the following instructions, directives, etc.

" Pseudo Instructions {{{
syntax keyword niosPseudoInstruction subi subiu
syntax keyword niosPseudoInstruction blti
syntax keyword niosPseudoInstruction clear
"}}}

" Pseudo Directives {{{
syntax match niosPseudoDirective "\.macro"
syntax match niosPseudoDirective "\.end_macro"
syntax match niosPseudoDirective "\.include"
syntax match niosPseudoDirective "\.eqv"
"}}}
"}}}

" Highlights Linking {{{
hi def link niosComment             Comment
hi def link niosNumber              Number
hi def link niosString              String
hi def link niosLabel               Label
hi def link niosRegister            Identifier
hi def link niosDirective           Type
hi def link niosInstruction         Statement
hi def link niosAlias               niosInstruction
hi def link niosMacro               niosInstruction
hi def link niosPseudoInstruction   PreProc
hi def link niosPseudoDirective     PreProc
"}}}

let b:current_syntax = "nios"
" vim:ft=vim:fdm=marker:ff=unix:foldopen=all:foldclose=all:colorcolumn=80
