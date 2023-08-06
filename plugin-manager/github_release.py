import sys
import json

terms = sys.argv[1].split(",") if len(sys.argv) > 1 else []
data = json.loads(sys.stdin.read())
urls = [
    entry["browser_download_url"]
    for entry in data["assets"]
]
url_filenames = {
    url.split("/")[-1]: url
    for url in urls
}
matching_urls = [
    url
    for name, url in url_filenames.items()
    if all(term in name for term in terms)
]

assert len(matching_urls) == 1, f"cannot resolve release, found {matching_urls} in {urls}"
print(matching_urls[0])
