docker run --rm -v /path:/path \
       idba_ud:v1.0.0 \
       /bin/bash /idba/idba_ud.assembly.sh -s prefix \
       -x /path/test.pair.1.fq.gz \
       -p /path/test.pair.2.fq.gz \
       -o /path/idba \
       -m 120 -i 40 -e 20 -t 20
