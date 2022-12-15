\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hw}[2021/09/01 Template for 2021-2022 problem sets]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[12pt,letterpaper]{article}

\RequirePackage{fullpage,graphicx}
\RequirePackage{amsmath,amsfonts,amsthm,amssymb,multirow,xcolor}
\RequirePackage{algorithmic}
\RequirePackage[ruled,vlined,commentsnumbered,titlenotnumbered]{algorithm2e}
%\RequirePackage{palatino}
\usepackage{newpxtext}
\RequirePackage{etoolbox}
\RequirePackage{verbatim}
\RequirePackage{newpxmath}
\RequirePackage{mdframed}
\RequirePackage{mathtools}
\RequirePackage{enumerate}

\DeclarePairedDelimiter\set{\{}{\}}
\DeclareMathOperator{\poly}{poly}
\DeclareMathOperator{\negl}{negl}
\DeclarePairedDelimiter\inner{\langle}{\rangle}
\DeclarePairedDelimiter\length{\lVert}{\rVert}
\setcounter{MaxMatrixCols}{20}
\newcommand{\cB}{\mathcal{B}}
\newcommand{\cC}{\mathcal{C}}
\newcommand{\F}{\mathbb{F}}

\setcounter{MaxMatrixCols}{20} \setlength\parindent{0pt}

\newcommand{\R}{\mathbb{R}} \newcommand{\calD}{\mathcal{D}}
\newcommand{\A}{\mathcal{A}} \newcommand{\bit}{\{0,1\}}
\newcommand{\keyspace}{\ensuremath{\mathcal{K}}}
\newcommand{\msgspace}{\ensuremath{\mathcal{M}}}
\newcommand{\ctspace}{\ensuremath{\mathcal{C}}}
\newcommand{\tagspace}{\ensuremath{\mathcal{T}}}
\newcommand{\idspace}{\ensuremath{\mathcal{ID}}}
\newcommand{\skcgen}{{\sf Gen}} \newcommand{\skcenc}{{\sf Enc}}
\newcommand{\skcdec}{{\sf Dec}}
\newcommand{\white}{\color{white}} \newcommand{\red}{\color{red}}
\DeclareMathOperator{\polylog}{polylog}
\newcommand{\N}{\mathbb{N}}
\newcommand{\scheme}[1]{\ensuremath{\text{#1}}}
\newcommand{\algo}[1]{\ensuremath{\mathsf{#1}}}
\newcommand{\prg}{\algo{PRG}} \newcommand{\prf}{\algo{PRF}}
\newcommand{\prp}{\algo{PRP}} \newcommand{\skc}{\scheme{SKC}}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\newcommand{\concat}{\ensuremath{\|}}
\newcommand{\attacker}[1]{\ensuremath{\mathcal{#1}}}
\newcommand{\Dist}{\attacker{D}} \newcommand{\Ora}{\attacker{O}}
\newcommand{\advan}{\ensuremath{\mathbf{Adv}}}
\newcommand{\mac}{\scheme{MAC}} \newcommand{\macgen}{\algo{Gen}}
\newcommand{\mactag}{\algo{Tag}} \newcommand{\macver}{\algo{Ver}}
\renewcommand{\For}{\attacker{F}}
\newcommand{\Adv}{\attacker{A}}


\newcounter{sheet}

\newcommand{\student}{ YOUR NAME HERE (uniqname here) }
\newcommand{\collaborators}{Name/Exercise Number(s), Name/Exercise
  Numbers(s)}
\newtheorem*{theorem*}{Theorem}

\renewcommand\maketitle{%
\hrule height .5pt
\begin{center}
\textbf{Theory 407 Winter 2022 Report}
\end{center}
\hrule height .5pt
\begin{center}
  \collaborators
\end{center}


}

\newcounter{nexercise}

%-----------------------------------------------------------------------------
% Toggle on and off model answers here:
\newtoggle{answers}
\toggletrue{answers}  % True  -> Answers visible
%\togglefalse{answers} % False -> Answers invisible
%-----------------------------------------------------------------------------

\newenvironment{exercise}%
{\stepcounter{nexercise} \subsection*{Exercise \arabic{nexercise}}}%
{\iftoggle{answers}{}{\vspace{5mm}\hrule}}

\newenvironment{answer}%
{\iftoggle{answers}{\subsection*{Solution}\begin{mdframed}[linewidth=1pt]}{\expandafter\comment}}%
{\iftoggle{answers}{\end{mdframed}\vspace{5mm}\hrule}{\expandafter\endcomment}}

\endinput
