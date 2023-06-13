using System.Collections.ObjectModel;

namespace LibraryAppAPI.Model;

public class User
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public Guid UserID { get; set; }
    public string? LoanCard { get; set; }
  }