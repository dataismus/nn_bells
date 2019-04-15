# add this to bash_profile: 
# alias dockerwipe="docker rmi \$(docker images | awk '/^<none>/ {print \$3}')"
FROM dataismus/jupyspark

COPY custom_bells.txt /etc/
# RUN conda install --quiet -y \
#     'keras=2.2.*' \
#     'tensorflow=1.10.*' && \
#     conda install --quiet -y -c pytorch 'pytorch-cpu=1.0.*' 'torchvision-cpu=0.2.*' &&\
#     conda install --quiet -y -c fastai  'fastai=1.0.*'              &&\
#     conda clean -tipsy
RUN conda install --quiet -y 'keras=2.2.*'
RUN conda install --quiet -y -c pytorch 'pytorch-cpu=1.0.*' 'torchvision-cpu=0.2.*'
RUN conda install --quiet -y -c fastai  'fastai=1.0.*'
RUN conda install --quiet -y 'tensorflow=1.10.*'
RUN conda install --quiet -y findspark
RUN conda clean -tipsy

RUN pip install -U 'fasttext==0.8.*'
CMD nohup start-notebook.sh &>/dev/null && bash

ENV PATH=$SPARK_HOME/bin:$PATH