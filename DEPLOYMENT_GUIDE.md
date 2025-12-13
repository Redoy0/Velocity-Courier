# 🚀 Free Deployment Guide - Velocity Courier

Complete guide to deploy your MERN stack application **100% FREE** with all functionality.

---

## 📋 Overview

| Service | Platform | Free Tier |
|---------|----------|-----------|
| 🗄️ Database | MongoDB Atlas | 512MB Free Forever |
| 🔧 Backend | Render | 750 hrs/month |
| 🎨 Frontend | Netlify | Unlimited |

---

## Step 1: 🗄️ Setup MongoDB Atlas (Free Database)

### 1.1 Create Account
1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register)
2. Sign up with Google or Email
3. Choose **FREE** tier (M0 Sandbox)

### 1.2 Create Cluster
1. Click **"Build a Database"**
2. Select **FREE - Shared** option
3. Choose provider: **AWS**
4. Select region closest to you (e.g., `us-east-1`)
5. Cluster name: `velocity-courier`
6. Click **"Create Cluster"** (takes 1-3 minutes)

### 1.3 Setup Database Access
1. Go to **"Database Access"** in sidebar
2. Click **"Add New Database User"**
3. Authentication: **Password**
4. Username: `velocity_admin`
5. Password: Generate a secure password (SAVE THIS!)
6. Database User Privileges: **Read and write to any database**
7. Click **"Add User"**

### 1.4 Setup Network Access
1. Go to **"Network Access"** in sidebar
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"** (0.0.0.0/0)
4. Click **"Confirm"**

### 1.5 Get Connection String
1. Go to **"Database"** → Click **"Connect"**
2. Choose **"Connect your application"**
3. Driver: **Node.js**, Version: **6.0 or later**
4. Copy the connection string:
```
mongodb+srv://velocity_admin:<password>@velocity-courier.xxxxx.mongodb.net/?retryWrites=true&w=majority
```
5. Replace `<password>` with your actual password
6. Add database name before `?`:
```
mongodb+srv://velocity_admin:YOUR_PASSWORD@velocity-courier.xxxxx.mongodb.net/velocity_courier?retryWrites=true&w=majority
```

---

## Step 2: 🔧 Deploy Backend on Render

### 2.1 Prepare Backend for Deployment

Create `backend/render.yaml`:
```yaml
services:
  - type: web
    name: velocity-courier-api
    env: node
    buildCommand: npm install
    startCommand: node src/index.js
    envVars:
      - key: NODE_ENV
        value: production
```

### 2.2 Update Backend for Production

Make sure your `backend/src/index.js` has these settings:

```javascript
// CORS configuration for production
const corsOptions = {
  origin: process.env.CLIENT_ORIGIN || 'http://localhost:5173',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
};
```

### 2.3 Deploy to Render

1. Go to [Render](https://render.com) and sign up (use GitHub)
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository
4. Configure:
   - **Name**: `velocity-courier-api`
   - **Region**: Choose nearest
   - **Branch**: `main`
   - **Root Directory**: `backend`
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `node src/index.js`

### 2.4 Set Environment Variables on Render

Go to **Environment** tab and add:

| Key | Value |
|-----|-------|
| `NODE_ENV` | `production` |
| `PORT` | `10000` |
| `MONGODB_URI` | `mongodb+srv://velocity_admin:PASSWORD@velocity-courier.xxxxx.mongodb.net/velocity_courier?retryWrites=true&w=majority` |
| `JWT_SECRET` | `your-super-long-random-secret-key-here-make-it-64-chars` |
| `CLIENT_ORIGIN` | `https://your-app.netlify.app` (update after frontend deploy) |
| `SOCKET_CORS_ORIGIN` | `https://your-app.netlify.app` |

5. Click **"Create Web Service"**
6. Wait for deployment (5-10 minutes)
7. Your API URL: `https://velocity-courier-api.onrender.com`

> ⚠️ **Note**: Free Render services sleep after 15 min inactivity. First request may take 30-60 seconds.

---

## Step 3: 🎨 Deploy Frontend on Netlify

### 3.1 Prepare Frontend for Production

Create `frontend/.env.production`:
```env
VITE_API_BASE=https://velocity-courier-api.onrender.com/api
VITE_SOCKET_URL=https://velocity-courier-api.onrender.com
```

### 3.2 Update `frontend/netlify.toml`:
```toml
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

### 3.3 Deploy to Netlify

**Option A: Drag & Drop**
1. Run locally: `cd frontend && npm run build`
2. Go to [Netlify](https://app.netlify.com)
3. Drag the `frontend/dist` folder to deploy

**Option B: Git Integration (Recommended)**
1. Go to [Netlify](https://app.netlify.com) and sign up with GitHub
2. Click **"Add new site"** → **"Import an existing project"**
3. Connect GitHub and select your repo
4. Configure:
   - **Base directory**: `frontend`
   - **Build command**: `npm run build`
   - **Publish directory**: `frontend/dist`

### 3.4 Set Environment Variables on Netlify

Go to **Site settings** → **Environment variables**:

| Key | Value |
|-----|-------|
| `VITE_API_BASE` | `https://velocity-courier-api.onrender.com/api` |
| `VITE_SOCKET_URL` | `https://velocity-courier-api.onrender.com` |

5. Trigger a new deploy

---

## Step 4: 🔗 Update CORS Settings

After both are deployed, update Render environment variables:

| Key | Value |
|-----|-------|
| `CLIENT_ORIGIN` | `https://your-actual-app.netlify.app` |
| `SOCKET_CORS_ORIGIN` | `https://your-actual-app.netlify.app` |

---

## Step 5: 🌱 Seed Production Database

### Option 1: Run seed script locally pointing to Atlas

```bash
cd backend
# Create a temp .env with production MongoDB URI
set MONGODB_URI=mongodb+srv://velocity_admin:PASSWORD@velocity-courier.xxxxx.mongodb.net/velocity_courier
npm run seed
```

### Option 2: Use MongoDB Compass
1. Download [MongoDB Compass](https://www.mongodb.com/products/compass)
2. Connect using your Atlas connection string
3. Import data manually

---

## 🎉 Final URLs

| Service | URL |
|---------|-----|
| 🎨 Frontend | `https://your-app.netlify.app` |
| 🔧 Backend API | `https://velocity-courier-api.onrender.com` |
| 🔧 Health Check | `https://velocity-courier-api.onrender.com/health` |
| 🗄️ Database | MongoDB Atlas Dashboard |

---

## 🔧 Troubleshooting

### Backend not starting?
- Check Render logs for errors
- Verify MongoDB connection string
- Ensure all env variables are set

### CORS errors?
- Update `CLIENT_ORIGIN` on Render
- Make sure URLs don't have trailing slashes

### Socket.IO not connecting?
- Render free tier supports WebSockets ✅
- Check `SOCKET_CORS_ORIGIN` matches frontend URL

### Database connection failed?
- Verify IP whitelist includes `0.0.0.0/0`
- Check username/password
- Ensure database name is in connection string

### Slow first load?
- Normal for free tier - services sleep after 15 min
- Consider upgrading or use UptimeRobot to ping every 14 min

---

## 💡 Pro Tips

### Keep Backend Awake (Free)
Use [UptimeRobot](https://uptimerobot.com) to ping your backend every 14 minutes:
1. Create free account
2. Add HTTP(s) monitor
3. URL: `https://velocity-courier-api.onrender.com/health`
4. Interval: 14 minutes

### Custom Domain (Free)
Both Netlify and Render support free custom domains!

---

## 📊 Free Tier Limits

| Service | Limit | Notes |
|---------|-------|-------|
| MongoDB Atlas | 512 MB storage | More than enough for testing |
| Render | 750 hrs/month | ~31 days continuous |
| Netlify | 100 GB bandwidth | Plenty for most apps |

---

## 🚀 Alternative Free Hosting Options

### Backend Alternatives
| Platform | Pros | Cons |
|----------|------|------|
| **Railway** | Easy, fast deploys | $5 credit/month limit |
| **Cyclic** | No cold starts | 100k requests/month |
| **Vercel** | Great DX | Serverless only (no WebSocket) |

### Frontend Alternatives
| Platform | Pros | Cons |
|----------|------|------|
| **Vercel** | Fastest, great DX | - |
| **GitHub Pages** | Free forever | Static only |
| **Cloudflare Pages** | Unlimited bandwidth | Slight learning curve |

---

**Happy Deploying! 🎉**
