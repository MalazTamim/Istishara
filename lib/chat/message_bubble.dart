import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/chat/pdfview.dart';


class MessageBubble extends StatelessWidget {


  String message;
  bool isMe ; 
  Timestamp time ; 
  String type ; 

  MessageBubble(this.message,this.isMe,this.time,this.type) ; 


  String gettime(Timestamp time) 
  {
    DateTime x = time.toDate() ; 
    return(x.hour.toString()+":"+x.minute.toString()) ; 
  }
  @override
  Widget build(BuildContext context) {

    if(type=="text") 
    {
      return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [ Container(
        decoration: BoxDecoration(
          color: isMe? Colors.grey[500] : Colors.blue[500],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: isMe? Radius.circular(14) : Radius.circular(0), 
            bottomRight: isMe? Radius.circular(0) : Radius.circular(14),
            
          )
        ),
        width: 140, //140
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child:  Text(message, style: TextStyle(color: Colors.black),)  

      ),
      
      Text(gettime(time),style: TextStyle(color: Colors.grey),) , 

      

      // time.hour 
    
      
      ] 
    ) ;
    }
    else if(type=="image") 
    {
      return Row(
       mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
       children: [Container(child: Image(image: NetworkImage(message),width: 230,height: 250, 
       loadingBuilder: 
        (context,child,progress) { return progress==null? child : LinearProgressIndicator(backgroundColor: Colors.blue,) ; }
        ,),
         margin: EdgeInsets.symmetric(vertical: 1, horizontal: 8), ),
        Text(gettime(time),style: TextStyle(color: Colors.grey),) , 
       ],
      ) ; 
      
    }

    else if(type=="pdf")       
    {
      return Row(
       mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,   
       children: [Container( margin: EdgeInsets.symmetric(vertical: 1, horizontal: 8),child: IconButton(icon:Icon(Icons.picture_as_pdf),color: Colors.blue,onPressed: () { Get.to(PFDV(url:message));   })),
      
    Text(gettime(time),style: TextStyle(color: Colors.grey),) , 
       ],
      ) ; 
    }
  }
}

