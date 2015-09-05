﻿#Set the sort directory to be a Folder full of Directories named after comic characters.
$SortDirectory = "Y:\Comics\Sorted"
#Set this to look at your unsorted comics directory. Place all of those MARVEL Week 023 folders in this directory.
$DumpDirectory = "Y:\Comics\tO bE sORTED\"

#      __                                                      
#     /  l                                                     
#   .'   :               __.....__..._  ____                   
#  /  /   \          _.-"        "-.  ""    "-.                
# (`-: .---:    .--.'          _....J.         "-.             
#  """y     \,.'    \  __..--""       `+""--.     `.           
#    :     .'/    .-"""-. _.            `.   "-.    `._.._     
#    ;  _.'.'  .-j       `.               \     "-.   "-._`.   
#    :    / .-" :          \  `-.          `-      "-.      \  
#     ;  /.'    ;          :;               ."        \      `,
#     :_:/      ::\        ;:     (        /   .-"   .')      ;
#       ;-"      ; "-.    /  ;           .^. .'    .' /    .-" 
#      /     .-  :    `. '.  : .- / __.-j.'.'   .-"  /.---'    
#     /  /      `,\.  .'   "":'  /-"   .'       \__.'          
#    :  :         ,\""       ; .'    .'      .-""              
#   _J  ;         ; `.      /.'    _/    \.-"                  
#  /  "-:        /"--.b-..-'     .'       ;                    
# /     /  ""-..'            .--'.-'/  ,  :                    
#:`.   :     / :             `-i" ,',_:  _ \                   
#:  \  '._  :__;             .'.-"; ; ; j `.l                  
# \  \          "-._         `"  :_/ :_/                       
#  `.;\             "-._                                       
#    :_"-._             "-.                                    
#      `.  l "-.     )     `.                                  
#        ""^--""^-. :        \                                 
#                  ";         \                                
#                  :           `._                             
#                  ; /    \ `._   ""---.                       
#                 / /   _      `.--.__.'                       
#                : :   / ;  :".  \                             
#                ; ;  :  :  ;  `. `.                           
#               /  ;  :   ; :    `. `.                         
#              /  /:  ;   :  ;     "-'                         
#             :_.' ;  ;    ; :                                 
#                 /  /     :_l                                 
#                 `-' 

# Get a list of all the directories in the  Sorted folder
$Folders = Get-ChildItem  -Path "$SortDirectory" -Directory | Select -ExpandProperty FullName

#For each Directory, search for comic book titles that matches, and move them there.
 ForEach($item in $Folders)
    {

      $temp = split-path $item -Leaf
    
      $result =  Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbr -include *$temp* -recurse | Move-Item -Destination $item -Force
      $result
    }
  
#                                             _,_         xP
#                    xM                  ,dMMMMMx      4M,
#                    MM                dMMMMMMMMMM,  ,n, MMMMMmn,.
#           ,mnmMMnmnJMMnmn,,         MMMMMMCMMMMMMUMMMMMMMMMMMMMM
#`;       JP""   ,nmnmnmn,."MMMMMbn,  MMMMM4MMMMMMMLMMMMFdMM4MMM"   .,,,.
# !>            "TTMMMM)MMMn,JMMMMMMM4TMMMMr"MMMMMMMLMMFdMMn"LTM  nMMMMMMn,_
#!;!!!;;>-nnP"",,<>, "MMxCM=M)MMMMMMMMMb73ML(TTMMMMMMMM(MMMMbLCCCnMMMMMMMMMMM
#!!!!!'<-;;;;!!!!!!!!, "TT=MMMMMMP4MMMMMMMb9MMM/TTTMMMMMCMMMMMTMMMMMMMMM>   "
#!',,`;!!!!!!!!!!!!!!!(!!!>'MM4M)Mx"MMMMMMMMbTMMMMM;MMMMbTTMMMbx"MMMMMMnL
#!!!!!`'>`)!!'>!!!!!!!!!!!!;,. 4MMMb"MMMMMMMMMCTMMMMn)"MMMMb(9MML;4MMMMMM'x -
#!!!!> :!'`(!!!!!!!!!!!!!!)!!> ;M)MMM)MMMMMMMMMMCMMMMMb)?4MMMbTMMM;4MMMMM,)>
#!!!!' '`>!(,!!!!!!!!!!!!>,!!',MMCMMMMbhmn)MMMMMM?MMMMMMMr4MMM)MMMM4MMMMM,M\
#!!!!!,.'' ' ;>;!!!!!!!!<!/`> "TMMMMMMMMMM:MMMMMMMMMMMMMP;MMMMCMMP;MMMMMM' )<
#>;;<!!>;  .-/`,!!!!!!!! -  !!>,  `"MMM)MM4n:("MMLMMMMf;d;MMMM(;nMMMMbMM, ``!
#!!!!!!!!> ,;' /!!!!!!!!>;,`!!!!!' ==4MMMMMMMP:MMMCPM:nMP;MMML(MMMMM,(TMbmn,,
#!!!!!<->```  ' !<(!!>!<`!''!!!!!!>;- "T4MT4C:MMMMMMM4MM'MMMMMM/MMb"M'LJ3MMP"
#;;,!(,;>/>`  <! (>``!!!!!!<'',,,<<<<>>>>,,,,,."""TMnMMC;MMMMMC>4TM,mCTTM") '
# ''`> ,,,<!'' <!!` ,<'!;!!  `<CCCCCCCCCCCCCCCCCC>`P',,`JPMMMMMP ,"MMMMbL'" !
#;,, `` `);,;!!!` ;!`;<,!>' ,>,,<<<<<<CCCCCCCCCCC',<C>> M' )P'J , MMMTP" :/`
#    " \,!;<!>--'`<<!!!     .,,,xxxxxxxxx,,,,. `` ``'''-"< ",=' " TTTMLx   '!
#!-  ;'  ->--->-(,>(`  ,  $$$???"""???$$$$$$$$$$$$$hc,.  ``<\       ""  '  ``
# ;<!!!!!!'! <'``,;;!''  $$F',c$$$$$c,_""???$$$F)$$$$$$$$$$$c ,>   ` `!!\>;';
#'`!!'';>''!!!!!!;>!''' $$$$P?$$$?????""?$$$$$$$$$$$$F".,,.   `!,  `  ! ' ;!'
#-` ;>   !!'``;!\;!` , `$$$$$c   cc     "$c`$$$$$P,c$$$$$$$$h c,` , ! !! '<
#     -` ;!!!!` ' >  z$$$?$$$$$h,"?c, -=)z$$$$$$Fj??""    `$F $F  ";!> !;
#-'  !  !! >` ;  ,'  """,J$$$$$$$$cccc$$$$$$$$$$.$c,=   ,z  , "  ,<!',<!('
# ';/  ,! ' ';  `<- -$$$$?????$$$$$$$$$$$$$$$$$$(?$$c,,,,cc$" ,/'`)!!<(-\<>,
#/'  !' !>  ,'' !!!>,,,,,<'  z$$$$$$$$$$$$$$hc$$h`$$$$$$$$$$   ;' .'' :.>'' `
# :>   ,!,  !!`>!!> `'`` ,zc$$$$$$$$$$$$L"?"$$$$$ $$$$$$$$$'   ;!-  ,    >'
#   , ' `' -''''' : `$$$$$$$$$$$$$$$$$$$$hd$$$$zcd$$$$$$$$',  ` ;!  ,-`` ,
#``     _,,,,;;;<!!` ?$$$$$$$$$$$$$$$$???"????$$$$$$$$$$P'`' `> '  <'  ,
#,,;<!!!!!!!!!!!!!'   $$$$$$$$$$$$$F" c<CC>cc,, `$$$$$P'  >,        ,,,,;;,,,
#!!!''>'';!!!!!!!!  "c "$$$$$$$$$$$>'.       `' ,$$$$"  . `)''!,  `````  ',,
#,;;`!!!!!(!! `!'',  `?, ?$$$$$$$$$ <C>cccc,,, ,$$$P'<;    !  !         <; `!
#'!!!!!>(!!!`(;>`.$h,. "c,`?$$$$$$$h,``''''""',$$$"  !><!;,  >  '`,> !   !! !
#- '`!!!!(:<!!',J:$$$h, `?c,"?$$$$$$$$$$$$$$$$$$"    >,,!!!;,   ,!' ;,;,<!')!
#;;;;!!!!!!!',c$F;$$$$$h, "?c,`"?$$$$$$$$$$$$$P' z   !!!'!!!(<>,      -- ''``
#!!!!!!!!!',$$$$c$$$$$$$$h, `"h,   "??$$$$$$FF       !!!!;('''!!!!!>;,,_  `!(
#)!)!!!!> `?$$$$$$$$$$$$$$$h, `$hc,         r    d  <!!!!!!,,;!<>>!!!'' ,,;;!
#!!!!!!'    `?$$$$$$$$$$$$$$$  $$$$$hc- ,zdF   zF,  !!!!!!!!!:!!!>'',,<!!!!!!
#!!!!'        `?$$$$$$$$$$$$$  $$$$$F' d$$"   -Lc$  !!!!!!!!!!>' ,<(!!'!'!!!'
#!!! ,d$c       $$$$$$$$$$$$$  $$$P' ,$$$"    J$$$  !!()!!!>' ,<!>`` ,;,;!!`;
#!' d$$$$$,   ,$$$$$$$$$$$$$$  $P' z$$$$$   zP"L,   !!!!!(' -<!!!!:!!!!!!!!'
#',$$$$$$$$$c$$$$$$$$$$$$$$$$    d$$$$$$$hcP""'     !!!!!!>>, .``'<<!!!!>' <'
#c$$$$$$$$$$$$$$$$$$$$$$$$$$$.,c$$$$$$$$$$$         !!!!!!('`'!!!>,  ,!' ;,;!
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$bcd$$$$$h !!!!!!;  !!!' ;'' ,!!!!!