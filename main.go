package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

//struck ke-1
type client struct {
	Clients struct {
		Address struct {
			City   string `json:"city"`
			State  string `json:"state"`
			Street string `json:"street"`
			Zip    string `json:"zip"`
		} `json:"address"`
		Age      int64  `json:"age"`
		Company  string `json:"company"`
		Email    string `json:"email"`
		Gender   string `json:"gender"`
		ID       string `json:"id"`
		IsActive string `json:"isActive"`
		Name     string `json:"name"`
		Phone    string `json:"phone"`
	} `json:"clients"`
}

//struck ke-2
type food struct {
	ID    string `json:"id"`
	Image struct {
		Height int64  `json:"height"`
		URL    string `json:"url"`
		Width  int64  `json:"width"`
	} `json:"image"`
	Name      string `json:"name"`
	Thumbnail struct {
		Height int64  `json:"height"`
		URL    string `json:"url"`
		Width  int64  `json:"width"`
	} `json:"thumbnail"`
	Type string `json:"type"`
}

func getclients(w http.ResponseWriter, r *http.Request) {

	body, _ := ioutil.ReadAll(r.Body)

	var request client

	if err = json.Unmarshal(body, &request); err != nil {
		fmt.Println("Failed decoding json message")
	}

	id := request.Clients.ID
	city := request.Clients.Address.City
	state := request.Clients.Address.State
	street := request.Clients.Address.Street
	zip := request.Clients.Address.Zip
	age := request.Clients.Age
	company := request.Clients.Company
	email := request.Clients.Email
	gender := request.Clients.Gender
	isactive := request.Clients.IsActive
	name := request.Clients.Name
	phone := request.Clients.Phone

	stmt, err := db.Prepare("INSERT INTO clients (id,isActive,age,name,gender,company,email,phone,street,city,state,zip) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)")

	_, err = stmt.Exec(id, isactive, age, name, gender, company, email, phone, street, city, state, zip)

	if err != nil {
		panic(err.Error())
	} else {
		fmt.Fprintf(w, "Date Created")
	}

}

func getfoods(w http.ResponseWriter, r *http.Request) {

	body, _ := ioutil.ReadAll(r.Body)

	var request food

	if err = json.Unmarshal(body, &request); err != nil {
		fmt.Println("Failed decoding json message")
	}

	id := request.ID
	tipe := request.Type
	name := request.Name
	urlimage := request.Image.URL
	widthimage := request.Image.Width
	heigtimage := request.Image.Height
	urlthumbnail := request.Thumbnail.URL
	widththumbnail := request.Thumbnail.Width
	heigtthumbnail := request.Thumbnail.Height

	stmt, err := db.Prepare("INSERT INTO food (id,type,name,imageurl,imagewidth,imageheight,thumbnailurl,thumbnailwidth,thumbnailheight) VALUES(?,?,?,?,?,?,?,?,?)")

	_, err = stmt.Exec(id, tipe, name, urlimage, widthimage, heigtimage, urlthumbnail, widththumbnail, heigtthumbnail)

	if err != nil {
		panic(err.Error())
	} else {
		fmt.Fprintf(w, request.Image.URL)
	}

}

func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/taks4")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	r := mux.NewRouter()

	fmt.Println("Server on :8181")

	r.HandleFunc("/clients", getclients).Methods("POST")
	r.HandleFunc("/foods", getfoods).Methods("POST")

	log.Fatal(http.ListenAndServe(":8181", r))

}
