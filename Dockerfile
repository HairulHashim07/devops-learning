# 1. Base Linux OS
FROM ubuntu:22.04

# 2. Install bash (safe, explicit)
RUN apt-get update && apt-get install -y bash

# 3. Set working directory
WORKDIR /app

# 4. Copy app and tests
COPY src/app.sh .
COPY tests/test.sh .

# 5. Make scripts executable
RUN chmod +x app.sh test.sh

# 6. Run tests DURING build
RUN ./test.sh

# 7. Run app when container starts
CMD ["./app.sh"]