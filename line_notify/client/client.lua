local menuOpen = false

RegisterCommand('notify_history', function()
    menuOpen = not menuOpen

    SetNuiFocus(menuOpen, menuOpen)
    SendNUIMessage({
        action = menuOpen and 'openHistory' or 'closeHistory'
    })
end)

RegisterKeyMapping(
    'notify_history',
    'Open notification history',
    'keyboard',
    'F10'
)

RegisterNUICallback('close', function(_, cb)
    menuOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'closeHistory'
    })

    cb('ok')
end)

exports('Notify', function(data)
    SendNUIMessage({
        action = 'notify',
        payload = data
    })
end)
