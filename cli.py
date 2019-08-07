from fastai.vision import *

learn = load_learner("./")

img = open_image(sys.argv[1])

pred_class,pred_idx,outputs = learn.predict(img)

print(pred_class)
print(outputs)
