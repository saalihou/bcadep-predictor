from flask import Flask, request
from fastai.vision import load_learner, open_image
import os
import tempfile
app = Flask(__name__)

learn = load_learner("./")

UPLOAD_FOLDER = tempfile.gettempdir()
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route("/predict_from_image", methods=['POST'])
def predict_from_image():
    file = request.files['file']
    path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
    file.save(path)
    img = open_image(path)

    pred_class,pred_idx,outputs = learn.predict(img)

    return {"class": str(pred_class), "probability": float(outputs[pred_idx])}
