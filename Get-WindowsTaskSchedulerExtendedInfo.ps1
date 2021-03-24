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
    
    $TaskInfo = Get-ScheduledTaskInfo $Task
    $TaskLastRunTime = $TaskInfo.LastRunTime
    $TaskNextRunTime = $TaskInfo.NextRunTime
    
    $TaskCustomCollection += [PSCustomobject]@{
                                                TaskName = $TaskName
                                                TaskState = $TAskState
                                                TaskInterval = $TAskInterval
                                                TaskLastRunTime = $TaskLastRunTime
                                                TaskNextRunTime = $TaskNextRunTime
                                                TaskTriggerEnabled = $TaskTriggerEnabled
                                                TaskRepetitionType = $TaskRepetitionType
                                                TaskStartBoundary = $TaskStartBoundary
                                                TaskPath = $TaskPath
                                               }


}

$TaskCustomCollection | Sort-object TaskLastRunTime -Descending | Out-GridView
