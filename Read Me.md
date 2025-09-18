# Mechanism Analysis and Simulation (Machine Dynamics Project)  

## 📌 Project Overview  
This project investigates the kinematic and dynamic analysis of a planar mechanism using manual calculations, SolidWorks Motion Analysis, ADAMS, and MATLAB.  
The report covers:  
1. Graphical and analytical methods for position, velocity, and acceleration.  
2. Static and dynamic force analysis.  
3. Simulation of the mechanism in SolidWorks and ADAMS for verification.  
4. MATLAB implementation for dynamic analysis and plotting of results.  

---

## 🎯 Objectives  
- Perform position, velocity, and acceleration analysis using graphical and analytical methods.  
- Conduct static and dynamic force analysis of the mechanism.  
- Simulate the mechanism in SolidWorks and extract motion plots.  
- Validate results with ADAMS multibody simulation.  
- Implement MATLAB code to automate dynamic analysis and generate plots.  

---

## 🛠 Tools & Software  
- SolidWorks Motion Analysis – CAD modeling and kinematic simulation.  
- ADAMS – Multibody simulation for kinematic and dynamic validation.  
- MATLAB – Analytical coding and plotting of results.  
- Graphical/Analytical Methods – Manual derivation of kinematic and dynamic relations.  

---

## 📐 Methodology  

### 1. Graphical Analysis  
- Position of joints found using geometric construction.  
- Velocity and acceleration diagrams drawn to compute angular/linear velocities and accelerations.  

### 2. Analytical Analysis  
- Derived equations for position, velocity, and acceleration.  
- Static analysis performed by applying external forces (e.g., 500 lb on link 2).  
- Dynamic analysis carried out by assigning masses/inertias to links and applying external forces (e.g., 30 lb).  

### 3. SolidWorks Simulation  
- Each link modeled and assembled with proper constraints.  
- Initial velocity applied to input link.  
- Motion Analysis module used to extract position, velocity, and acceleration plots.  

### 4. ADAMS Simulation  
- Mechanism reconstructed with revolute joints.  
- Simulations performed both without friction and with joint friction.  
- Plots generated for angular/linear velocities, accelerations, and reaction forces.  

### 5. MATLAB Simulation  
- Wrote MATLAB scripts to calculate angular velocities, accelerations, and forces.  
- Used symbolic equations and numerical solving for link kinematics.  
- Generated plots for angular motion, velocity, and acceleration of each link.  

---

## 📊 Results  
- Graphical & Analytical methods gave consistent results with small differences due to drawing errors.  
- SolidWorks results confirmed manual analysis with close agreement.  
- ADAMS simulations validated kinematics and provided detailed dynamic force analysis.  
- MATLAB implementation successfully automated the process and produced plots for all link motions.  

### Simulation Outputs  
- ![Angular Displacement of Links](ADAMS/Plots/Link%202/Angular%20Acceleration%20Z%20Link%202.jpg)  
- ![Angular Velocity of Links](ADAMS/Plots/Link%202/Angular%20Velocity%20Z%20Link%202.jpg)  
- ![Angular Acceleration of Links](ADAMS/Plots/Link%202/Ax%20Ay%20Az%20Projection%20Angles%20Z%20Link%202.jpg)  
- ![Linear Velocity of Joints](ADAMS/Plots/Link%202/Translational%20Velocity%20Z%20Link%202.jpg)  
- ![Linear Acceleration of Joints](ADAMS/Plots/Link%202/Translational%20Acceleration%20Z%20Link%202.jpg)  
- ![ADAMS Force Analysis](ADAMS/Plots/Link%202/Element%20Force%20X%20Link%202.jpg)  

---

## 📂 Repository Structure

├── SOLIDWORKS/ # SolidWorks assembly and Motion Analysis files

├── ADAMS/ # ADAMS simulation files

├── ADAMS/ # MATLAB scripts for dynamic analysis

└── README.md # This file


---

## 🔬 Applications  
- Educational use in machine dynamics and mechanism design courses.  
- Demonstrating consistency between manual, CAD-based, and simulation approaches.  
- Industrial relevance in linkage design, robotics, and mechanical systems.  

---

## 👨‍🎓 Author  

- Mohammad Mahdi Khademi
- Negar Naghavian
- Supervised by: Dr. Mohammad Shahbazi  

Course: Machine Dynamics 

---

## 📖 References  
- Machine Dynamics textbooks and course lecture notes.  
- SolidWorks and ADAMS software documentation.  
- MATLAB documentation for symbolic/numerical solvers.
