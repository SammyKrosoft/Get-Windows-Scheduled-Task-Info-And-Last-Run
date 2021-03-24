$WinTasks = Get-ScheduledTask | Sort-Object State 

$TaskCustomCollection = @()

Foreach ($Task in $WinTasks){
    
    $TAskName = $Task.TAskName
    $TaskPath = $Task.TaskPath
    $TAskState = $TAsk.State
    $TAskInterval = $Task.Triggers.Repetition.Interval
    $TaskTriggerEnabled = $Task.Triggers.Enabled
    $TaskRepetitionType = $Task.Triggers.Repetition
    $TaskStartBoundary = $Task.Triggers.StartBoundary
    $TaskLastRunTime = ((Get-ScheduledTaskInfo $TAsk).LastRunTime)
    $TaskCustomCollection += [PSCustomobject]@{
                                                TaskName = $TaskName
                                                TaskState = $TAskState
                                                TaskLastRunTime = $TaskLastRunTime
                                                TaskTriggerEnabled = $TaskTriggerEnabled
                                                TaskRepetitionType = $TaskRepetitionType
                                                TaskStartBoundary = $TaskStartBoundary
                                                TaskInterval = $TAskInterval
                                               }


}

$TaskCustomCollection | Select Taskname,TaskState,TaskInterval, TaskLastRunTime,TaskTriggerEnabled,TaskRepetitionType,TaskStartBoundary | Out-GridView
