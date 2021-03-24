# Get-Windows-Scheduled-Task-Info-And-Last-Run

Quick script to dump or get all windows tasks with the last run time. 

It involves 2 cmdlets (`Get-ScheduledTask` and `Get-ScheduledTaskInfo`), and also showcases the use of PSCustomObject to include information from different cmdlets.

We could have simply run the below command:

```powershell
Get-ScheduledTask | where state -EQ 'ready' | Get-ScheduledTaskInfo | Out-GridView
```

or storing in a CSV file:

```powershell
Get-ScheduledTask | where state -EQ 'ready' | Get-ScheduledTaskInfo | Export-CSV -NoTypeInformation -Path c:\temp\ScheduledTasksInfoList.csv
```

But I needed information like the task state (Running / Deactivated / Stopped), that is obtained with `Get-ScheduledTask` only while the LastRunTime / NextRunTime properties can only be retrieved with `Get-ScheduledTaskInfo` cmdlet. That's why I needed to create a `[PSCustomObject]` to include properties from both cmdlets.


# Usage

Plain simple run the script, this will get the list of Windows scheduled tasks.

```powershell
.\Get-WindowsTaskSchedulerExtendedInfo.ps1
```

# Output

The script outputs the result in an Out-Gridview command, which shows the result in a PowerShell grid that you can filter, sort, copy/paste, like the below:

![image](https://user-images.githubusercontent.com/33433229/112364480-f190e300-8cac-11eb-8c13-0289ab9d7fa7.png)

NOTE: if you want to see all Windows tasks that repeats every 4 Hours, you can add a criteria to the GridView on "TaskInterval" and input "4H" in the filter:

- Add the field you want to filter (check, and click "Add"):

![image](https://user-images.githubusercontent.com/33433229/112371581-22751600-8cb5-11eb-8503-fa92dc5bfade.png)

- write "4H" (as in 4 Hours) in the field:

![image](https://user-images.githubusercontent.com/33433229/112371655-3c165d80-8cb5-11eb-9435-3fef7fa1e76a.png)

- The filter is immediate on the result Powershell grid:

![image](https://user-images.githubusercontent.com/33433229/112371714-505a5a80-8cb5-11eb-99dd-9d7648b49d9b.png)
