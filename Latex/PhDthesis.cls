%---------------------------------------------------------------
% PhD Thesis version 3 style file by Wei HAO, 2017
% PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------

%-------------------------- identification ---------------------
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2017/06/09 v1 PhD thesis class]

% If you want to use a Book style document then uncomment the following 3 lines
% and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[dvips, a4paper]{book}
 

%:-------------------------- packages for fancy things -----------------------
\usepackage{amssymb}
\usepackage{graphics} % for improved inclusion of graphics
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[round, sort, numbers]{natbib}
\usepackage{ifthen}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
\usepackage{setspace}

\usepackage{rotating}
\usepackage{listings}
\usepackage{multirow}
\usepackage{threeparttable}
\usepackage{url}
\usepackage[hidelinks]{hyperref}

\lstset{basicstyle=\ttfamily, commentstyle=\rmfamily, columns=fullflexible, texcl, language=XML}

%:-------------------------- Glossary/Abbrev./Symbols -----------------------

\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
%\nomrefpage % to include page numbers after abbrevations
\renewcommand{\nomname}{Glossary} % rename nomenclature
\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
\makenomenclature % used to be \makeglossary
\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary


%:-------------------------- PDF/PS setup -----------------------
% if you use a macTeX 2008 or later, use the ifpdf package
\usepackage{ifpdf}


\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif}  %GIF doesn't work??
\usepackage[]{graphicx}

%:-------------------------- page layout -----------------------
% A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

% ----------------- Uncomment this secion for two-sided printing -------------
\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}

\setcitestyle{square} % added to change citation style: (1) -> [1]


%: section below defines fancy page layout options
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}



%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii
\renewcommand{\thepage}{\roman{page}}

\newcommand{\submittedtext}{{in partial fulfillment of the requirements for the degree of}}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}

% The name of your University
\def\university#1{\gdef\@university{#1}}

% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% Stating the city of birth for title page where needed; uncommented for use
%\def\cityofbirth#1{\gdef\@cityofbirth{#1}}

% These macros define an environment for front matter that is always
% single column even in a double-column document.

\newenvironment{alwayssingle}
{
   \@restonecolfalse
   \if@twocolumn
     \@restonecoltrue
     \onecolumn
   \else
     \newpage
   \fi
   }{
   \if@restonecol
     \twocolumn
   \else
     \newpage
   \fi
}

%define title page layout

\renewcommand{\maketitle}{
\begin{alwayssingle}
  \renewcommand{\footnotesize}{\small}
  \renewcommand{\footnoterule}{\relax}
  \thispagestyle{empty}
  \begin{center}
    {\Huge {\bfseries {\@title}} \par}
    {\large \vspace*{10mm} \huge by { \par} \vspace*{10mm}}
    {{\LARGE \@author} \par}
    {\large
      Student ID Number: 1188004 \\
	    \vspace*{2ex}
      {{\@collegeordept} \par}
      {{\@university} \par}
      \vspace*{10mm}

      {{\submittedtext} \par}
      {{\@degree} \par}

      \vspace*{4ex}
      \begin{tabular}{r l}
      Assessment Committee:& \\
      Supervisor:&  Kiminori Matsuzaki, School of Information \\
      Co-Supervisor: &  Makoto Iwata,  School of Information\\
      Co-Supervisor: &  Tomoharu Ugawa,  School of Information\\
      Committee Member: & Kazutoshi Yokoyama, School of Information    \\
      Committee Member: & Yukinobu Hoshino, School of Systems Engineering   \\
      % Yukinobu Hoshino, http://www.ele.kochi-tech.ac.jp/hoshino/
      % [Committee Member’s Name] [, Name of the institution]\\
      \end{tabular}
      \vspace*{10mm}
      {\@degreedate}

    }%end large
  \end{center}
  \null
  \vfill
\end{alwayssingle}
}

%:-------------------------- front matter layout -----------------------
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{
  \begin{alwayssingle}
  \begin{center}
  \vspace{1.1cm}
  \end{center}
  \pagestyle{empty}
  \vspace{1.1cm}
  \begin{quote}
  \begin{center}
  }{
  \end{center}
  \end{quote}
  \end{alwayssingle}
}

%-------------------------- acknowledgement layout -----------------------
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{
  \pagestyle{empty}
  \begin{alwayssingle}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Acknowledgements}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}
      }{
    \end{quote}
  \end{alwayssingle}
}

%-------------------------- acknowledgements long layout -----------------------
% The acknowledgementslong environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgement itself
% does not appears in a quote environment so you can get more in.
\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}


%-------------------------- ABSTRACT layout -----------------------
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts}
{
  \begin{alwayssingle}
    \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Abstract}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}
      }{
    \end{quote}
  \end{alwayssingle}
}

%-------------------------- ABSTRACT long layout -----------------------
%The abstract long environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong}
{
  \begin{alwayssingle}
    \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Abstract}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}
      }{
    \end{quote}
  \end{alwayssingle}
}

% The abstractseparate environment is for running of a page with the abstract
% on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate}
{
  \begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
  \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
  {\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%Statement of originality if required

\newenvironment{declaration}
{
  \begin{alwayssingle}
    \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Declaration}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}
      }{
    \end{quote}
  \end{alwayssingle}
}
