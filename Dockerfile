# Start from the Python 3.10 base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the build directory into the container
COPY . /app

# Install dependencies from the build directory
RUN pip install -r requirements.txt

# Install dependencies from the build directory
RUN pip install -e .

# Set environment variables required by the script
ENV BASE_URL=""
ENV MODEL_ID=""
ENV OPENAI_API_KEY="mock"
ENV HF_TOKEN=""

# Command to run the script
CMD ["sh", "-c", "lm_eval   --model openai-chat-completions   --model_args model=$MODEL_ID,base_url=$BASE_URL/chat/completions,num_concurrent=16,max_retries=3   --apply_chat_template   --fewshot_as_multiturn   --tasks gsm8k_cot --num_fewshot 8"]
