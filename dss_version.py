import urllib.request


def dss_latest_version(url='https://cdn.downloads.dataiku.com/public/dss/'):

    u2 = urllib.request.urlopen(url)
    rows = []
    for lines in u2.readlines():
        rows.append(lines)
    return rows[rows.__len__() - 4].__str__().split(' ')[4][6:11]


print(dss_latest_version())