namespace LibraryAppAPI.Model;

public class Book
{
    public Guid BookId { get; set; }
    public string Title { get; set; }
    public string Author { get; set; }
    public string Genre { get; set; }
    public string Description { get; set; }
    public Guid? LoanedToId { get; set; }
    public string? LoanedOnDate { get; set; }
}