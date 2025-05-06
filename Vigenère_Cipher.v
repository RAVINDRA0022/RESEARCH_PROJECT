module vigenere_encryptor (
    input  [7:0] message_char,    // ASCII A-Z
    input  [7:0] key_char,        // ASCII A-Z
    output reg [7:0] encrypted_char // ASCII A-Z
);

    reg [4:0] msg_idx;  // Index for message (0-25)
    reg [4:0] key_idx;  // Index for key (0-25)
    reg [4:0] enc_idx;  // Index after encryption (0-25)

    always @(*) begin
        // Convert characters to 0-25
        msg_idx = message_char - "A";
        key_idx = key_char - "A";

        // Vigenère Encryption: (msg + key) mod 26
        enc_idx = (msg_idx + key_idx) % 26;

        // Convert index back to character
        encrypted_char = enc_idx + "A";
    end

endmodule
