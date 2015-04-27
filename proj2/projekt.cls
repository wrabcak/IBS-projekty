% ----------------------------------------------------------------------------
% FIT thesis
% ----------------------------------------------------------------------------
% (C) 2007 Zdenek Vasicek, 2008 Michal Bidlo
% vim: set syntax=tex encoding=latin2:
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{projekt}

%Vychozi hodnoty parametru
\newif\ifslovak \let\ifslovak\iftrue
\newif\ifcover \let\ifcover\iffalse
\newif\ifPrint \let\ifPrint\iffalse
\newif\ifWis   \let\ifWis\iftrue

%Parametry tridy
\DeclareOption{english}{\let\ifslovak\iffalse}
\DeclareOption{cover}{\let\ifcover\iftrue}
\DeclareOption{print}{\let\ifWis\iffalse \let\ifPrint\iftrue}

\DeclareOption*{}
\ProcessOptions\relax

%Jako vychozi pouzijeme tridu REPORT
\ifx\pdfoutput\undefined % nejedeme pod pdftexem
   \LoadClass[a4paper,oneside,onecolumn,11pt]{report}
\else
   \LoadClass[pdftex,a4paper,oneside,onecolumn,11pt]{report}
\fi

%Balicky
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[slovak,english]{babel}
\usepackage[latin2]{inputenc}
\ifslovak
  \main@language{slovak}
\else
  \main@language{english}
\fi
\ifx\pdfoutput\undefined
  \usepackage{graphics}
  \usepackage{epsfig}
\else
  \usepackage[pdftex]{graphicx}
\fi

%Sazebni obrazec
\setlength{\hoffset}{-0.7cm}
\setlength{\voffset}{-1.5cm}
\setlength{\textheight}{23.0cm}
\setlength{\textwidth}{15.2cm}

%Texty
\def\@vut@CS{Vysoké uèení technické v~Brnì}
\def\@vut@EN{Brno University of Technology}
\def\@fit@CS{Fakulta informaèních technologií}
\def\@fit@EN{Faculty of Information Technology}
\def\@author@CS{Autor práce}
\def\@author@EN{Author}

\newif\ifnasel
\def\ifEqString#1#2#3#4{\def\testa{#1}\def\testb{#2}%
  \ifx\testa\testb \def#4{#3} \naseltrue \fi%
}

%Vyber typu projektu
\newcommand{\set@project}[1]{%
 \ifEqString{#1}{OP}{Odborná práca}{\@projecttype@CS}%
 \ifEqString{#1}{OP}{Technical work}{\@projecttype@EN}%
 \ifEqString{#1}{SP}{Semestrálny projekt}{\@projecttype@CS}%
 \ifEqString{#1}{SP}{Term project}{\@projecttype@EN}%
 \ifEqString{#1}{DP}{Diplomová práca}{\@projecttype@CS}%
 \ifEqString{#1}{DP}{Master's thesis}{\@projecttype@EN}%
}

%Jmeno, prijmeni, tituly autora
\def\get@author{\ifx\undefined\@author@tp\else%
\@author@tp~\fi{\@author}\ifx\undefined\@author@ta\else,~\@author@ta\fi}

%Parametry 
\define@key{projinfo}{title}{\global\def\@title{#1}}
\define@key{projinfo}{subject}{\global\def\@subject{#1}}
\define@key{projinfo}{project}{\set@project{#1}}
\define@key{projinfo}{year}{\def\@year{#1}}
\define@key{projinfo}{author}{\def\@author{#1}}
\def\projectinfo{\setkeys{projinfo}}

\newlength{\mkspc}
\setlength{\mkspc}{2pt}

\def\setfontsize#1{\renewcommand{\baselinestretch}{1.5}\fontsize{#1}{\f@baselineskip}\selectfont}
\newcommand{\mktxt}[2]{\vbox{\setfontsize{#1}\noindent#2}\vspace\mkspc}
\newcommand{\mktxt@b}[2]{\vbox{\setfontsize{#1}\noindent\bf#2}\vspace\mkspc}
\newcommand{\mkuctxt}[2]{\vbox{\setfontsize{#1}\noindent{#2}}\vspace\mkspc}

%Uvodni stranky \maketitle
\renewcommand\maketitle{%
\thispagestyle{empty}\null%


\fontfamily{phv}\selectfont%
\newsavebox{\@obrlogo}\newsavebox{\@rtext}\newlength{\@vyskartext}\newlength{\@vyskaobr}%

\savebox{\@obrlogo}{\includegraphics[width=3.5cm,keepaspectratio]{fig/vut-zp2}}%logo VUT
\savebox{\@rtext}{\vbox{\mkuctxt{18}{\@vut@CS}\mkuctxt{11}{\@vut@EN}}}%text VUT
\settoheight{\@vyskaobr}{\makebox{\usebox{\@obrlogo}}}% vyska loga
\settoheight{\@vyskartext}{\makebox{\usebox{\@rtext}}}% vyska textu
\addtolength{\@vyskaobr}{-\@vyskartext}%odecteme od vysky loga vysku textu
\noindent\usebox{\@obrlogo}\raisebox{\@vyskaobr}{\hspace{10pt}\usebox{\@rtext}}%zvedneme box s textem

\vspace{5mm}

\savebox{\@obrlogo}{\includegraphics[width=3.5cm,keepaspectratio]{fig/fit-zp2}}%logo FIT
\savebox{\@rtext}{%text FIT, USTAV
\vbox{\mkuctxt{14}{\@fit@CS}
\vspace{3mm}
\mkuctxt{11}{\@fit@EN}}}
\settoheight{\@vyskaobr}{\makebox{\usebox{\@obrlogo}}}% vyska loga
\settoheight{\@vyskartext}{\makebox{\usebox{\@rtext}}}% vyska textu
\addtolength{\@vyskaobr}{-\@vyskartext}%odecteme od vysky loga vysku textu
\noindent\usebox{\@obrlogo}\raisebox{\@vyskaobr}{\hspace{10pt}\usebox{\@rtext}}%zvedneme box s textem

\vfill

\mkuctxt{18}{\@title}
\mkuctxt{10}{\@subject}

\vfill
\vspace{5mm}

\mktxt{14}{{\@author@CS} \hfill \get@author}

\vspace{15mm}

\mktxt{11}{Brno \@year}

\newpage\fontfamily{\familydefault}\selectfont%

}

\endinput
