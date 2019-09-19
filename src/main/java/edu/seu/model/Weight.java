package edu.seu.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter(value = AccessLevel.PUBLIC)
@Setter(value = AccessLevel.PUBLIC)
public class Weight {
    private String type;
    private double industry;
    private double market;
    private double technology;
    private double hr;
    private double policy;
    private double capital;
    private double culture;

    public Weight(){

    }

    @Override
    public String toString() {
        return "Weight{" +
                "type=" + type +
                ", industry='" + industry + '\'' +
                ", market='" + market + '\'' +
                ", technology='" + technology + '\'' +
                ", hr=" + hr +
                ", policy=" + policy +
                ", capital=" + capital +
                ", culture=" + culture +
                '}';
    }
}
