package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;
import java.util.Random;

@Entity
@Table(name="notes")
public class Note {

    @Id
    private int id;
    private String title;
    @Column(length = 2500)
    private String content;
    private LocalDate date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public LocalDate getDate() {
        return date;
    }

    public Note(String title, String content, LocalDate date) {
        this.id= new Random().nextInt(500);
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public Note(){}


}
