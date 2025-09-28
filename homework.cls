\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2025/09/28 V1.0 Custom Homework Class]

% --- 继承文档类 ---
\LoadClass[12pt]{ctexart} % 基于 ctexart 以支持中文和标准结构

% --- 宏包加载 ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{amsmath,amssymb}
\RequirePackage{amsthm} % 提供 proof 环境
\RequirePackage{multicol}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{siunitx}
\RequirePackage{cancel}
\RequirePackage{graphicx}
\RequirePackage{pgfplots}
\RequirePackage{listings}
\RequirePackage{tikz}
\RequirePackage[
    colorlinks=true,        % 使用颜色而不是边框来标识链接
    linkcolor=blue,         % 内部链接颜色 (\eqref, \ref)
    citecolor=green,        % 引用链接颜色 (\cite)
    urlcolor=cyan,          % URL链接颜色
    pdfborder={0 0 0}       % 将边框宽度设为 0
]{hyperref} 

% --- 全局设置 ---
\pgfplotsset{width=10cm,compat=1.9}

% --- 变量定义 (使用 \newcommand 代替 \def，并确保不冲突) ---
\newcommand{\@class}{课程名称}
\newcommand{\@examnum}{作业编号}
\newcommand{\@studentname}{姓名}
\newcommand{\@studentID}{学号}

% --- 用户命令：设置作业信息 ---
\newcommand{\setclass}[1]{\renewcommand{\@class}{#1}}
\newcommand{\setexamnum}[1]{\renewcommand{\@examnum}{#1}}
\newcommand{\setstudentname}[1]{\renewcommand{\@studentname}{#1}}
\newcommand{\setstudentid}[1]{\renewcommand{\@studentID}{#1}}

% --- 作业头部结构 (\maketitle 替代) ---
\renewcommand{\maketitle}{%
    \thispagestyle{empty} % 首页不显示页码
    \noindent
    \begin{tabular*}{\textwidth}{l @{\extracolsep{\fill}} r @{\extracolsep{6pt}} l}
    \textbf{\@class} & \textbf{姓名：} & \textit{\@studentname}\\
    \textbf{\@examnum} & \textbf{学号：} & \text{\@studentID}\\
    \textbf{日期：} \zhtoday &&\\
    \end{tabular*}\\
    \rule[2ex]{\textwidth}{2pt}\par\vskip 1em % 添加一条水平线和一些垂直间距
}

% --- 自定义题目环境 ---

% 定义一个名为 'question' 的新计数器，继承自 'section' 的样式
\newcounter{question}[section] 

% 定义 question 编号的显示格式（例如：'题目 1'）
\renewcommand{\thequestion}{\arabic{question}} 

% 定义 \question 命令
\newcommand{\question}[1]{%
    % 增加 'question' 计数器的值
    \stepcounter{question}
    % 在文档中显示题面
    \par\vskip 0.5\baselineskip % 在题面前添加一些垂直间距
    
    \noindent
    \textbf{题目 \thequestion.}\quad 
    \textmd{#1}
    
    \par\vskip 0.5\baselineskip % 在题面后添加一些垂直间距
}


% --- 自定义解答环境 (Solution Environment) ---
% 定义一个新的定理样式 'kaiti' 用于 solution 环境
\theoremstyle{definition} % 基于 definition 样式，它通常是直立字体
\makeatletter
\newtheoremstyle{kaiti}%
  {\topsep}
  {\topsep}
  {\normalfont}
  {}
  {\kaishu}
  {.}
  {.5em}
  {}
\makeatother

% 使用我们定义的 'kaiti' 样式来创建 'solution' 环境
\theoremstyle{kaiti}
\newtheorem*{solution}{解}


% --- 文档开始钩子：确保页面样式正确 ---
\AtBeginDocument{
    \pagestyle{plain} % 从第二页开始显示页码
    \maketitle
}