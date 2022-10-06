# -*- coding: utf-8 -*-
"""
Created on Sat Sep  3 13:05:39 2022

@author: Kelvin
"""
# NLP WITH..............................
 # install ktrain - goto ipython on start menu & type .. !pip install ktrain
import os.path
import numpy as np 
import tensorflow as tf
import ktrain 
from ktrain import text

## Part 1: Data Preprocessing
### Loading the IMDB dataset
dataset = tf.keras.utils.get_file(fname="aclImdb_v1.tar",
                                  origin="http://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar",
                                  extract=True)
IMDB_DATADIR = os.path.join(os.path.dirname(dataset), "aclImdb")

print(os.path.dirname(dataset))
print(IMDB_DATADIR) #joining two paths

### Create Training and Test Sets
(x_train, y_train), (x_test, y_test), preproc=text.texts_from_folder(datadir=IMDB_DATADIR, 
                                                                     classes=['pos','neg'],
                                                                     maxlen=500, 
                                                                     train_test_names=['train', 'test'],
                                                                     preprocess_mode='bert')

## Building the BERT model
model = text.text_classifier(name='bert', 
                             train_data=(x_train, y_train),
                             preproc=preproc)

## Part 3: Training the BERT model
learner = ktrain.get_learner(model=model,
                             train_data=(x_train, y_train),
                             val_data = (x_test, y_test),
                             batch_size= 6)


#learning rate = any fit function used to train a ML or DL model
learner.fit_onecycle(lr=2e-5, 
                     epochs=2)

#learner.validate(val_data=(x_test, y_test),class_names=train.target_names)