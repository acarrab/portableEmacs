loader = open('./loader.org', 'r').read()
ReadMe = open('./README.org', 'r').read()

startTag = '# <configure start>'
endTag = '# <configure end>'

fout = ReadMe.split(startTag)
if len(fout) > 1:
    fout = [fout[0]] + fout[1].split(endTag)
    if len(fout) == 3:
        open('./README.org', 'w').write(fout[0] + loader + fout[2])
