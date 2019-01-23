

function moveit {
	param (
		$targetserver,
		$targetlocation,
		$sourcelocation,
		$filenamefilter
	)

	$files = (get-childitem -path $sourcelocation -filter $filenamefilter)

	foreach ($file in $files){
		Start-BitsTransfer -Source $file.fullname -Destination \\$targetserver\$targetlocation$file.name -priority low -asynchronous
	}
}
