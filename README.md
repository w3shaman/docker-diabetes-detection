# Docker Image For Diabetes Detection
This is the docker image for the following application:

https://github.com/w3shaman/diabetes-detection

## Disclaimer
This application is for learning purpose only. The prediction result may not meet your expectation.

## Running in CLI Mode

```
docker run \
    -it \
    --rm \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest
```


## Running in REST API Mode

```
docker run \
    -d \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --mode restapi
```


## Running in Web Application Mode

```
docker run \
    -d \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --mode web
```


## Save and Load Training Model

We can also save then load the training model later so the application doesn't have to do the training process on every start.

Firstly, please make sure we have the source code of the application and the path is attached to **/usr/src/app**. The easiest way of getting the source code is by cloning it from GitHub.

``
git clone https://github.com/w3shaman/diabetes-detection.git
``

For example, assume the source code is located at **/home/user/app**. Then, for saving the training model as **models/diabetes_early_detection.pkl**, we can use the following command to start the container.

```
docker run \
    -d \
    -v /home/user/app/diabetes-detection:/usr/src/app \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --generate-pickle models/diabetes_early_detection.pkl \
        --mode restapi
```

> Please take a look at the arguments **-v** and **--generate-pickle**.

For loading the generated training model, we can use the following command instead of the above when starting the container.

```
docker run \
    -d \
    -v /home/user/app/diabetes-detection:/usr/src/app \
    -p 5000:5000 \
    --name diabetes_early_detection \
    w3shaman/diabetes-detection:latest \
        --load-pickle models/diabetes_early_detection.pkl \
        --mode restapi
```

> Please take a look at the arguments **-v** and **--load-pickle**.

## Dataset source
The dataset for generating the machine learning model is taken from the following URL:

https://archive.ics.uci.edu/ml/datasets/Early+stage+diabetes+risk+prediction+dataset.

## Citation
* Dua, D. and Graff, C. (2019). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.
* Islam, MM Faniqul, et al. 'Likelihood prediction of diabetes at early stage using data mining techniques.' Computer Vision and Machine Intelligence in Medical Image Analysis. Springer, Singapore, 2020. 113-125.
