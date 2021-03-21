SHELL:=/bin/bash

IMAGE_TAG?=pvphan/pi-gtsam:4.1rc

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	docker build --tag ${IMAGE_TAG} .

push: image
	docker push ${IMAGE_TAG}
