component accessors='true'
{
    property name="userID";
    property name="firstName";
    property name="lastName";
    property name="Email";
    property name="Password";

    this.constraints = {
        firstName = {
            required: true
        },
        lastName = {
            required: true
        }
    };

    public any function init()
    {
        return this;
    }
}