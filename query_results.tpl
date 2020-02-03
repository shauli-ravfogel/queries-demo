
<html>
    <head>
   	 <script language="javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
        <meta charset="utf-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>LM clusters visualization</title>


	<style>


	.tooltip {
	  position: relative;
 	 display: inline-block;
 	 border-bottom: 1px dotted black;
  	z-index: 100;
	}

	.tooltip .tooltiptext {
	  visibility: hidden;
 	 width: 720px;
 	 background-color: black;
  	 color: white;
  	 text-align: left;
  	 border-radius: 6px;
 	 padding: 5px 0;

 	 /* Position the tooltip */
 	 position: absolute;
 	 margin-left:+150px;
 	 margin-top: -100px;
 	 z-index: 100;
 	top: -50px;
  	left: 105%; 
	}

	.tooltip:hover .tooltiptext {
	  visibility: visible;
	}
	
                /* Dropdown Button */
                .dropbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
                }

                /* The container <div> - needed to position the dropdown content */
                .dropdown {
                position: relative;
                display: inline-block;
                }

                /* Dropdown Content (Hidden by Default) */
                .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                }

                /* Links inside the dropdown */
                .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                }

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: #3e8e41;} 


	</style>


    </head>

    <body>

                <div class="dropdown">
                        <button class="dropbtn">Query</button>
                        <div class="dropdown-content">
                                <a href="../query/lipase">Lipase</a>
                                <a href="../query/choline">Choline</a>
                        </div>
                </div> 
                

                 <div id="app-body">

                 % columns = list(df.columns.values)
       
                 % for i, clust_id in enumerate(cluster_ids):

                        % print(len(cluster_ids), len(df["cluster_id"]), clust_id)
                        % clust_df = df[df["cluster_id"] == clust_id]

                        <div class="w3-container">

                                <button type="button" class="w3-button w3-block" data-toggle="collapse" data-target={{"#cluster-"+str(clust_id)}}>  <font size="6">Cluster {{i}}</font>  </button>

                                <div id={{"cluster-"+ str(clust_id)}} class="panel-collapse collapse">

                                <div class="panel-footer"> <font size = 5> <b> Common words:</b> {{clust_stats["pmis"][i][:10]}} </font> 

                                <p> Cluster size: {{len(clust_df)}} </p>
                                </div>

                                <ul class="list-group">

                                % for index, row in clust_df.iterrows():
                                        % txt_splitted, txt = row["sentence_text"].split(" "), row["sentence_text"]
                                        <%
                                        query_index = row["word_first_index"]
                                        txt_formatted = txt_splitted.copy()
                                        left = " ".join(txt_splitted[:query_index])
                                        right = " ".join(txt_splitted[query_index + 1:])
                                        dep = row["dep_edge"]
                                        w = txt_splitted[query_index]
                                        %>

                                        <li class="list-group-item">  <font size="6">  {{left}}  <font size = '6' color = 'blue'> {{w}}<sup>{{dep}}</sup> </font>  {{right}}     </font>  </li>
                                % end

                                </ul>
                                
                                </div>

                        </div>

                
                % end

                </div>
		




                
    </body>



</html>
