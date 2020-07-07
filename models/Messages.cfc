component singleton accessors='true'
{
    property name="MessageID";
    property name="UserID";
    property name="MessageBody";
    property name="Subject";
    property name="dateTimeCreated";

    this.constraints = {
        MessageBody = {
            required: true
        },
        Subject = {
            required: true
        },
        UserID = {
            required: true,
            type: "numeric"
        }
    };

    public any function init()
    {
        return this;
    }


}