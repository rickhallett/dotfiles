import sys
import json

def to_qualifiers(url):
    # e.g. zoxide-0.9.2-arm-unknown-linux-musleabihf.tar.gz
    name = url.split("/")[-1]
    if name.endswith(".tar.gz"):
        name = name[:-len(".tar.gz")]
    return frozenset(
        word
        for words in name.split("-")
        for word in words.split(".")
    )


terms = sys.argv[1].split(",") if len(sys.argv) > 1 else []
data = json.loads(sys.stdin.read())
urls = [
    entry["browser_download_url"]
    for entry in data["assets"]
]
url_qualifiers = {
    to_qualifiers(url): url
    for url in urls
}
matching_urls = [
    url
    for qualifiers, url in url_qualifiers.items()
    if all(term in qualifiers for term in terms)
]

assert len(matching_urls) == 1, f"cannot resolve release, found {matching_urls} in {urls}"
print(matching_urls[0])
