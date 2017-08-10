import re
import sys

refs = {}
last_num = 0
with open('ref-temp.txt', 'r') as f:
    for line in f:
        data = line.strip().split()
        if len( data ) == 2:
            num = int(data[0])
            assert( num ) not in refs
            assert( num - 1 == last_num )
            last_num = num
            refs[ num ] = data[1]

new_lines = []
with open('benchmark-paper.tex', 'r') as f:
    for line in f:
        new_line = line.strip()
        while True:
            m = re.search( '\[(\d+)\]', new_line )
            mult_m = re.search( u'\[(\d+)[,–-](\d+)\]', new_line )
            if not m and not mult_m:
                break
            if m:
                ref_num = int(m.group(1))
                new_line = new_line.replace( m.group(0), '\cite{%s}' % refs[ref_num] )
            if mult_m:
                citations = []
                for ref_num in range( int(mult_m.group(1)), int(mult_m.group(2))+1 ):
                    citations.append( refs[ref_num] )
                new_line = new_line.replace( mult_m.group(0), '\cite{%s}' % ','.join(citations) )
        new_lines.append( new_line )

with open('benchmark-paper.new.tex', 'w') as f:
    f.write( '\n'.join(new_lines) )
