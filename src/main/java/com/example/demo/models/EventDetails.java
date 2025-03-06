package com.example.demo.models;



import jakarta.persistence.Entity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
public class EventDetails extends AbstractEntity{

    @Size(max = 500, message = "Description too long!")
    private String description;

    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email. Try again.")
    private String contactEmail;

    // Constructor cu parametri
    public EventDetails(@Size(max = 500, message = "Description too long!") String description,
                        @NotBlank(message = "Email is required") @Email(message = "Invalid email. Try again.") String contactEmail) {
        this.description = description;
        this.contactEmail = contactEmail;
    }

    // Constructor gol (obligatoriu pentru JPA)
    public EventDetails() {
    }

    // Getter pentru description
    public String getDescription() {
        return description;
    }

    // Setter pentru description
    public void setDescription(String description) {
        this.description = description;
    }

    // Getter pentru contactEmail
    public String getContactEmail() {
        return contactEmail;
    }

    // Setter pentru contactEmail
    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }
}
