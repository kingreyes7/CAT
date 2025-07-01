from flask import Flask, render_template, request, redirect, url_for
import os

app = Flask(__name__)
UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Simulamos una predicción simple por nombre de archivo
def predict_image(filename):
    if 'excavadora' in filename.lower():
        return 'Excavadora', 'Una excavadora es una máquina de construcción usada para excavar, cargar o mover materiales pesados.'
    elif 'andamio' in filename.lower():
        return 'Andamio', 'Un andamio es una estructura provisional usada para dar soporte y acceso a trabajadores en construcciones o reparaciones.'
    else:
        return 'Desconocido', 'No se pudo clasificar la imagen. Por favor, intente con otra imagen.'

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return redirect(request.url)
    file = request.files['image']
    if file.filename == '':
        return redirect(request.url)
    if file:
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
        file.save(filepath)

        label, description = predict_image(file.filename)
        image_url = url_for('static', filename=f'uploads/{file.filename}')
        return render_template('reconocimiento.html', label=label, description=description, image_url=image_url)

if __name__ == '__main__':
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)
    app.run(debug=True)
