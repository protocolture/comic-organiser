#Set the sort directory to be a Folder full of Directories named after comic characters.
$SortDirectory = "Y:\Comics\Sorted"
#Set this to look at your unsorted comics directory. Place all of those MARVEL Week 023 folders in this directory.
#$DumpDirectory = "Y:\Comics\tO bE sORTED\"
$DumpDirectory = "Y:\Complete"

# Get a list of all the directories in the  Sorted folder
$Folders = Get-ChildItem  -Path "$SortDirectory" -Directory -recurse | Select -ExpandProperty FullName

#For each Directory, search for comic book titles that matches, and move them there.
 ForEach($item in $Folders)
    {
        
            $temp = split-path $item -Leaf

          if ($temp.Contains("-"))
          {
                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbr -include *$temp* -recurse  | Move-Item -Destination $item -Force 
                
                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbz -include *$temp* -recurse  | Move-Item -Destination $item -Force 
                
                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.pdf -include *$temp* -recurse  | Move-Item -Destination $item -Force
        
                    $temp2 = $temp.Replace("-"," ")

                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbr -include *$temp2* -recurse  | Move-Item -Destination $item -Force 
                
                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbz -include *$temp2* -recurse  | Move-Item -Destination $item -Force 
                
                    Get-ChildItem -Path "$DumpDirectory" -File -filter *.pdf -include *$temp2* -recurse  | Move-Item -Destination $item -Force
      
        
          }
          else
          {
                  Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbz -include *$temp* -recurse | Move-Item -Destination $item -Force 
              
                  Get-ChildItem -Path "$DumpDirectory" -File -filter *.cbr -include *$temp* -recurse | Move-Item -Destination $item -Force
              
                  Get-ChildItem -Path "$DumpDirectory" -File -filter *.pdf -include *$temp* -recurse | Move-Item -Destination $item -Force
          }

    }
  
