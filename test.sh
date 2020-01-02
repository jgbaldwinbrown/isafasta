if ! ./isabed <tests/test1.bed >/dev/null 2>&1 ; then echo "test1.bed failed" ; fi
if ./isabed <tests/test2.bed >/dev/null 2>&1 ; then echo "test2.bed failed" ; fi
if ./isabed <tests/test3.bed >/dev/null 2>&1 ; then echo "test3.bed failed" ; fi
if ./isafasta <tests/test1.fa >/dev/null 2>&1 ; then echo "test1.fa failed" ; fi
if ./isafasta <tests/test2.fa >/dev/null 2>&1 ; then echo "test2.fa failed" ; fi
if ./isafasta <tests/test3.fa >/dev/null 2>&1 ; then echo "test3.fa failed" ; fi
if ! ./isafasta <tests/test4.fa >/dev/null 2>&1 ; then echo "test4.fa failed" ; fi
if ./isafastq <tests/test1.fq >/dev/null 2>&1 ; then echo "test1.fq failed" ; fi
if ./isafastq <tests/test2.fq >/dev/null 2>&1 ; then echo "test2.fq failed" ; fi
if ./isafastq <tests/test3.fq >/dev/null 2>&1 ; then echo "test3.fq failed" ; fi
if ! ./isafastq <tests/test4.fq >/dev/null 2>&1 ; then echo "test4.fq failed" ; fi
if ! ./isagtf <tests/test1.gtf >/dev/null 2>&1 ; then echo "test1.gtf failed" ; fi
if ./isagtf <tests/test2.gtf >/dev/null 2>&1 ; then echo "test2.gtf failed" ; fi
if ./isagtf <tests/test3.gtf >/dev/null 2>&1 ; then echo "test3.gtf failed" ; fi
