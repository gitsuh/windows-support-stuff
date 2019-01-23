

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
	
	$jobs = get-bitstransfer

	$alljobscompleted = $false

	while (!$alljobscompleted){
		start-sleep -seconds 5
		write-host "Waiting for all jobs to queue and finish transferring."
		if($jobs.jobstate -contains "Queued" -or $jobs.jobstate -contains "Transferring"){
			$alljobscompleted = $false
		}else{
			$alljobscompleted = $true
		}
		
		$jobs = get-bitstransfer
	}
	$jobs | complete-bitstransfer
}


