import cv2
import os
import shutil  # Import shutil for moving files
import logging  # Import logging module
import time  # Import time module for execution timing


# Configure logging
logging.basicConfig(
    filename="largest_face_detector.log",  # Log file
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

# Start time
start_time = time.time()
logging.info("Execution started.")


# Update these paths if needed
prototxt_path = "/Users/nickolaycohen/dev/media-organizer/face-recognition/deploy.prototxt"
model_path = "/Users/nickolaycohen/dev/media-organizer/face-recognition/res10_300x300_ssd_iter_140000.caffemodel"

# Load OpenCV's DNN Face Detector
net = cv2.dnn.readNetFromCaffe(prototxt_path, model_path)


# Directory where the AppleScript exported images
image_dir = "/Users/nickolaycohen/dev/media-organizer/face-recognition/High Aesthetic Photos Album Export"
largest_faces_dir = os.path.join(image_dir, "Largest_Faces")  # New folder for largest faces

# Ensure the target directory exists
os.makedirs(largest_faces_dir, exist_ok=True)

largest_face_size = 0
largest_face_image = None
file_count = 0  # Counter for processed files

logging.info("Scanning images in %s", image_dir)

# Scan exported images
for filename in os.listdir(image_dir):
    if filename.lower().endswith((".jpg", ".jpeg", ".png","heic")):
        file_count += 1
        image_path = os.path.join(image_dir, filename)
        image = cv2.imread(image_path)

        if image is None:
            logging.warning("Failed to read image: %s", image_path)
            continue

        (h, w) = image.shape[:2]
        blob = cv2.dnn.blobFromImage(image, 1.0, (300, 300), (104.0, 177.0, 123.0))

        net.setInput(blob)
        detections = net.forward()

        for i in range(detections.shape[2]):
            confidence = detections[0, 0, i, 2]

            if confidence > 0.5:
                box = detections[0, 0, i, 3:7] * [w, h, w, h]
                (x, y, x2, y2) = box.astype("int")

                face_size = (x2 - x) * (y2 - y)

                if face_size > largest_face_size:
                    largest_face_size = face_size
                    largest_face_image = image_path


logging.info("Total files processed: %d", file_count)
logging.info("Largest detected face size: %d pixels", largest_face_size)

# Move the largest face image to the subfolder
if largest_face_image:
    destination_path = os.path.join(largest_faces_dir, os.path.basename(largest_face_image))
    shutil.move(largest_face_image, destination_path)
    logging.info("Largest face image moved to: %s", destination_path)
else:
    logging.info("No faces detected.")

# End time
end_time = time.time()
execution_time = end_time - start_time
throughput = file_count / execution_time if execution_time > 0 else 0

logging.info("Execution ended. Total runtime: %.2f seconds", execution_time)
logging.info("Throughput: %.2f files per second", throughput)