FROM toschneck/wait-for-it AS wfit
FROM mkbucc/shmig
COPY --from=wfit /wait-for-it.sh .
ENTRYPOINT ./wait-for-it.sh ${HOST:-localhost}:${PORT:-3389} -t ${TIMEOUT:-30} -- ./entrypoint.sh up
