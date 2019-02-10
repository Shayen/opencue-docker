# PReparation
python -m virtualenv venv
source ./venv/Scripts/activate
pip install -r requirements.txt

#Install RQD
cd proto
for /R %x in (*proto) do python -m grpc_tools.protoc -I=. --python_out=../rqd/rqd/compiled_proto --grpc_python_out=../rqd/rqd/compiled_proto ./%~nxx
cd ../rqd
python setup.py install
cd ..

# Install PyCue
cd proto
for /R %x in (*proto) do python -m grpc_tools.protoc -I=. --python_out=../pycue/opencue/compiled_proto --grpc_python_out=../pycue/opencue/compiled_proto ./%~nxx
cd ../pycue
python setup.py install
cd ..

# Install pyOutline
cd ../pyoutline
python setup.py install
cd ..

#Verify the install
python -c "import opencue,outline;opencue.api.getShows()"

# Install GUI
cd cuegui
python setup.py install
cd ..

echo "Install success..."
