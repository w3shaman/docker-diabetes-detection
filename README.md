# Docker Image For Diabetes Detection
This is the docker image for the following application:

https://github.com/w3shaman/diabetes-detection


## Running in CLI Mode

```
docker run \
    -it \
    --rm \
    -v /home/user/app/diabetes-detection:/usr/src/app \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest
```


## Running in REST API Mode

```
docker run \
    -d \
    -v /home/user/app/diabetes-detection:/usr/src/app \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --mode restapi
```


## Running in Web Application Mode

```
docker run \
    -d \
    -v /home/user/app/diabetes-detection:/usr/src/app \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --mode web
```


## Save and Load Training Model

Firstly, please be sure the path of the local application is attached to **/usr/src/app**.

For saving the generated training model, add the following parameter.

``
--generate-pickle models/diabetes_early_detection.pkl
``

For loading the generated training model, add the following parameter.

``
--load-pickle models/diabetes_early_detection.pkl
``

## Dataset source
The dataset for generating the machine learning model is taken from the following URL:

https://archive.ics.uci.edu/ml/datasets/Early+stage+diabetes+risk+prediction+dataset.

## Citation
* Dua, D. and Graff, C. (2019). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.
* Islam, MM Faniqul, et al. 'Likelihood prediction of diabetes at early stage using data mining techniques.' Computer Vision and Machine Intelligence in Medical Image Analysis. Springer, Singapore, 2020. 113-125.
