﻿namespace _1670_API.Models
{
    public class Account
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }

        public ICollection<Order> Orders { get; } = new List<Order>();
        public ICollection<CartItem> CartItems { get; } = new List<CartItem>();
    }
}