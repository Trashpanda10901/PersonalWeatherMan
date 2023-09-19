#INITALiZINGN TEXT TO SPEECH
Add-Type -AssemblyName System.Speech
$synthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$synthesizer.Speak('Hello everbody tuning in today!')
$synthesizer.Speak('Please wait while we collect all of our data')

#TOWN INPUT
$city = Read-Host 'Town: '

#FORMATTING URL
$url = 'https://weatherapi-com.p.rapidapi.com/forecast.json?q=' + $city 

#CALLING THE API REQUEST
$headers1=@{}
$headers1.Add("X-RapidAPI-Key", "88a3af7a29msh914e4e48ec4e0d4p1b5e15jsn81ff4d10232f")
$headers1.Add("X-RapidAPI-Host", "weatherapi-com.p.rapidapi.com")
$page = Invoke-WebRequest -Uri $url -Method GET -Headers $headers1
$forecast = $page | ConvertFrom-Json

#STARTING THE BROADCAST ;)
$speak = 'Alrighty! Welcome to your daily weather forecast for ' + $city
$synthesizer.Speak($speak)
$weather = $forecast.forecast.forecastday


#AND WE'RE LIVE!!
$avgtemp = 'The average tempature of' + $city + ' nestles nicely within the bounds of around ' + $weather.day.avgtemp_f + 'degrees fahrenheit'
$synthesizer.Speak($avgtemp)

#AVERAGE TEMPATURE
if ($weather.day.avgtemp_f -ge 80) {
    $synthesizer.Speak('Hot dang it will be warm today, better bust out the bikinis because its a beach day!')
}

#COLD TEMPATURE
if ($weather.day.avgtemp_f -le 45) {
    $synthesizer.Speak('Looks like its gonna be on the chillier side today folks!')
}

#RANDOM OUTPUT ON VOICE FOR AVERAGE TEMPATURE
else {

    $var = Get-Random -Maximum 10 -Minimum 1

    if ($var -eq 1) {
        $synthesizer.Speak('Looks like the tempature is gonna be great today!')
    }
    if ($var -eq 2) {
        $synthesizer.Speak('What an average day!')   
    }
    if ($var -eq 3) {
        $synthesizer.Speak('Perfect day to be outside folks!')
    }
    if ($var -eq 4) {
        $synthesizer.Speak('I hate my job')
    }
    if ($var -eq 5) {
        $synthesizer.Speak('Today is in the green zone for tempature folks!')
    }
    if ($var -eq 6) {
        $synthesizer.Speak('I might quit my job and go for a walk folks, its a perfect day!')
    }
    if ($var -eq 7) {
        $synthesizer.Speak('I walked my dog this morning and he seemed to like the tempature!')
    }
    if ($var -eq 8) {
        $synthesizer.Speak('What a beautiful day')
    }
    if ($var -eq 9) {
        $synthesizer.Speak('Thank goodness that the tempature is this perfect, my wife would be mad if it wasnt and you dont wanna see her when shes mad!')
    }

}

#HIGHS AND LWOS
$maxmin = 'The highs and lows of today are' + $weather.day.maxtemp_f + 'high and' + $weather.day.mintemp_f + 'low'
$synthesizer.Speak($maxmin)
#RAIN CHANCE
$chanceofrain = 'We are looking at about a' + $weather.day.daily_chance_of_rain + 'chance of rain'
$synthesizer.Speak($chanceofrain)

#CHANCE OF RAIN OUTPUT FOR VOICE
if ($weather.day.daily_will_it_rain -eq 1) {

    $var = Get-Random -Maximum 5 -Minimum 1

    if ($var -eq 1) {
        $synthesizer.Speak('Better bust out the umbrellas today because its gonna be a wet one!')
    }
    if ($var -eq 2) {
        $synthesizer.Speak('Its gonna be a wet one today!')
    }
    if ($var -eq 3) {
        $synthesizer.Speak('Cant wait because my plants are gonna be happy today! ITS GONNA RAIN!')
    }
    if ($var -eq 4) {
        $synthesizer.Speak('My dog likes the rain and my dog is gonna be happy today woohoo!')
    }
    if ($var -eq 5) {
        $synthesizer.Speak('Better bust out those rain coats and soup and stuff because its gonna be wet today')
    }
}

else {
    $synthesizer.Speak('It will most likely not rain today')
}