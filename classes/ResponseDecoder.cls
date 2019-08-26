public class ResponseDecoder {
    public String order_number;
    public String price;
    public String source_language;
    public String status;
    public String target_language;
    public String text;
    public String text_format;
    public String translatedText;
    public String uid;
       
    public ResponseDecoder decode(String res){
        system.debug(res);
        ResponseDecoder obj = (ResponseDecoder) System.JSON.deserialize(res, ResponseDecoder.class);
        system.debug(obj);
        return obj;
    }
}