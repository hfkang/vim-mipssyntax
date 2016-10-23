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
syntax match niosRegister "\(\s\|,\|(\)\zsra"
syntax match niosRegister "\(\s\|,\|(\)\zszero"
syntax match niosRegister "\(\s\|,\|(\)\zsat"
syntax match niosRegister "\(\s\|,\|(\)\zset"
syntax match niosRegister "\(\s\|,\|(\)\zsbt"
syntax match niosRegister "\(\s\|,\|(\)\zsgp"
syntax match niosRegister "\(\s\|,\|(\)\zssp"
syntax match niosRegister "\(\s\|,\|(\)\zsfp"
syntax match niosRegister "\(\s\|,\|(\)\zsea"
syntax match niosRegister "\(\s\|,\|(\)\zsba"
"}}}

let i = 0
while i < 32
    " This is for the regular registers
    execute 'syntax match niosRegister "\(\s\|,\|(\)\zsr' . i . '"'
    " And this is for the FP registers
    execute 'syntax match niosRegister "\$f' . i . '\(\d\+\)\@!"'
    let i = i + 1
endwhile
"}}}

" Directives {{{

syntax match niosDirective "\.abort"
syntax match niosDirective "\.ABORT"
syntax match niosDirective "\.align"
syntax match niosDirective "\.altmacro"
syntax match niosDirective "\.ascii"
syntax match niosDirective "\.asciz"
syntax match niosDirective "\.balign"
syntax match niosDirective "\.bundle_align_mode"
syntax match niosDirective "\.byte"
syntax match niosDirective "\.cfi_startproc"
syntax match niosDirective "\.cfi_endproc"
syntax match niosDirective "\.comm"
syntax match niosDirective "\.data"
syntax match niosDirective "\.def"
syntax match niosDirective "\.desc"
syntax match niosDirective "\.dim"
syntax match niosDirective "\.double"
syntax match niosDirective "\.eject"
syntax match niosDirective "\.else"
syntax match niosDirective "\.elseif"
syntax match niosDirective "\.end"
syntax match niosDirective "\.endef"
syntax match niosDirective "\.endfunc"
syntax match niosDirective "\.endif"
syntax match niosDirective "\.equ"
syntax match niosDirective "\.equiv"
syntax match niosDirective "\.eqv"
syntax match niosDirective "\.err"
syntax match niosDirective "\.error"
syntax match niosDirective "\.exitm"
syntax match niosDirective "\.extern"
syntax match niosDirective "\.fail"
syntax match niosDirective "\.file"
syntax match niosDirective "\.fill"
syntax match niosDirective "\.float"
syntax match niosDirective "\.func"
syntax match niosDirective "\.global"
syntax match niosDirective "\.globl"
syntax match niosDirective "\.gnu_attribute"
syntax match niosDirective "\.hidden"
syntax match niosDirective "\.hword"
syntax match niosDirective "\.ident"
syntax match niosDirective "\.if"
syntax match niosDirective "\.incbin"
syntax match niosDirective "\.include"
syntax match niosDirective "\.int"
syntax match niosDirective "\.internal"
syntax match niosDirective "\.irp"
syntax match niosDirective "\.irpc"
syntax match niosDirective "\.lcomm"
syntax match niosDirective "\.lflags"
syntax match niosDirective "\.line"
syntax match niosDirective "\.linkonce"
syntax match niosDirective "\.list"
syntax match niosDirective "\.ln"
syntax match niosDirective "\.loc"
syntax match niosDirective "\.loc_mark_labels"
syntax match niosDirective "\.local"
syntax match niosDirective "\.long"
syntax match niosDirective "\.macro"
syntax match niosDirective "\.mri"
syntax match niosDirective "\.noaltmacro"
syntax match niosDirective "\.nolist"
syntax match niosDirective "\.octa"
syntax match niosDirective "\.offset"
syntax match niosDirective "\.org"
syntax match niosDirective "\.p2align"
syntax match niosDirective "\.popsection"
syntax match niosDirective "\.previous"
syntax match niosDirective "\.print"
syntax match niosDirective "\.protected"
syntax match niosDirective "\.psize"
syntax match niosDirective "\.purgem"
syntax match niosDirective "\.pushsection"
syntax match niosDirective "\.quad"
syntax match niosDirective "\.reloc"
syntax match niosDirective "\.rept"
syntax match niosDirective "\.sbttl"
syntax match niosDirective "\.scl"
syntax match niosDirective "\.section"
syntax match niosDirective "\.set"
syntax match niosDirective "\.short"
syntax match niosDirective "\.single"
syntax match niosDirective "\.size"
syntax match niosDirective "\.skip"
syntax match niosDirective "\.sleb128"
syntax match niosDirective "\.space"
syntax match niosDirective "\.stabd"
syntax match niosDirective "\.stabn"
syntax match niosDirective "\.stabs"
syntax match niosDirective "\.string"
syntax match niosDirective "\.string8"
syntax match niosDirective "\.string16"
syntax match niosDirective "\.string32"
syntax match niosDirective "\.string64"
syntax match niosDirective "\.struct"
syntax match niosDirective "\.subsection"
syntax match niosDirective "\.symver"
syntax match niosDirective "\.tag"
syntax match niosDirective "\.text"
syntax match niosDirective "\.title"
syntax match niosDirective "\.type"
syntax match niosDirective "\.uleb128"
syntax match niosDirective "\.val"
syntax match niosDirective "\.version"
syntax match niosDirective "\.vtable_entry"
syntax match niosDirective "\.vtable_inherit"
syntax match niosDirective "\.warning"
syntax match niosDirective "\.weak"
syntax match niosDirective "\.weakref"
syntax match niosDirective "\.word"
syntax match niosDirective "\.zero"
"}}}

" Instruction Sets {{{
" Nios2 {{{
" Instructions {{{
syntax keyword niosInstruction add addi sub subi mul muli mulxss mulxsu div divu
syntax keyword niosInstruction and andi or orhi ori xor xorhi xori nor
syntax keyword niosInstruction rol roli ror
syntax keyword niosInstruction sll slli sra srai srl srli

syntax keyword niosInstruction beq bne br
syntax keyword niosInstruction bge bgeu bgt bgtu ble bleu blt bltu 
syntax keyword niosInstruction ldb ldbio ldbu ldbuio ldh ldhio ldhu ldhuio ldwio ldw 
syntax keyword niosInstruction stb stbio sth sthio stw stwio 
syntax keyword niosInsturction mov movhi movi movuii

syntax keyword niosInstruction cmpeq cmpeqi cmpge cmpgei cmpgeu cmpgeui cmpgt
syntax keyword niosInstruction cmpgti cmpgtu cmpgtui cmple cmplei cmpleu cmpleui
syntax keyword niosInstruction cmplt cmplti cmpltu cmpltui cmpne cmpnei

syntax keyword niosInstruction jmp flushi trap inti flushp wrprs flushda
syntax keyword niosInstruction bret call callr eret rdctl wrctl break 
"}}}

" Pseudo things {{{
" Some compilers and emulators support some
" of the following instructions, directives, etc.

" Pseudo Instructions {{{
syntax keyword niosMacro movia nop
"}}}

" Pseudo Directives {{{
syntax match niosPseudoDirective "\.macro"
syntax match niosPseudoDirective "\.end_macro"
syntax match niosPseudoDirective "\.include"
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
