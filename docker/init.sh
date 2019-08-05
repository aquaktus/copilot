#/bin/bash

echo STARTED UP

echo "Starting Jupyter server"
cd /my_shared
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root &