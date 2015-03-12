#!/bin/bash

CINDER_DIR='monitor/' # include trailing slash
DOCS_DIR='source'

modules=''
for x in `find ${CINDER_DIR} -name '*.py' | grep -v monitor/tests`; do
    if [ `basename ${x} .py` == "__init__" ] ; then
        continue
    fi
    relative=monitor.`echo ${x} | sed -e 's$^'${CINDER_DIR}'$$' -e 's/.py$//' -e 's$/$.$g'`
    modules="${modules} ${relative}"
done

for mod in ${modules} ; do
  if [ ! -f "${DOCS_DIR}/${mod}.rst" ];
  then
    echo ${mod}
  fi
done
