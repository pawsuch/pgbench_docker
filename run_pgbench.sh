#!/bin/sh

if [ -z ${PG_HOSTNAME} ]; then
	echo "Missing PG hostname";
	exit -1;
fi

if [ ! -z ${PGBENCH_INIT} ]; then
# DB INIT
	pgbench \
	${PGBENCH_INIT} \
	-s ${PGBENCH_INIT_SCALE} \
	-h ${PG_HOSTNAME} \
	-p ${PG_PORT} \
	-U ${PGUSER} \
	${PGBENCH_DB}

else

	pgbench \
	-s ${PGBENCH_INIT_SCALE}  \
	-h ${PG_HOSTNAME} \
	-p ${PG_PORT} \
	-U ${PGUSER} \
	-j ${PGBENCH_JOBS} \
	-c ${PGBENCH_CLIENTS} \
	-T ${PGBENCH_TIME} \
	${EXTRA_FLAGS} \
	${PGBENCH_DB}	

fi
