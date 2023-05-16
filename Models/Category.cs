﻿using System.Text.Json.Serialization;

namespace _1670_API.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        [JsonIgnore]
        public List<Book> Books { get; set; }
    }
}
