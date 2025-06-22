import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import pandas as pd
import time

client_id = '340004669ddd4a8690031b62bb9b7d6c'
client_secret = 'f962c68d1f99441b90d7c8ce0808c34f'

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=client_id, client_secret=client_secret))

def get_tracks_by_year(year, limit_per_request=50, total_limit=1000):
    all_tracks = []
    for offset in range(0, total_limit, limit_per_request):
        results = sp.search(q=f'year:{year}', type='track', limit=limit_per_request, offset=offset)
        for track in results['tracks']['items']:
            all_tracks.append({
                'name': track['name'],
                'artist': track['artists'][0]['name'],
                'release_date': track['album']['release_date'],
                'popularity': track['popularity'],
                'album_name': track['album']['name'],
                'track_id': track['id'],
                'track_url': track['external_urls']['spotify']
            })
        time.sleep(0.5)
    return all_tracks

years = [2024, 2025]
df_total = pd.DataFrame()

for year in years:
    print(f"Pulling tracks for year: {year}")
    tracks = get_tracks_by_year(year)
    df_year = pd.DataFrame(tracks)
    df_total = pd.concat([df_total, df_year], ignore_index=True)

df_total = df_total.drop_duplicates(subset='track_id')
df_total.to_csv('spotify_tracks_2024_2025.csv', index=False)
print("✅ Done! Data saved to spotify_tracks_2024_2025.csv")
