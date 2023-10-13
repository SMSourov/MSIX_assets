# Get the input parameter
$image = $args[0]

$fileName = $null

# Check if the given input is a file.
if ($null -ne (Test-Path -LiteralPath $image -PathType Leaf -ErrorAction SilentlyContinue)) {
    # Get the name of the file
    $fileName = Split-Path -Path $image -Leaf
    # Check if the file has a .png extension and exists in the current directory
    if (Test-Path -LiteralPath $fileName) {
        Write-Host "The input file name is `"$fileName`""
        # Remove the extension
        $fileNameWithoutExtension = Split-Path -LeafBase $fileName
        Write-Host "This is a script to generate the asset files for the MSIX packaging system."
        Write-Host "This generates better quality images than the MSIX packaging tool."

        Write-Host "Checking Image Magick(magick) is in the path or not."

        if ($null -ne (Get-Command magick -ErrorAction SilentlyContinue)) {
            Write-Host "The Image Magick(magick) was found in your Environment Variables"
            $scales = ("100", "125", "150", "200", "400")


            Write-Output "Generating the Store files"
            # roof of 75% of target width
            $targetResolutions = ("50x50", "63x63", "75x75", "100x100", "200x200")
            $resizedImage = ("38x38", "48x48", "57x57", "75x75", "150x150")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "StoreLogo.scale-$($scales[$i]).png"
            }

            Write-Output "Generating the 150x150 files"
            # roof of 50% of target width
            $targetResolutions = ("150x150", "188x188", "225x225", "300x300", "600x600")
            $resizedImage = ("75x75", "94x94", "113x113", "150x150", "300x300")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square150x150Logo.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the 310x310 files"
            # roof of 50% of target width
            $targetResolutions = ("310x310", "388x388", "465x465", "620x620", "1240x1240")
            $resizedImage = ("155x155", "194x194", "233x233", "310x310", "620x620")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square310x310Logo.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the 44x44 files"
            # roof of 75% of target width
            $targetResolutions = ("44x44", "55x55", "66x66", "88x88", "176x176")
            $resizedImage = ("33x33", "42x42", "50x50", "66x66", "132x132")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square44x44Logo.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the 71x71 files"
            # roof of 50% of target width
            $targetResolutions = ("71x71", "89x89", "107x107", "142x142", "284x284")
            $resizedImage = ("36x36", "45x45", "54x54", "71x71", "142x142")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square71x71Logo.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the 310x150 files"
            # roof of 50% of target width
            $targetResolutions = ("310x150", "338x188", "465x225", "620x300", "1240x600")
            $resizedImage = ("75x75", "94x94", "113x113", "150x150", "300x300")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Wide310x150Logo.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the 44x44 of several target files"
            # roof of 100% of target width
            $targetResolutions = ("16x16", "24x24", "32x32", "48x48", "256x256")
            $resizedImage = ("16x16", "24x24", "32x32", "48x48", "256x256")
            $targetSize = ("16", "24", "32", "48", "256")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square44x44Logo.targetsize-$($targetSize[$i]).png"
            }
            
            Write-Output "Generating the 44x44 altform-unplated of several target files"
            # roof of 100% of target width
            $targetResolutions = ("16x16", "24x24", "32x32", "48x48", "256x256")
            $resizedImage = ("16x16", "24x24", "32x32", "48x48", "256x256")
            $targetSize = ("16", "24", "32", "48", "256")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension-Square44x44Logo.targetsize-$($targetSize[$i])_altform-unplated.png"
            }
            
            Write-Output "Generating the scaled icons for the file types"
            # roof of 100% of target width
            $targetResolutions = ("256x256", "320x320", "384x384", "512x512", "1024x1024")
            $resizedImage = ("256x256", "320x320", "384x384", "512x512", "1024x1024")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension.scale-$($scales[$i]).png"
            }
            
            Write-Output "Generating the icons for the file types of several target size"
            # roof of 100% of target width
            $targetResolutions = ("16x16", "24x24", "32x32", "44x44", "48x48", "96x96")
            $resizedImage = ("16x16", "24x24", "32x32", "44x44", "48x48", "96x96")
            $targetSize = ("16", "24", "32", "44", "48", "64", "96")
            for ($i = 0; $i -lt $targetResolutions.Length; $i++) {
                # Write-Output $storeResolutions[$i]
                magick convert $filename -resize $resizedImage[$i] -gravity center -background none -extent $targetResolutions[$i] "$fileNameWithoutExtension.targetsize-$($targetSize[$i])_altform-unplated.png"
            }


            exit
        }
        else {
            Write-Host "The Image Magick(magick) was not found in you Environment Variables."
            exit
        }
    }
    else {
        Write-Host "No such file name `"$fileName`" or it is not a PNG file."
    }
}
else {
    Write-Host "No input detected."
    exit
}

# Exit the script
exit










# magick convert .\SumatraPDF_1.png -resize 150x150 -gravity center -background none -extent 150x150 .\SumatraPDF_1_150x150.png
