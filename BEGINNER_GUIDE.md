# 🚀 Beginner's Guide: Running the Courier Parcel Management System

This step-by-step guide will help you set up and run the project on your local machine with MongoDB.

---

## 📋 Prerequisites

Before starting, make sure you have these installed:

| Software | Version | Download Link |
|----------|---------|---------------|
| **Node.js** | v18 or higher | [nodejs.org](https://nodejs.org/) |
| **npm** | Comes with Node.js | - |
| **Git** | Any recent version | [git-scm.com](https://git-scm.com/) |
| **MongoDB** | v6+ (Local) OR MongoDB Atlas (Cloud) | [mongodb.com](https://www.mongodb.com/try/download/community) |

### ✅ Verify Installation
Open your terminal/command prompt and run:
```bash
node --version    # Should show v18.x.x or higher
npm --version     # Should show 9.x.x or higher
```

---

## 📁 Step 1: Project Structure Overview

```
courier-parcel-management-system/
├── client/          # React Frontend (Vite)
├── server/          # Node.js Backend (Express)
├── documentation/   # Project docs
└── package.json     # Root package
```

---

## 🗄️ Step 2: Set Up MongoDB Database

You have **2 options** - choose one:

### Option A: MongoDB Atlas (Cloud - Recommended for Beginners)

1. **Create Account**: Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) and sign up (free)

2. **Create a Cluster**:
   - Click "Build a Database"
   - Choose **FREE** tier (M0 Sandbox)
   - Select a region close to you
   - Click "Create Cluster" (takes 1-3 minutes)

3. **Create Database User**:
   - Go to "Database Access" in left sidebar
   - Click "Add New Database User"
   - Choose "Password" authentication
   - Enter username: `courier_admin`
   - Enter password: `YourSecurePassword123` (use a strong password!)
   - Click "Add User"

4. **Allow Network Access**:
   - Go to "Network Access" in left sidebar
   - Click "Add IP Address"
   - Click "Allow Access from Anywhere" (for development)
   - Click "Confirm"

5. **Get Connection String**:
   - Go to "Database" → Click "Connect"
   - Choose "Connect your application"
   - Copy the connection string. It looks like:
   ```
   mongodb+srv://courier_admin:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```
   - Replace `<password>` with your actual password
   - Add database name before `?`: 
   ```
   mongodb+srv://courier_admin:YourSecurePassword123@cluster0.xxxxx.mongodb.net/courier_parcel_system?retryWrites=true&w=majority
   ```

### Option B: Local MongoDB Installation

1. **Download MongoDB Community Server** from [mongodb.com](https://www.mongodb.com/try/download/community)

2. **Install** with default settings

3. **Start MongoDB**:
   - **Windows**: MongoDB runs as a service automatically
   - **Mac**: `brew services start mongodb-community`
   - **Linux**: `sudo systemctl start mongod`

4. **Your connection string**:
   ```
   mongodb://localhost:27017/courier_parcel_system
   ```

---

## ⚙️ Step 3: Configure the Backend Server

### 3.1 Navigate to Server Folder
```bash
cd server
```

### 3.2 Create Environment File
**Windows (Command Prompt):**
```cmd
copy env.example .env
```

**Windows (PowerShell) / Mac / Linux:**
```bash
cp env.example .env
```

### 3.3 Edit the `.env` File

Open `server/.env` in any text editor (VS Code, Notepad++, etc.) and configure these **REQUIRED** settings:

```env
# ============================================
# 🔴 REQUIRED - Server Configuration
# ============================================
PORT=5000
NODE_ENV=development

# ============================================
# 🔴 REQUIRED - MongoDB Connection
# ============================================
# Choose ONE based on your setup:

# For MongoDB Atlas (Cloud):
MONGODB_URI=mongodb+srv://courier_admin:YourSecurePassword123@cluster0.xxxxx.mongodb.net/courier_parcel_system?retryWrites=true&w=majority

# For Local MongoDB:
# MONGODB_URI=mongodb://localhost:27017/courier_parcel_system

# ============================================
# 🔴 REQUIRED - JWT Secret (for login/auth)
# ============================================
# Generate a random string - you can use any long random text
JWT_SECRET=my_super_secret_key_change_this_to_something_random_123456789
JWT_EXPIRE=24h

# ============================================
# 🟡 OPTIONAL - Email Notifications
# ============================================
# If you want email notifications to work:
MAIL_HOST=smtp.gmail.com
MAIL_PORT=465
MAIL_USER=your_email@gmail.com
MAIL_PASS=your_gmail_app_password
MAIL_SECURE=true
MAIL_FROM=your_email@gmail.com
MAIL_FROM_NAME=Courier Parcel System

# ============================================
# 🟡 OPTIONAL - CORS (for frontend connection)
# ============================================
SOCKET_CORS_ORIGIN=http://localhost:5173
CLIENT_ORIGIN=http://localhost:5173
```

### 📧 Setting Up Gmail for Email Notifications (Optional)

If you want email notifications to work:

1. **Enable 2-Factor Authentication** on your Gmail account
2. Go to [Google App Passwords](https://myaccount.google.com/apppasswords)
3. Select "Mail" and "Windows Computer"
4. Click "Generate"
5. Copy the 16-character password
6. Use this as `MAIL_PASS` in your `.env` file

---

## 🖥️ Step 4: Configure the Frontend Client

### 4.1 Navigate to Client Folder
```bash
cd client
```

### 4.2 Create Environment File (if needed)

Create a file named `.env` in the `client` folder:

```env
# Backend API URL
VITE_API_URL=http://localhost:5000/api

# Socket.IO URL
VITE_SOCKET_URL=http://localhost:5000

# Google Maps API Key (Optional - for map features)
# Get one free at: https://console.cloud.google.com/
VITE_GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

> 💡 **Note**: Maps work without Google API Key using OpenStreetMap, but Google Maps features need the API key.

---

## 🗺️ Step 4.3: Map Services Configuration

This project supports **two mapping options**:

### Option A: OpenStreetMap (FREE - No API Key Required) ✅

**OpenStreetMap is already configured and works out of the box!**

The project uses:
- **Leaflet.js** - For interactive maps
- **OpenStreetMap Tiles** - Free map tiles
- **Nominatim API** - Free geocoding (address → coordinates)

#### How It Works:
- Agent Dashboard uses OpenStreetMap for live location tracking
- No API key or account needed
- Completely free with no usage limits for development

#### Nominatim Geocoding (Built-in):
The backend already has a geocoding endpoint at `/api/geocode/search` that uses Nominatim:

```javascript
// Example: Convert address to coordinates
// GET /api/geocode/search?q=Dhaka,Bangladesh

// Response:
[{
  "lat": "23.8103",
  "lon": "90.4125",
  "display_name": "Dhaka, Bangladesh"
}]
```

#### ⚠️ Nominatim Usage Policy:
- Maximum 1 request per second
- Include a valid User-Agent header (already configured)
- For heavy usage, consider self-hosting or commercial alternatives

---

### Option B: Google Maps (Optional - For Advanced Features)

Google Maps provides additional features like:
- Optimized route directions
- Traffic-aware ETA
- Street View
- More accurate geocoding

#### Step 1: Create Google Cloud Account
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Sign in with your Google account
3. Click "Select a project" → "New Project"
4. Name it: `courier-parcel-system`
5. Click "Create"

#### Step 2: Enable Required APIs
1. Go to "APIs & Services" → "Library"
2. Search and enable these APIs:
   - **Maps JavaScript API** (for map display)
   - **Directions API** (for route calculation)
   - **Geocoding API** (for address lookup)
   - **Places API** (for address autocomplete)

#### Step 3: Create API Key
1. Go to "APIs & Services" → "Credentials"
2. Click "Create Credentials" → "API Key"
3. Copy your API key
4. (Recommended) Click "Edit API Key" to add restrictions:
   - **Application restrictions**: HTTP referrers
   - Add: `http://localhost:5173/*` and your production domain
   - **API restrictions**: Restrict to enabled APIs only

#### Step 4: Add to Environment
Add to `client/.env`:
```env
VITE_GOOGLE_MAPS_API_KEY=AIzaSyB1234567890abcdefghijklmnop
```

#### Step 5: Add to Backend (Optional)
If using server-side geocoding, add to `server/.env`:
```env
GOOGLE_MAPS_API_KEY=AIzaSyB1234567890abcdefghijklmnop
```

#### 💰 Google Maps Pricing:
- **$200 free credit** per month (covers ~28,000 map loads)
- For development/testing: Usually free
- Set up billing alerts to avoid unexpected charges

---

### 🔄 Switching Between Map Providers

| Feature | OpenStreetMap | Google Maps |
|---------|---------------|-------------|
| **Cost** | FREE | $200 free/month, then paid |
| **API Key** | Not required | Required |
| **Route Directions** | Basic (via Leaflet Routing) | Advanced with traffic |
| **Geocoding** | Nominatim (free) | More accurate |
| **Setup** | Works immediately | Requires account setup |

**Recommendation for Beginners**: Start with OpenStreetMap (no setup needed), then add Google Maps later if you need advanced features.

---

## 📦 Step 5: Install Dependencies

Open **2 terminals** (or command prompts):

### Terminal 1 - Install Server Dependencies:
```bash
cd server
npm install
```

### Terminal 2 - Install Client Dependencies:
```bash
cd client
npm install
```

Wait for both to complete (might take 2-5 minutes).

---

## 🌱 Step 6: Seed the Database (Create Test Users)

This creates default admin and agent accounts for testing:

```bash
cd server
npm run seed
```

**Expected Output:**
```
Connected to MongoDB
Created admin: admin@example.com
Created agent: agent1@example.com
```

### 📝 Default Test Accounts:

| Role | Email | Password |
|------|-------|----------|
| **Admin** | admin@example.com | admin123 |
| **Agent** | agent1@example.com | agent123 |

You can also **register new customers** through the app.

---

## 🚀 Step 7: Run the Application

### Start Both Servers:

**Terminal 1 - Start Backend:**
```bash
cd server
npm run dev
```
You should see:
```
Server running on http://localhost:5000
Connected to MongoDB
```

**Terminal 2 - Start Frontend:**
```bash
cd client
npm run dev
```
You should see:
```
VITE v7.x.x  ready in xxx ms

➜  Local:   http://localhost:5173/
➜  Network: http://192.168.x.x:5173/
```

---

## 🌐 Step 8: Access the Application

Open your browser and go to:

| URL | Description |
|-----|-------------|
| **http://localhost:5173** | Main Application |
| **http://localhost:5000/health** | Backend Health Check |

---

## 🔐 Step 9: Test the Application

### Login as Admin:
1. Go to http://localhost:5173
2. Click "Login"
3. Enter:
   - Email: `admin@example.com`
   - Password: `admin123`
4. You'll see the Admin Dashboard

### Login as Agent:
1. Use: `agent1@example.com` / `agent123`

### Register as Customer:
1. Click "Register"
2. Fill in your details
3. Select role: "Customer"
4. Create account and login

---

## 🧪 Testing the Full Flow

### As a Customer:
1. Login as a new customer
2. Book a parcel (fill pickup/delivery address)
3. View your bookings

### As an Admin:
1. Login as admin
2. See the new parcel in dashboard
3. Assign an agent to the parcel

### As an Agent:
1. Login as agent
2. See assigned parcel
3. Update status: Picked Up → In Transit → Delivered

### Track in Real-Time:
1. As customer, click "View" on your parcel
2. See live status updates when agent changes status!

---

## 🔧 Troubleshooting

### ❌ "Cannot connect to MongoDB"
- **Atlas**: Check your IP is whitelisted in Network Access
- **Local**: Make sure MongoDB service is running
- **Check**: Your connection string in `.env` is correct

### ❌ "Port 5000 already in use"
```bash
# Windows - Find and kill the process
netstat -ano | findstr :5000
taskkill /PID <PID_NUMBER> /F

# Or change PORT in server/.env to 5001
```

### ❌ "Module not found" errors
```bash
# Delete node_modules and reinstall
rm -rf node_modules
npm install
```

### ❌ CORS errors in browser
- Make sure `CLIENT_ORIGIN=http://localhost:5173` in server `.env`
- Restart the server after changing `.env`

### ❌ "Invalid token" or auth errors
- Clear browser localStorage: F12 → Application → Local Storage → Clear
- Try logging in again

---

## 📁 Quick Reference - File Locations

| What | Location |
|------|----------|
| Backend Environment | `server/.env` |
| Frontend Environment | `client/.env` |
| Database Models | `server/src/models/` |
| API Routes | `server/src/routes/` |
| React Pages | `client/src/pages/` |

---

## 🛑 Stopping the Application

Press `Ctrl + C` in both terminal windows to stop the servers.

---

## 📚 Next Steps

Once running, you can:
1. ✅ Explore the Admin Dashboard
2. ✅ Book parcels as a Customer
3. ✅ Track deliveries in real-time
4. ✅ Export reports (CSV/PDF)
5. ✅ Test QR code scanning

---

## 💡 Pro Tips

1. **Keep both terminals open** - you need both servers running
2. **Check the console** for errors if something doesn't work
3. **Restart servers** after changing `.env` files
4. **Use MongoDB Compass** to visually browse your database

---

## 🆘 Need Help?

1. Check the error message in terminal
2. Look at browser console (F12 → Console tab)
3. Verify your `.env` configuration
4. Make sure MongoDB is running and accessible

Happy coding! 🎉
