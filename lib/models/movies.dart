// class Movies{
//     int _id;
//     String _url;
//     String _title;
//     String _director;

//     Movies(this._url, this._title, this._director);
//     Movies.withId(this._id, this._url, this._title, this._director);

//     int get id => _id;
//     String get url => _url;
//     String get title => _title;
//     String get director => _director;

//     set title(String newTitle){
//         this._title = newTitle;
//     }

//     set url(String newUrl){
//         this._url = newUrl;
//     }

//     set director(String newDirector){
//         this._director = newDirector;
//     }

//     Map<String, dynamic> toMap(){
//         var map = Map<String, dynamic>();

//         if(id != null){
//             map['id'] = _id;
//         }
//         map['title'] = _title;
//         map['url'] = _url;
//         map['director'] = _director;

//         return map;
//     }

//     Movies.fromMapObject(Map<String,dynamic> map){
//         this._id = map['id'];
//         this._title = map['title'];
//         this._url = map['url'];
//         this._director = map['director'];
//     }
    
// }