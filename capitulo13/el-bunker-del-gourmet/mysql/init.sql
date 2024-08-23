-- Crear la base de datos con codificación UTF-8
CREATE DATABASE IF NOT EXISTS recetas_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Se crea el usuario de acceso a la base de datos y se le asignan los privilegios
CREATE USER 'usuario-mysql'@'%' IDENTIFIED BY 'clave-usuario-mysql';
GRANT ALL PRIVILEGES ON recetas_db.* TO 'usuario-mysql'@'%';
FLUSH PRIVILEGES;

-- Usar la base de datos recién creada
USE recetas_db;

-- Crear la tabla de recetas con codificación UTF-8
CREATE TABLE IF NOT EXISTS recetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    tiempo_preparacion VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    dificultad VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    imagen VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    descripcion TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    ingredientes TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    preparacion TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
);

-- Insertar recetas gallegas en la tabla
INSERT INTO recetas (nombre, tiempo_preparacion, dificultad, imagen, descripcion, ingredientes, preparacion) VALUES
('Pulpo a la Gallega', '60 minutos', 'Media', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Pulpo cocido servido con patatas, pimentón y aceite de oliva.', 
'1 pulpo de 2 kg, 4 patatas grandes, Sal gruesa, Pimentón dulce o picante, Aceite de oliva virgen extra', 
'<ol><li>Congela el pulpo durante 48 horas para ablandar su carne. Descongélalo completamente antes de cocinar.</li>
<li>Hierve agua en una olla grande con sal gruesa.</li>
<li>Sumérgelo y retíralo del agua hirviendo tres veces para que los tentáculos se enrosquen. Luego, déjalo cocer durante 45-50 minutos.</li>
<li>Mientras tanto, pela y corta las patatas en rodajas gruesas. Cuécelas en agua con sal hasta que estén tiernas.</li>
<li>Escurre el pulpo y las patatas. Corta el pulpo en rodajas.</li>
<li>Coloca las patatas en un plato y cubre con las rodajas de pulpo. Espolvorea con pimentón y rocía generosamente con aceite de oliva virgen extra. Sirve caliente.</li></ol>'),

('Empanada Gallega', '120 minutos', 'Difícil', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Masa de pan rellena de atún, cebolla, pimientos y tomate.', 
'500g de harina, 250ml de agua tibia, 20g de levadura fresca, Sal, 500g de atún en aceite, 2 cebollas grandes, 2 pimientos rojos, 3 tomates maduros, Aceite de oliva', 
'<ol><li>Para la masa, disuelve la levadura en agua tibia. Mézclala con la harina y una pizca de sal, amasando hasta obtener una masa suave. Deja reposar durante 1 hora hasta que doble su tamaño.</li>
<li>Mientras reposa la masa, prepara el relleno. Pica las cebollas, los pimientos y los tomates. Sofríelos en aceite de oliva hasta que estén tiernos. Añade el atún desmenuzado y cocina por unos minutos más. Deja enfriar.</li>
<li>Divide la masa en dos partes. Estira una parte y colócala en una bandeja de horno. Extiende el relleno sobre la masa.</li>
<li>Estira la otra parte de la masa y colócala encima, sellando bien los bordes. Haz un pequeño agujero en el centro para que respire el vapor.</li>
<li>Pinta la superficie con aceite de oliva y hornea a 180°C durante 45 minutos o hasta que esté dorada.</li></ol>'),

('Caldo Gallego', '90 minutos', 'Media', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Sopa tradicional gallega hecha con grelos, patatas, chorizo y lacón.', 
'500g de grelos, 4 patatas grandes, 200g de chorizo, 300g de lacón, 1 cebolla, 3 dientes de ajo, Aceite de oliva, Sal', 
'<ol><li>En una olla grande, pon a cocer el lacón durante 1 hora con agua suficiente para cubrirlo.</li>
<li>Añade las patatas peladas y cortadas en trozos, la cebolla picada y los dientes de ajo enteros.</li>
<li>Cocina durante 30 minutos más, añadiendo el chorizo en rodajas.</li>
<li>Agrega los grelos y cocina otros 10-15 minutos hasta que estén tiernos.</li>
<li>Rectifica de sal y sirve caliente.</li></ol>'),

('Lacón con Grelos', '120 minutos', 'Media', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Plato típico gallego con lacón, grelos y patatas.', 
'1 kg de lacón salado, 1 manojo de grelos, 4 patatas grandes, 200g de chorizo, Aceite de oliva, Sal', 
'<ol><li>Desala el lacón dejándolo en agua durante 24 horas, cambiando el agua varias veces.</li>
<li>Cuece el lacón en agua limpia durante 1 hora.</li>
<li>Añade las patatas peladas y cortadas en trozos grandes y el chorizo. Cocina durante 30 minutos más.</li>
<li>Agrega los grelos y cocina 10-15 minutos hasta que estén tiernos.</li>
<li>Sírvelo todo junto, aderezado con un buen chorro de aceite de oliva.</li></ol>'),

('Tarta de Santiago', '60 minutos', 'Fácil', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Postre tradicional gallego hecho a base de almendra molida, azúcar y huevos.', 
'250g de almendra molida, 250g de azúcar, 4 huevos, Ralladura de 1 limón, 1 cucharadita de canela, Azúcar glas para decorar', 
'<ol><li>Precalienta el horno a 180°C.</li>
<li>En un bol grande, bate los huevos con el azúcar hasta obtener una mezcla esponjosa.</li>
<li>Añade la almendra molida, la ralladura de limón y la canela. Mezcla bien.</li>
<li>Vierte la mezcla en un molde engrasado y hornea durante 30-35 minutos hasta que esté dorada y firme al tacto.</li>
<li>Deja enfriar, desmolda y decora con azúcar glas, preferiblemente usando una plantilla de la cruz de Santiago.</li></ol>'),

('Pimientos de Padrón', '20 minutos', 'Fácil', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Pimientos pequeños fritos en aceite de oliva y espolvoreados con sal gruesa.', 
'200g de pimientos de Padrón, Aceite de oliva virgen extra, Sal gruesa', 
'<ol><li>Calienta una sartén grande con abundante aceite de oliva.</li>
<li>Fríe los pimientos de Padrón a fuego medio-alto hasta que la piel esté arrugada y ligeramente tostada, unos 5-7 minutos.</li>
<li>Escúrrelos sobre papel absorbente y espolvorea con sal gruesa antes de servir.</li></ol>'),

('Filloas Gallegas', '45 minutos', 'Media', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Postre tradicional gallego similar a las crepes, hecho con leche, harina y huevos.', 
'500ml de leche, 200g de harina, 4 huevos, 50g de mantequilla, Sal, Azúcar para espolvorear', 
'<ol><li>En un bol, bate los huevos con una pizca de sal. Añade la harina poco a poco y mezcla hasta obtener una masa homogénea.</li>
<li>Incorpora la leche y sigue batiendo hasta que no queden grumos. Deja reposar la masa durante 30 minutos.</li>
<li>Calienta una sartén con un poco de mantequilla y vierte un cucharón de masa, extendiéndola bien.</li>
<li>Cocina las filloas durante 1-2 minutos por cada lado hasta que estén doradas.</li>
<li>Repite el proceso con el resto de la masa y espolvorea con azúcar antes de servir.</li></ol>'),

('Vieiras a la Gallega', '60 minutos', 'Difícil', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Vieiras al horno con cebolla, jamón y pan rallado.', 
'8 vieiras frescas, 2 cebollas, 100g de jamón serrano, 100g de pan rallado, 1 vaso de vino blanco, Aceite de oliva, Sal, Perejil', 
'<ol><li>Precalienta el horno a 180°C.</li>
<li>Pica finamente las cebollas y sofríelas en aceite de oliva hasta que estén transparentes.</li>
<li>Añade el jamón serrano picado y cocina por 5 minutos más.</li>
<li>Desglasa la sartén con el vino blanco y deja reducir a la mitad.</li>
<li>Coloca una cucharada de esta mezcla sobre cada vieira, cúbrela con pan rallado y perejil picado.</li>
<li>Hornea durante 15-20 minutos hasta que estén doradas. Sirve caliente.</li></ol>'),

('Cocido Gallego', '180 minutos', 'Difícil', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Plato tradicional gallego con carnes, chorizo, garbanzos, patatas y grelos.', 
'1 kg de lacón, 500g de garbanzos, 4 patatas, 200g de chorizo, 300g de grelos, 1 morcillo de ternera, 1 oreja de cerdo, 1 pie de cerdo, Sal', 
'<ol><li>Desala el lacón, la oreja y el pie de cerdo dejándolos en agua durante 24 horas, cambiando el agua varias veces.</li>
<li>Cuece los garbanzos previamente remojados junto con el lacón, el morcillo, la oreja y el pie de cerdo en una olla grande con abundante agua durante 2 horas.</li>
<li>Añade las patatas peladas y cortadas, el chorizo y los grelos. Cocina durante 1 hora más hasta que todo esté tierno.</li>
<li>Sirve el cocido caliente, separando las carnes, los garbanzos y las verduras en diferentes fuentes.</li></ol>'),

('Merluza a la Gallega', '60 minutos', 'Media', 'https://c.pxhere.com/photos/85/44/food_salad_greens_sheet_vegetables_nutrition_tomato_meat-1204406.jpg!d', 
'Merluza cocida con patatas y aderezada con un sofrito de ajo y pimentón.', 
'4 lomos de merluza, 4 patatas, 2 dientes de ajo, 1 hoja de laurel, Pimentón dulce, Aceite de oliva, Sal', 
'<ol><li>En una cazuela grande, cuece las patatas peladas y cortadas en rodajas junto con la hoja de laurel y una pizca de sal durante 15 minutos.</li>
<li>Añade los lomos de merluza y cocina por 10 minutos más, hasta que el pescado esté cocido.</li>
<li>En una sartén aparte, sofríe los ajos picados en aceite de oliva hasta que estén dorados. Retira del fuego y añade el pimentón dulce.</li>
<li>Escurre la merluza y las patatas, colócalas en un plato y vierte el sofrito de ajo y pimentón por encima.</li>
<li>Sirve caliente.</li></ol>');
