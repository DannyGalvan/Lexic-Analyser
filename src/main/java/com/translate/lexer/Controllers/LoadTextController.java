package com.translate.lexer.Controllers;

import java.io.StringReader;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.translate.lexer.Lexer;
import com.translate.lexer.Parser;
import com.translate.lexer.Entities.Request.TextRequest;
import com.translate.lexer.Entities.Response.ApiResponse;

import java_cup.runtime.Symbol;

@RestController
@RequestMapping("/api/v1")
public class LoadTextController {

    @GetMapping("/load-text")
    public ResponseEntity<ApiResponse<String>> getLoadText() {
        ApiResponse<String> response = new ApiResponse<>();

        try {
            Lexer lexer = new Lexer(
                    new StringReader("FUNCTION factorial(n)\r\n" + //
                            "    DEFINE resultado = 1;\r\n" + //
                            "    WHILE n > 1 DO\r\n" + //
                            "        resultado = resultado * n;\r\n" + //
                            "        n = n - 1;\r\n" + //
                            "    END\r\n" + //
                            "    RETURN resultado;\r\n" + //
                            "END\r\n" + //
                            "\r\n" + //
                            "DEFINE num = 5;\r\n" + //
                            "DEFINE fact = factorial(num);\r\n" + //
                            "PRINT \"El factorial de \", num, \" es \", fact;"));

            Parser parser = new Parser(lexer);
            Symbol result = parser.parse();

            String parsedResult = result.value != null ? result.value.toString() : "No result";

            response.setSuccess(true);
            response.setMessage("Text loaded successfully!");
            response.setData(parsedResult);
        } catch (Exception e) {
            response.setSuccess(false);
            response.setMessage("Failed to load text: " + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    @PostMapping("/load-text")
    public ResponseEntity<ApiResponse<String>> loadText(@RequestBody TextRequest text) {
        ApiResponse<String> response = new ApiResponse<>();

        try {
            Lexer lexer = new Lexer(
                    new StringReader(text.getText()));

            Parser parser = new Parser(lexer);
            Symbol result = parser.parse();

            String parsedResult = result.value != null ? result.value.toString() : "No result";

            response.setSuccess(true);
            response.setMessage("Text loaded successfully!");
            response.setData(parsedResult);
        } catch (Exception e) {
            response.setSuccess(false);
            response.setMessage(
                    "Error al analizar texto: " + e.getMessage() + " - " + e.getCause() + " - " + e.getClass() + " - "
                            + e.getStackTrace());
            response.setData(e.getMessage());
        }

        return ResponseEntity.ok(response);
    }
}
