using _1670_API.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<DataContext>(
opt => opt.UseSqlServer("Server=tcp:1670.database.windows.net,1433;Initial Catalog=1670_db;Persist Security Info=False;User ID=admin123;Password=Admin1670;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"));

var app = builder.Build();

app.UseCors(builder => builder
.AllowAnyHeader()
.AllowAnyMethod()
.SetIsOriginAllowed((host) => true)
.AllowCredentials());

app.UseSwagger();
app.UseSwaggerUI();

if (app.Environment.IsDevelopment())
{ }

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapGet("/", () => "OK, running!"); // For testing purposes

app.MapControllers();

app.Run();
