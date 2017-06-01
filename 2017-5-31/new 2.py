import tensorflow as tf
import numpy as np

#創data
x_data = np.random.rand(100).astype(np.float32)
y_data = x_data*0.5+0.8

#開始創建結構
 
Weights = tf.Variable(tf.random_uniform([1],-1.0,1.0))
biases = tf.Variable(tf.zeros([1]))


y=Weights*x_data+biases

loss=tf.reduce_mean(tf.square(y-y_data)) #計算誤差
optimizer = tf.train.GradientDescentOptimizer(0.5) #優化器
train =optimizer.minimize(loss)


init =tf.initialize_all_variables() #初始化變量值


sess=tf.Session()
sess.run(init)

for step in range(200):
    sess.run(train)
    if step %20 ==0:
        print(step,sess.run(Weights),sess.run(biases))




