# IVD_Identity - GTA IV Identity System
IVD_Identity is a complete identity management system for GTA IV, inspired by ESX_Identity. It allows players to create and manage their in-game character, storing essential identity details in a MySQL database.

This script ensures that every player has a unique character name, surname sex and more which can be used across various roleplay systems.

# 🔧 Setting Up MySQL
Before running the server, configure your MySQL database connection inside:

```
/server/main.lua
```
Update the following line with your database details:

```
-- MYSQL LOGIN --
MySQL.Connect("IP", 33060, "DATABASE", "PASSWORD", "DATABASE")
```
Make sure to replace IP, DATABASE, and PASSWORD with your actual database credentials. This is required for the script to function properly.

# 🚀 Final Release & Compatibility
IVD_Identity is in its final release and is stable for use. It works as a standalone identity system and integrates smoothly with IVD_Core or other RP frameworks.

If you have any issues or suggestions, feel free to contribute or open a support request! 🚀
