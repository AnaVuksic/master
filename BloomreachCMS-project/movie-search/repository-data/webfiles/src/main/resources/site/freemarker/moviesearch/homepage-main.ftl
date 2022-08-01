<#include "../include/imports.ftl">

<head>
    <meta charset="utf-8">
    <title>Autosuggestion Elasticsearch Demo</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font: 16px Arial;
        }

        /*the container must be positioned relative:*/
        .autocomplete {
            position: relative;
            display: inline-block;
        }

        input {
            border: 1px solid transparent;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 16px;
        }

        input[type=text] {
            background-color: #f1f1f1;
            width: 100%;
        }

        input[type=submit] {
            background-color: DodgerBlue;
            color: #fff;
            cursor: pointer;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            padding: 10px;
            cursor: pointer;
            background-color: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        /*when hovering an item:*/
        .autocomplete-items div:hover {
            background-color: #e9e9e9;
        }

        /*when navigating through the items using the arrow keys:*/
        .autocomplete-active {
            background-color: DodgerBlue !important;
            color: #ffffff;
        }
    </style>
</head>

<#--<@hst.setBundle basename="essentials.homepage"/>
<div>
  <h1><@fmt.message key="homepage.title" var="title"/>${title?html}</h1>
  <p><@fmt.message key="homepage.text" var="text"/>${text?html}</p>
  <#if !hstRequest.requestContext.channelManagerPreviewRequest>
    <p>
      this is homepage- main
      [This text can be edited
      <a href="http://localhost:8080/cms/?1&path=/content/documents/administration/labels/homepage" target="_blank">here</a>.]
    </p>
  </#if>
</div>

<div>
  <@hst.include ref="container"/>
</div>

<button>Send an HTTP GET request to a page and get the result back</button>


curl -XGET "http://localhost:9200/tesla_employees/_search"
-H 'Content-Type: application/json' -d'
{  "query": {    "match_all": {          }  }}'

-->




<script>
    // let data = ["Ram", "Shyam", "Sita", "Gita"];
    //
    // let list = document.getElementById("myList");
    //
    // data.forEach((item) => {
    //     let li = document.createElement("li");
    //     li.innerText = item;
    //     list.appendChild(li);
    // });
</script>

<div>
    <@hst.include ref="container"/>
</div>


<div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-6">
        <h2>Search for your favourite movie:</h2>
    </div>
    <div class="col-md-3">
    </div>
</div>



<div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-6">
        <!--Make sure the form has the autocomplete function switched off:-->
         <form autocomplete="off" action="moviesearch?q=Terminator">
             <div class="autocomplete" style="width:300px;">
                <input id="name" type="text" name="name" placeholder="Search movie...">
             </div>
             <input type="submit" value="Search">
            </form>
        </div>
    <div class="col-md-3">
    </div>
</div>


<div id="myList"></div>
<div id="stajling" style="padding-bottom: 200px;">


</div>

<script>



    $(document).ready(function(){
        $("#name").on('input', function() {

            function autocomplete(inp, arr) {
                /*the autocomplete function takes two arguments,
                the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function(e) {
                    var a, b, i, val = this.value;
                    /*close any already open lists of autocompleted values*/
                    closeAllLists();
                    if (!val) { return false;}
                    currentFocus = -1;
                    /*create a DIV element that will contain the items (values):*/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    /*append the DIV element as a child of the autocomplete container:*/
                    this.parentNode.appendChild(a);
                    /*for each item in the array...*/
                    for (i = 0; i < arr.length; i++) {
                        /*check if the item starts with the same letters as the text field value:*/
                       // if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            /*create a DIV element for each matching element:*/
                            b = document.createElement("DIV");
                            /*make the matching letters bold:*/
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            /*insert a input field that will hold the current array item's value:*/
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            /*execute a function when someone clicks on the item value (DIV element):*/
                            b.addEventListener("click", function(e) {
                                /*insert the value for the autocomplete text field:*/
                                inp.value = this.getElementsByTagName("input")[0].value;
                                /*close the list of autocompleted values,
                                (or any other open lists of autocompleted values:*/
                                closeAllLists();
                            });
                            a.appendChild(b);
                        //}
                    }
                });
                /*execute a function presses a key on the keyboard:*/
                inp.addEventListener("keydown", function(e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x) x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        /*If the arrow DOWN key is pressed,
                        increase the currentFocus variable:*/
                        currentFocus++;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 38) { //up
                        /*If the arrow UP key is pressed,
                        decrease the currentFocus variable:*/
                        currentFocus--;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        /*If the ENTER key is pressed, prevent the form from being submitted,*/
                        e.preventDefault();
                        if (currentFocus > -1) {
                            /*and simulate a click on the "active" item:*/
                            if (x) x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    /*a function to classify an item as "active":*/
                    if (!x) return false;
                    /*start by removing the "active" class on all items:*/
                    removeActive(x);
                    if (currentFocus >= x.length) currentFocus = 0;
                    if (currentFocus < 0) currentFocus = (x.length - 1);
                    /*add class "autocomplete-active":*/
                    x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                    /*a function to remove the "active" class from all autocomplete items:*/
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                }
                function closeAllLists(elmnt) {
                    /*close all autocomplete lists in the document,
                    except the one passed as an argument:*/
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                }
                /*execute a function when someone clicks in the document:*/
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }

            var input = $("#name").val();

            //$.post("http://localhost:9200/test1/_search?q="+input, function(data, status){
            //    alert("Data: " + data + "\nStatus: " + status);
            //});


            input = input.concat("*~0.8")
            console.log(input);

            var url = 'http://localhost:9200/test1/_search?q=original_title:';
            url = url+input

            console.log(url)

            var arr = new Array ();

            fetch(url)
                .then((response) => {
                    return response.json();
                }).then((myJson) => {

                console.log(myJson);
                var hitsJson = (myJson.hits.hits);
                for(var key in hitsJson) {
                    arr.push(hitsJson[key]._source.original_title);
                }

                console.log(myJson.hits.hits);

                //document.getElementById("myList").innerHTML = "";
                //let list = document.getElementById("myList");

                //arr.forEach((item) => {
                  //  let li = document.createElement("li");
                   // li.innerText = "Name:"+item;
                   // list.appendChild(li);
                //});
                autocomplete(document.getElementById("name"), arr);
            });

        });
    });

</script>




