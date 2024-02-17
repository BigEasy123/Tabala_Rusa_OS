extern "C" void kernel_main() {
    // Simple kernel that prints a message
    const char* message = "Hello, kernel world!";
    // Pointer to video memory
    char* video_memory = (char*) 0xb8000;
    // Write the message to video memory
    for (int i = 0; message[i] != '\0'; ++i) {
        video_memory[i*2] = message[i];    // Character
        video_memory[i*2 + 1] = 0x07;      // Attribute byte: white on black
    }

    // Infinite loop to prevent kernel from exiting
    while (1);
}
