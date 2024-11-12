is_detach=1
is_sort=1
nsfw=true
audio_pref='bestaudio/audio'
video_pref='bestvideo[height=480]'

# remove url and views
video_info_text() {
	jq -r '[.title, .channel, .duration, .date, .viewed, .url, .scraper]|join("\t|")' | while IFS="$tab_space" read -r title channel duration date viewed url scraper; do
		scraper="${scraper#"|"}"
		fn_name=video_info_text_"${scraper}"
		if command_exists "$fn_name"; then
			"$fn_name" "$title" "$channel" "$duration" "$views" "$date" "$viewed" "$url" "$scraper"
		else
			_video_info_text "$title" "$channel" "$duration" "$views" "$date" "$viewed" "$url" "$scraper"
		fi
	done
	unset title channel duration views date viewed url scraper
}
