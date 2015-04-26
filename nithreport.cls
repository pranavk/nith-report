% nithreport.cls
% LaTeX Class file for the National Institute of Technology Hamirpur Report Format
%   by Pranav Kant 2015/04/22
%
% Template based on withesis.cls from 
% http://www.ctan.org/tex-archive/macros/latex/contrib/withesis/
%
% Few snippets based on iitbthesis.cls
% https://www.ee.iitb.ac.in/course/~shalini/ReportMtech/iitbthesis.cls
%
%=============================================================================
% Licensed under the Perl Artistic License.
% see: http://www.ctan.org/tex-archive/help/Catalogue/licenses.artistic.html
% for more info...
%=============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nithreport}[2015/04/22 NIT Hamirpur Major Project Report Format]
\typeout{Document Class `nithreport' v0.1 <22 April 15>}
\usepackage{etoolbox}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Defaults ...
\ProcessOptions

%=============================================================================
% a4paper: report must be printed on a4 size paper. 
% 12pt:    font size must be 12 pt
%
% NITH Report format requires text size to be 12 pt
% =============================================================================
\PassOptionsToClass{12pt,a4paper}{report}
\LoadClass{report}

% Mentor name
\newcommand{\mentor}[1]{\gdef\@mentorname{#1}}
\gdef\@mentorname{Unknown}  % Default is Unknown
\newcommand{\mentordesignation}[1]{\gdef\@mentordesignation{#1}}
\gdef\@mentordesignation{Unknown}  % Default is Unknown
%=============================================================================
% TITLE PAGE
% 
%=============================================================================
\newcommand\@medskip{0.25in}
\newcommand\@bigskip{0.6in}

\newcommand{\nithdegree}[1]{\gdef\@nithdegree{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\degreeshort}[1]{\gdef\@degreeshort{#1}}
\newcommand{\projectstartdate}[1]{\gdef\@startdate{#1}}
\newcommand{\projectenddate}[1]{\gdef\@enddate{#1}}
\newcommand{\authors}[1]{\gdef\@authors{#1}}

\gdef\@nithdegree{Bachelor of Technology}    % Default is Bachelor of Technology
\gdef\@department{Computer Science and Engineering} % Default is Computer Science & Engineering Department
\gdef\@degreeshort{B.Tech.}
\gdef\@projectstartdate{XXXX}
\gdef\@projectenddate{YYYY}
\gdef\@authors{{XXX,YYY,ZZZ}}

\newcommand\printauthors[1]{#1\\}
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \begin{center}
      {\bf\expandafter\uppercase\expandafter{\LARGE\@title}} \\[\@bigskip]
      {\large A major project report}\\
      {\it submitted in partial fulfillment of the} \\
      {\it requirements for the award of the degree}\\
      {\it of}\\
      {\large \@nithdegree} \\
      {\it in}\\
      {\large \@department} \\
      {\it Under the guidance of }  \\
      {\large \bf \@mentorname} \\
      {\large by} \\
      {\noindent\expandafter\forcsvlist\expandafter\printauthors\@authors} ~\\[\@bigskip]
      \vfill
      \includegraphics[width = 35 mm, height = 35 mm]{nithlogo.jpg} \\[\@medskip]
      {\large\MakeUppercase Department of \@department} \\
      {\large National Institute of Technology Hamirpur}\\
      {\large \@date}
    \end{center}
  \end{titlepage}
}

%=============================================================================
% CERTIFICATE
%=============================================================================
\newcommand\printauthorswithsigs[1]{\vspace{.2in} #1\\}
\newenvironment{certificate}{
  \includegraphics[width = 35 mm, height = 35 mm]{nithlogo.jpg}

  {I, hereby, certify that the work which is being presented in the 
  \@degreeshort\ major project report entitled {\bf \@title}, in partial fulfillment
  of the requirements for the award of the {\bf \@nithdegree} in  {\bf \@department} and submitted 
  to the {\bf Department of \@department} of National Institute of Technology Hamirpur is
  an authentic record of my own work carried out during a period from \@projectstartdate\ to \@projectenddate\  
  under the supervision of {\bf {\@mentorname, \@mentordesignation, Department of \@department}}}.

  {The matter presented in this report has not been submitted by me for the award of any other
  degree elsewhere.}
  \begin{flushright}
    \expandafter\forcsvlist\expandafter\printauthorswithsigs\@authors ~\\
  \end{flushright}
 \vfill
  {This is to certify that the above statement made by the candidates is correct to the best of my
  knowledge.} \\

\noindent {Head of Department \hspace*{\fill}   \@mentorname}\\
{\hspace*{\fill} \@mentordesignation}
}

%=============================================================================
% ABSTRACT
%=============================================================================
% The abstract should begin with two single-spaced lines describing
% the author and title in a standard format.  After these lines comes
% the standard abstract.
%=============================================================================
\def\abstract{
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
  \relax\markboth{ABSTRACT}{ABSTRACT}}
\def\endabstract{\par\newpage}


%=============================================================================
% LIST OF SYMBOLS
%=============================================================================
% The list of symbols environment must do the following:
% - produce the table of contents entry for the list of symbols section
% - start a new page with LIST OF SYMBOLS centered two inches from the top
%=============================================================================
\def\listofsymbols{
  \chapter*{List of Symbols}
  \addcontentsline{toc}{chapter}{List of Symbols}}
\def\endlistofsymbols{\par\newpage}


%=============================================================================
% ACKNOWLEDGMENTS
%=============================================================================
% The acknowledgments environment must do the following:
% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
%=============================================================================
\def\acknowledgments{
  \chapter*{Acknowledgments}
  \doublespace}
\def\endacknowledgments{
\vskip 5cm
\begin{flushright}
  \expandafter\forcsvlist\expandafter\printauthors\@authors
\end{flushright}

\par\newpage}
%=============================================================================
% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.
%=============================================================================
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \singlespace#1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
%=============================================================================
% GLOSSARY
%=============================================================================
% The glossary environment must do the following:
% - produce the table of contents entry for the glossary
% - start a new page with GLOSSARY centered two inches from the top
%=============================================================================
\def\glossary{
  \chapter*{Glossary}
  \addcontentsline{toc}{chapter}{Glossary}}
\def\endglossary{\par\newpage}

%=============================================================================
% NOMENCLATURE
%=============================================================================
% The nomenclature environment must do the following:
% - produce the table of contents entry for the nomenclature section
% - start a new page with NOMENCLATURE centered two inches from the top
%=============================================================================
\def\nomenclature{ 
  \chapter*{Nomenclature}
  \addcontentsline{toc}{chapter}{Nomenclature}}
\def\endnomenclature{\par\newpage}

%=============================================================================
% LIST OF FIGURES; LIST OF TABLES
%  These macros from report.cls have been modified to add entry in the
%  Contents table
%=============================================================================
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%=============================================================================
% These commands can be used in the thesis to switch between single
% and double spacing.  This is needed, for instance, in the abstract.
%=============================================================================
\newcommand{\oneskip}{1.0}
\newcommand{\twoskip}{1.5}
\newcommand{\singlespace}
  {\renewcommand{\baselinestretch}{\oneskip}\Large\normalsize}
\newcommand{\doublespace}
  {\renewcommand{\baselinestretch}{\twoskip}\Large\normalsize}
  
% ========================
% Setting report format
% ========================
\setlength{\textheight}{245mm}
\setlength{\textwidth}{160mm}

\setlength{\headheight}{3mm}
\setlength{\headsep}{14mm}
\setlength{\topmargin}{15mm}
% left side empty space on odd- & even-numbered pages
\if@twoside
  \typeout{Two side is true}
  \setlength{\oddsidemargin}{30mm}  % for two side printing
  \setlength{\evensidemargin}{20mm}
\else
  \typeout{Two side is false}
  \setlength{\oddsidemargin}{30mm}  % for one side printing
  \setlength{\evensidemargin}{30mm} % odd side margin = even side margin
\fi
\setlength{\hoffset}{-1in} % already accounted for in the margins
\setlength{\voffset}{-1in} % already accounted for in the margins
% line, paragraphs indent & spacing
\setlength{\parindent}{5ex} % indentation 5 characters approx.

\doublespace

%=============================================================================
% END FILE
%=============================================================================
