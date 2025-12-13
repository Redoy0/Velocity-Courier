<div align="center">

# 🚀 Velocity Courier

### *Lightning-Fast Parcel Management System*

[![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black)](https://reactjs.org/)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![Socket.IO](https://img.shields.io/badge/Socket.IO-010101?style=for-the-badge&logo=socketdotio&logoColor=white)](https://socket.io/)
[![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue?style=flat-square" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square" alt="PRs Welcome">
  <img src="https://img.shields.io/badge/status-active-success?style=flat-square" alt="Status">
</p>

<p align="center">
A comprehensive logistics management system built with the <strong>MERN Stack</strong> featuring<br/>
real-time parcel tracking, role-based access control, and OpenStreetMap integration.
</p>

[Features](#-features) • [Installation](#-quick-start) • [API Docs](#-api-documentation) • [Contributing](#-contributing)

---

</div>

## ✨ Features

<table>
<tr>
<td width="50%">

### 🔐 Authentication & Security
- JWT-based authentication
- Role-based access control (Admin, Agent, Customer)
- Secure password hashing with bcryptjs
- Protected route middleware

</td>
<td width="50%">

### 📦 Parcel Management
- Multiple parcel types & sizes
- COD & Prepaid payment options
- Unique tracking codes
- Complete status lifecycle

</td>
</tr>
<tr>
<td width="50%">

### 🗺️ Real-time Tracking
- OpenStreetMap integration (FREE!)
- Live GPS location updates
- Interactive route visualization
- Socket.IO powered updates

</td>
<td width="50%">

### 📊 Analytics & Reports
- Dashboard with KPIs
- CSV & PDF exports
- Performance metrics
- Real-time statistics

</td>
</tr>
</table>

### 👥 Role-Based Dashboards

| 👨‍💼 **Admin** | 🚚 **Delivery Agent** | 👤 **Customer** |
|:---:|:---:|:---:|
| Analytics Dashboard | Assigned Parcels | Parcel Booking |
| Agent Assignment | Status Updates | Booking History |
| User Management | Live Location Sharing | Real-time Tracking |
| Report Generation | Interactive Maps | Public Tracking Links |

---

## 📁 Project Structure

```
🚀 Velocity-Courier/
│
├── 📋 README.md                    # Project documentation
├── 📋 BEGINNER_GUIDE.md            # Getting started guide
├── 📋 PROJECT_REPORT.md            # Project report
├── 📦 package.json                 # Root package configuration
├── 📬 postman_collection_api.json  # API collection for testing
├── 🚀 start-server.bat             # Quick start script (Windows)
│
├── 🔧 backend/                     # Backend API Server
│   ├── 📋 env.example              # Environment template
│   ├── 📋 ENVIRONMENT_SETUP.md     # Setup instructions
│   ├── 📦 package.json             # Backend dependencies
│   ├── ⚡ vercel.json              # Vercel deployment config
│   │
│   ├── 📂 scripts/
│   │   └── 🌱 seed.js              # Database seeding script
│   │
│   └── 📂 src/
│       ├── 🚀 index.js             # Server entry point
│       │
│       ├── 📂 config/
│       │   └── 🍃 mongoose.js      # MongoDB connection
│       │
│       ├── 📂 controllers/         # Business logic
│       │   ├── 📊 analytics.controller.js
│       │   ├── 🔐 auth.controller.js
│       │   └── 📦 parcel.controller.js
│       │
│       ├── 📂 middleware/
│       │   └── 🛡️ auth.js           # JWT authentication
│       │
│       ├── 📂 models/              # Database schemas
│       │   ├── 📦 Parcel.js
│       │   └── 👤 User.js
│       │
│       ├── 📂 routes/              # API endpoints
│       │   ├── 📊 analytics.routes.js
│       │   ├── 🚚 assignment.routes.js
│       │   ├── 🔐 auth.routes.js
│       │   ├── 🗺️ geocode.routes.js
│       │   ├── 📦 parcel.routes.js
│       │   └── 👤 user.routes.js
│       │
│       ├── 📂 services/
│       │   └── 🔌 socket.js        # Real-time communication
│       │
│       └── 📂 utils/
│           ├── 🔑 jwt.js           # Token utilities
│           └── 📧 mailer.js        # Email service
│
├── 🎨 frontend/                    # React Frontend Application
│   ├── 📋 eslint.config.js         # Linting configuration
│   ├── 📄 index.html               # HTML entry point
│   ├── 📦 package.json             # Frontend dependencies
│   ├── ⚙️ postcss.config.js        # PostCSS configuration
│   ├── 📋 README.md                # Frontend documentation
│   ├── 🎨 tailwind.config.js       # Tailwind CSS config
│   ├── ⚡ vite.config.js           # Vite bundler config
│   │
│   ├── 📂 public/
│   │   └── 🔄 _redirects           # Netlify redirects
│   │
│   └── 📂 src/
│       ├── 🌐 api.js               # API client
│       ├── 🎨 App.css              # App styles
│       ├── ⚛️ App.jsx               # Root component
│       ├── 🎨 index.css            # Global styles
│       ├── 🚀 main.jsx             # React entry point
│       ├── 🔌 socket.js            # Socket.IO client
│       │
│       ├── 📂 assets/              # Static assets
│       │
│       ├── 📂 components/          # Reusable components
│       │   ├── 👨‍💼 AdminPanel.jsx
│       │   └── 🌍 LanguageSwitcher.jsx
│       │
│       ├── 📂 context/             # React contexts
│       │   ├── 🔐 AuthContext.jsx
│       │   └── 🌍 LanguageContext.jsx
│       │
│       ├── 📂 pages/               # Route pages
│       │   ├── 📍 AdminAgentTracking.jsx
│       │   ├── 📊 AdminDashboard.jsx
│       │   ├── 🚚 AgentDashboard.jsx
│       │   ├── 📦 AgentParcelDetails.jsx
│       │   ├── ✅ AgentParcelPickUpConfirmation.jsx
│       │   ├── 📷 AgentParcelPickUpScan.jsx
│       │   ├── 👤 CustomerDashboard.jsx
│       │   ├── 📦 CustomerParcelDetail.jsx
│       │   ├── 📷 CustomerQrScanner.jsx
│       │   ├── 🔐 Login.jsx
│       │   ├── 🗺️ MapJavascriptRoute.jsx
│       │   ├── 📦 ParcelDetailView.jsx
│       │   ├── 🗺️ ParcelRoute.jsx
│       │   ├── 🌐 PublicTrack.jsx
│       │   ├── 📍 PushCurrentLocation.jsx
│       │   ├── 🗺️ PushInMap.jsx
│       │   ├── 🔍 TrackParcel.jsx
│       │   └── 🌐 TrackPublicParcel.jsx
│       │
│       ├── 📂 routes/
│       │   └── 🛡️ ProtectedRoute.jsx
│       │
│       └── 📂 translations/        # i18n support
│           ├── 🇧🇩 bn.js            # Bengali
│           ├── 🇺🇸 en.js            # English
│           └── 📋 index.js


```

---

## 🛠️ Tech Stack

<div align="center">

| Layer | Technologies |
|:---:|:---|
| **Frontend** | React 19, Vite, Tailwind CSS, React Router v7, Leaflet.js |
| **Backend** | Node.js 20+, Express.js, Socket.IO, JWT |
| **Database** | MongoDB with Mongoose ODM |
| **DevOps** | Vercel, ESLint, PostCSS |
| **Maps** | OpenStreetMap + Leaflet (100% Free!) |

</div>

---

## 🚀 Quick Start

### Prerequisites

```bash
✅ Node.js 20+
✅ MongoDB (Local or Atlas)
✅ Git
```

### ⚡ One-Click Setup (Windows)

```bash
# Clone and run
git clone <repository-url>
cd Velocity-Courier
start-server.bat
```

### 📝 Manual Setup

<details>
<summary><b>1️⃣ Clone & Install</b></summary>

```bash
# Clone repository
git clone <repository-url>
cd Velocity-Courier

# Install all dependencies
npm install
cd backend && npm install
cd ../frontend && npm install
```

</details>

<details>
<summary><b>2️⃣ Environment Configuration</b></summary>

**Backend** (`backend/.env`):
```env
PORT=5000
MONGODB_URI=mongodb://127.0.0.1:27017/velocity_courier
JWT_SECRET=your_super_secret_jwt_key_here
CLIENT_ORIGIN=http://localhost:5173
SOCKET_CORS_ORIGIN=http://localhost:5173
```

**Frontend** (`frontend/.env`):
```env
VITE_API_BASE=http://localhost:5000/api
VITE_SOCKET_URL=http://localhost:5000
```

</details>

<details>
<summary><b>3️⃣ Database Setup & Seeding</b></summary>

```bash
# Start MongoDB (if local)
mongod

# Seed sample data
cd backend && npm run seed
```

</details>

<details>
<summary><b>4️⃣ Start Development Servers</b></summary>

```bash
# Terminal 1: Backend
cd backend && npm run dev

# Terminal 2: Frontend
cd frontend && npm run dev
```

</details>

### 🌐 Access Points

| Service | URL |
|:---|:---|
| 🎨 Frontend | http://localhost:5173 |
| 🔧 Backend API | http://localhost:5000 |
| 💚 Health Check | http://localhost:5000/health |

---

## 📚 API Documentation

### 🔐 Authentication

| Method | Endpoint | Description |
|:---:|:---|:---|
| `POST` | `/api/auth/register` | User registration |
| `POST` | `/api/auth/login` | User authentication |

### 📦 Parcels

| Method | Endpoint | Description |
|:---:|:---|:---|
| `GET` | `/api/parcels` | List parcels (role-aware) |
| `POST` | `/api/parcels` | Create new parcel |
| `GET` | `/api/parcels/:id` | Get parcel details |
| `DELETE` | `/api/parcels/:id` | Delete parcel (admin) |
| `POST` | `/api/parcels/:id/assign` | Assign delivery agent |
| `POST` | `/api/parcels/:id/status` | Update parcel status |
| `POST` | `/api/parcels/:id/location` | Update location |
| `GET` | `/api/parcels/track/:code` | Public tracking |

### 📊 Analytics

| Method | Endpoint | Description |
|:---:|:---|:---|
| `GET` | `/api/analytics/dashboard` | Dashboard metrics |
| `GET` | `/api/analytics/export/csv` | Export to CSV |
| `GET` | `/api/analytics/export/pdf` | Export to PDF |

### 👥 Users

| Method | Endpoint | Description |
|:---:|:---|:---|
| `GET` | `/api/users` | List users (admin) |
| `GET` | `/api/users/:id` | Get user details |

---

## 🔐 User Roles & Permissions

<table>
<tr>
<td align="center" width="33%">

### 👨‍💼 Admin
- ✅ Full system access
- ✅ User management
- ✅ Agent assignment
- ✅ Analytics & reports
- ✅ Parcel deletion

</td>
<td align="center" width="33%">

### 🚚 Delivery Agent
- ✅ View assigned parcels
- ✅ Update parcel status
- ✅ Share live location
- ✅ Access delivery routes
- ❌ Admin features

</td>
<td align="center" width="33%">

### 👤 Customer
- ✅ Book new parcels
- ✅ View booking history
- ✅ Track in real-time
- ✅ Public tracking links
- ❌ Agent/Admin features

</td>
</tr>
</table>

---

## 🗺️ Mapping Features

<div align="center">

| Feature | Description |
|:---:|:---|
| 🆓 **100% Free** | No Google Maps API costs |
| 📍 **Real-time GPS** | Live agent tracking |
| 🛣️ **Route Visualization** | Pickup to delivery |
| 🎯 **Interactive Markers** | Clickable locations |
| 📱 **Mobile Friendly** | Responsive maps |

</div>

---

## 🔌 Real-time Features

```
📡 Socket.IO Events
├── 📦 parcel:update      → Status changes
├── 📍 location:update    → GPS coordinates
├── 🚚 agent:tracking     → Live positions
└── 🔔 notification:new   → Instant alerts
```

---

## 🧪 Development Scripts

### Backend
```bash
npm run dev      # 🔄 Development server
npm run seed     # 🌱 Seed database
npm start        # 🚀 Production server
```

### Frontend
```bash
npm run dev      # 🔄 Development server
npm run build    # 📦 Production build
npm run lint     # 🔍 Code linting
npm run preview  # 👁️ Preview build
```

---

## 🚀 Deployment

<table>
<tr>
<td width="50%">

### Backend (Vercel)
```bash
# Auto-deploys with vercel.json
vercel --prod
```
- ✅ Serverless functions
- ✅ Environment variables
- ✅ MongoDB Atlas ready

</td>
<td width="50%">

### Frontend (Any Static Host)
```bash
npm run build
# Deploy dist/ folder
```
- ✅ Netlify / Vercel
- ✅ GitHub Pages
- ✅ AWS S3 / CloudFront

</td>
</tr>
</table>

---

## 🔒 Security Features

| Feature | Implementation |
|:---|:---|
| 🔑 Authentication | JWT with expiration |
| 🔐 Password | bcryptjs (10 salt rounds) |
| 🛡️ CORS | Configured origins |
| ✅ Validation | express-validator |
| 🚫 Access Control | Role middleware |

---

## 🤝 Contributing

<div align="center">

```
1️⃣ Fork → 2️⃣ Branch → 3️⃣ Code → 4️⃣ Test → 5️⃣ PR
```

</div>

1. **Fork** the repository
2. **Create** feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** changes (`git commit -m 'Add AmazingFeature'`)
4. **Push** to branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

---

## 🔮 Roadmap

- [ ] 📱 QR Code scanning for parcels
- [ ] 📧 Email/SMS notifications
- [ ] 💳 Payment gateway integration
- [ ] 📊 Advanced analytics with ML
- [ ] 📱 React Native mobile app
- [ ] 🏪 Multi-warehouse support

---

## 📄 License

<div align="center">

This project is licensed under the **MIT License**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>

---

## 🆘 Support

<div align="center">

**Need Help?**

[![Issues](https://img.shields.io/badge/Report-Issues-red?style=for-the-badge&logo=github)](https://github.com/your-repo/issues)
[![Discussions](https://img.shields.io/badge/Join-Discussions-blue?style=for-the-badge&logo=github)](https://github.com/your-repo/discussions)

</div>

---

<div align="center">

### ⭐ Star this repo if you found it helpful!

<br/>

**Built with ❤️ using the MERN Stack**

<br/>

[![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=flat-square&logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![Express.js](https://img.shields.io/badge/Express-000000?style=flat-square&logo=express&logoColor=white)](https://expressjs.com/)
[![React](https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black)](https://reactjs.org/)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white)](https://nodejs.org/)

</div>
