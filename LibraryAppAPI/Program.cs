
using System.Data.SqlClient;
using Dapper;
using LibraryAppAPI.Model;

namespace LibraryAppAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            if (builder.Environment.IsDevelopment())
            {
                builder.Services.AddCors(options =>
                {
                    options.AddPolicy("AllowAllOrigins",
                        builder =>
                        {
                            builder
                                .AllowAnyOrigin()
                                .AllowAnyMethod()
                                .AllowAnyHeader();
                        });
                });
            }
            builder.Services.AddAuthorization();

            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();
            const string connStr =
                @"Data Source=(localdb)\local;Initial Catalog=LibraryApp;Integrated Security=True";

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
                app.UseCors("AllowAllOrigins");
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapGet("/libraryUsers", async () =>
            {
                var conn = new SqlConnection(connStr);
                const string userSql = "SELECT * FROM [User]";
                var users = await conn.QueryAsync<User>(userSql);
                return users;
            });
                //.WithName("LibraryUsers")
                //.WithOpenApi();
                app.MapGet("/libraryBooks", async () =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "SELECT * FROM [Book]";
                    var books = await conn.QueryAsync<Book>(sql);
                    return books;
                });
                //.WithName("LibraryBooks")
                //.WithOpenApi();
                app.MapGet("/libraryUser/{id}", async (Guid id) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "SELECT * FROM [User] WHERE UserID = @UserId";
                    var user = await conn.QueryAsync(sql, new { UserID = id });
                    return user;
                });
                app.MapPost("/libraryUser", async (User user) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "INSERT [User] (FirstName, LastName, Address, UserID, LoanCard) VALUES (@FirstName, @LastName, @Address, @UserID, 'Ingen')";
                    var newUserInsert = await conn.ExecuteAsync(sql, user);
                    return newUserInsert;
                });
                app.MapDelete("/libraryUser{id}", async (Guid id) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "DELETE FROM [User] WHERE UserID = @UserId";
                    var userToDelete = await conn.ExecuteAsync(sql, new { UserID = id });
                    return userToDelete;
                } );
               
                //.WithName("LibraryUser")
                //.WithOpenApi();
                app.MapGet("/libraryBook/{id}", async (Guid id) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "SELECT * FROM [Book] WHERE BookId = @BookId";
                    var book = await conn.QueryAsync(sql, new { BookId = id });
                    return book;
                });
                app.MapPost("/libraryBook", async (Book book) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "INSERT [Book] (BookId, Title, Author, Genre, Description, LoanedToId, LoanedOnDate) VALUES (@BookId, @Title, @Author, @Genre, @Description, NULL, NULL)";
                    var newBookInsert = await conn.ExecuteAsync(sql, book);
                    return newBookInsert;
                });
                app.MapDelete("/libraryBook{id}", async (Guid id) =>
                {
                    var conn = new SqlConnection(connStr);
                    const string sql = "DELETE FROM [Book] WHERE BookID = @BookId";
                    var bookToDelete = await conn.ExecuteAsync(sql, new { BookId = id });
                    return bookToDelete;
                });
                //.WithName("LibraryBook")
                //.WithOpenApi();

            app.Run();
        }
        
    }
}