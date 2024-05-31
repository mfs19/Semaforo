library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;

entity stage_e is
    port(
        clock         : in  std_logic;
        reset         : in  std_logic;
        -- ID/EX regs inputs:
        data_reg_s1_e : in std_logic_vector(31 downto 0);
        data_reg_s2_e : in std_logic_vector(31 downto 0);
        pc_e          : in std_logic_vector(31 downto 0);
        imm_ext_e     : in std_logic_vector(31 downto 0);

        -- ID/EX control regs:
        alu_control_e : in std_logic_vector(2 downto 0);
        alu_src_e     : in std_logic;
        -- Inputs of forwarding mux
        alu_result_m  : in std_logic_vector(31 downto 0);
        result_w      : in std_logic_vector(31 downto 0);
        -- Forwarding unit:
        forwarding_a_e : in std_logic_vector(1 downto 0);
        forwarding_b_e : in std_logic_vector(1 downto 0);
        -- Outputs:
        ALUResultE_out   : out  std_logic_vector(31 downto 0);
        WriteDataE_out   : out  std_logic_vector(31 downto 0);
        PCPlus4E_out      : out  std_logic_vector(31 downto 0);
        RdE_out           : out  std_logic_vector(4 downto 0);

    );
end entity stage_e;


entity BMEM is
    port (
        clk    : in std_logic;
        reset  : in std_logic;
        enable : in std_logic;
        --sinais da UC
        RegWriteE_in : in std_logic;
        ResultSrcE_in : in std_logic_vector(1 downto 0);
        MemWriteE_in : in std_logic;
        --sinais do FD
        ALUResultE_in : in std_logic_vector(31 downto 0);
        WriteDataE_in : in std_logic_vector(31 downto 0);
        RdE_in : in std_logic_vector(4 downto 0);
        PCPlus4E_in: in std_logic_vector(31 downto 0);
        --saídas
        RegWriteM_out : out std_logic;
        ResultSrcM_out : out std_logic_vector(1 downto 0);
        MemWriteM_out : out std_logic;
        BMEM_aluOut : out std_logic_vector(31 downto 0);
        BMEM_emWord : out std_logic_vector(31 downto 0);
        BMEM_writeDataReg : out std_logic_vector(4 downto 0);
        BMEM_Plus4Addr: out std_logic_vector(31 downto 0)
    );
end entity pipe_regE;
