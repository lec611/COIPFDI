package edu.seu.exceptions;


import edu.seu.base.CodeEnum;

public class COIPFDIExceptions extends Exception{
    CodeEnum codeEnum;

    public CodeEnum getCodeEnum(){return codeEnum;}

    public void setCodeEnum(CodeEnum codeEnum){
        this.codeEnum = codeEnum;
    }
    public COIPFDIExceptions(){
    }
    public COIPFDIExceptions(CodeEnum codeEnum, String msg)
    {
        super(msg);
        this.codeEnum = codeEnum;
    }
    public COIPFDIExceptions(String msg)
    {
        super(msg);
    }

}
