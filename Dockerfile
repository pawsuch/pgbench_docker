FROM alpine

ENV PG_HOSTNAME localhost
ENV PG_PORT 5432
ENV PGUSER postgres
ENV PGPASSWORD postgres
ENV PGBENCH_INIT ""
ENV PGBENCH_INIT_SCALE="10"
ENV EXTRA_FLAGS ""

ENV PGBENCH_DB=pgbench
ENV PGBENCH_CLIENTS=10
ENV PGBENCH_TIME=30
ENV PGBENCH_JOBS=1

RUN apk add --no-cache postgresql


COPY run_pgbench.sh /bin/run_pgbench
RUN chmod u+x /bin/run_pgbench
# ENTRYPOINT [ "/bin/sh", "-c", "/usr/bin/pgbench" ]
ENTRYPOINT [ "/bin/run_pgbench" ]

CMD [ --help ]
