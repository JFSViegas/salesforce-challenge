public class ResponseDecoder {
    public String balance;
    public String client;
    public String price;
    public String sourceLanguage;
    public String status;
    public String targetLanguage;
    public String text;
    public String textFormat;
    public String translatedText;
    public String uID;
    
    public static ResponseDecoder decode(String res){
        return (ResponseDecoder) System.JSON.deserialize(res, ResponseDecoder.class);
    }
}