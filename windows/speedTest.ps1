# Define the URL of a known file to download (e.g., a large image)
$downloadURL = "https://file-examples.com/wp-content/storage/2017/10/file-example_PDF_1MB.pdf"

# Measure the time it takes to download the file
$startTime = Get-Date
Invoke-WebRequest -Uri $downloadURL -OutFile "downloaded_file.jpg"
$endTime = Get-Date

# Calculate download speed
$downloadDuration = ($endTime - $startTime).TotalSeconds
$fileSize = (Get-Item "downloaded_file.jpg").Length
Write-Host "file size is: $fileSize"
$downloadSpeed = [math]::Round(($fileSize /1024 *8) / $downloadDuration, 2)  # in Mbps
# Display the download speed
Write-Host "Download Speed: $downloadSpeed Mbps"

# Clean up by deleting the downloaded file
Remove-Item "downloaded_file.jpg"
