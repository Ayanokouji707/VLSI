# Task 1: Arithmetic Logic Unit (ALU)

## 📌 Objective
Design a basic **Arithmetic Logic Unit (ALU)** in Verilog that supports fundamental operations such as:
- Addition
- Subtraction
- AND
- OR
- NOT
- XOR
- Shift Left
- Shift Right

---

## 📂 Files
- `ALU.v` → Verilog module for the ALU (parameterized width).
- `ALU_tb.v` → Testbench to verify all ALU operations.
- `simulation/` → Waveform screenshots and logs (to be added after simulation).

---

## 🔧 Features
- **Parameterizable Width**: Currently set to 4 bits (`WIDTH = 4`).
- **Operations** (selected using `ALU_Sel` control):
  - `000` → ADD
  - `001` → SUB
  - `010` → AND
  - `011` → OR
  - `100` → NOT (on A)
  - `101` → XOR
  - `110` → Shift Left
  - `111` → Shift Right
- Outputs:
  - `ALU_Out` → result of operation
  - `CarryOut` → carry or borrow flag (for ADD/SUB/shift)

---

## ▶️ How to Simulate in Vivado
1. Open **Vivado** → Create a new RTL project.
2. Add `ALU.v` as **Design Source**.
3. Add `ALU_tb.v` as **Simulation Source**.
4. Set **`ALU_tb`** as the simulation top module.
5. Run **Behavioral Simulation**.
6. Observe signals: `A`, `B`, `ALU_Sel`, `ALU_Out`, `CarryOut`.

---

## 🖥️ Example Simulation
For inputs:
- `A = 1011` (11 in decimal)
- `B = 0101` (5 in decimal)

The testbench cycles through all operations (`ALU_Sel = 000 → 111`) and prints results:

