do {
    Write-Host "The script is running..."

    # Prompt the user for reminders
    $reminders = Read-Host "Enter a reminder for today (separate with commas)"

    # If the user doesn't enter anything, show a message
    if ([string]::IsNullOrEmpty($reminders)) {
        Write-Host "No reminders entered. Please try again."
    } else {
        Write-Host "Your reminders for today are: $reminders"
        
        # Schedule reminder (just as a demo)
        $time = Read-Host "Enter the time to schedule the reminder (HH:mm format)"
        
        Write-Host "Reminder scheduled for $time. Task has been set."

        # Schedule the reminder with Task Scheduler
        $taskName = "Reminder_$($time.Replace(':', '_'))"
        $message = "Reminder: $reminders"
        schtasks /create /tn $taskName /tr "msg * $message" /sc once /st $time /f
        Write-Host "Task scheduled to display the reminder at $time."
    }

    # Ask if the user wants to enter another reminder or exit
    $continue = Read-Host "Would you like to enter another reminder? (Y/N)"
} while ($continue -eq "Y" -or $continue -eq "y")

Write-Host "Goodbye!"
