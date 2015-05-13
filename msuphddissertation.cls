% MSU Ph.D Dissertation class file
% Copyright by Clifford E. Weil and MSU Board of Trustees 2015
% This file must not to alter or distributed.
% New users should download the latest distribution from
% http://www.math.msu.edu/~weil/MSU_Ph.D._Dissertation.zip

% Report bugs to Clifford Weil (weil@math.msu.edu).
% Latest revision March 24, 2015 
% Now hyperref safe thanks to Daniel Alt
% This version handles appendices as required in the Formatting Guide.

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuphddissertation}

% Bring in the regular book class
\LoadClass[12pt,oneside]{book}

% Bring in needed packages
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage[titles,subfigure]{tocloft}
\RequirePackage{subfig}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{pdflscape}

\@ifpackageloaded{hyperref}
{\newcommand{\tocentry}[2]{\texorpdfstring{\textbf{{#1}}}{#2}}}
{\newcommand{\tocentry}[2]{\textbf{{#1}}}}
\newcommand{\chapname}{Chapter}
\newcommand\covername{Appendix}
\renewcommand{\appendixname}{Appendix}

% Change to double spacing as defined by MS Word
% Redefine the \doublspacing command
\renewcommand{\doublespacing}{%
	\setstretch {1.9}%  default
	\ifcase \@ptsize \relax % 10pt
	\setstretch {1.9}%
	\or % 11pt
	\setstretch {1.9}%
	\or % 12pt
	\setstretch {1.9}%
	\fi
}

% Number all levels of document divisions
\setcounter{secnumdepth}{6}

% Set depth of table of contents
\setcounter{tocdepth}{6}

% Set second level of sub(super) scripts to 10 pt.
% Thanks to Lee Larson for this fix.
\DeclareMathSizes{12}{12}{10}{10}
\DeclareMathSizes{10}{10}{10}{10}
% Set footnote font size to 12pt.

% Define the command \unit 
\newcommand*{\unit}[1]{\def\fromunit{#1}}

%Define the Title Page
\newcommand\maketitlepage{\begin{titlepage}%
	\vspace*{.55in}
	\begin{center}%
	\MakeUppercase{\@title}% DO NOT REMOVE THE FOLLOWING BLANK LINE
           
	\begin{doublespace}% DO NOT REMOVE THE FOLLOWING BLANK LINE
           
           By
	      
	\begin{tabular}[t]{c}%
	\@author
	\end{tabular}%
	\end{doublespace}
%	\vspace{\fill}
	\vspace*{2.5in}
	{%
	A  DISSERTATION 
	\vspace{\baselineskip}%

	Submitted to \\
	Michigan State University \\
	in partial fulfillment of the requirements \\
	for the degree of 
   
	\vspace{\baselineskip}%
	\fromunit % Inserts unit name and degree type%
  
	\vspace{\baselineskip}%
	{\number\year}  
	} 
	\vspace{\baselineskip}
	\end{center}
\end{titlepage}}%

% Define the command \pubabstractname
 \newcommand{\pubabstractname}{\textbf{PUBLIC ABSTRACT}}
 
%Define the pubabstract environment for the dissertation
\newenvironment{pubabstract}{%
	\thispagestyle{empty}
         \pagenumbering{roman}
         \begin{center}%
         \bfseries \pubabstractname\vspace{\baselineskip}
         
         \MakeUppercase{\@title}
        
         \vspace{\baselineskip}
       
         By 
	\vspace{\baselineskip}
	      
	\begin{tabular}[t]{c}%
         \@author
         \end{tabular}
         \end{center}
     
	\begin{doublespace}
	\addtocounter{page}{1}
	} 
{\end{doublespace}\pagestyle{empty}\newpage}
  
% Define the command \abstractname
 \newcommand{\abstractname}{\textbf{ABSTRACT}}
 
%Define the abstract environment for the dissertation
  \newenvironment{abstract}{%
	\thispagestyle{empty}
         \pagenumbering{roman}
         \begin{center}%
         \bfseries \abstractname\vspace{\baselineskip}
         
          \MakeUppercase{\@title}
        
          \vspace{\baselineskip}
       
          By 
	 \vspace{\baselineskip}
	      
	 \begin{tabular}[t]{c}%
          \@author
          \end{tabular}
          \end{center}
     
         \begin{doublespace}
         \addtocounter{page}{1}
         } 
         {\end{doublespace}\pagestyle{empty}\newpage}
  
% Define the Copyright Page
      \newenvironment{copyrt}{%
      \newpage
      \thispagestyle{empty}
      \vspace*{\fill}
      \begin{center}
      \begin{tabular}{l}
      Copyright by\\
      \MakeUppercase{\@author}\\
      \number\year
      \end{tabular}
      \end{center}\vfill}
     {\newpage}
     
% Define the Dedication Page
\newcommand{\dedname}{DEDICATION}
\newenvironment{dedication}{%
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\vspace*{\fill}}
	{
\vfill}
             
% Define the Acknowledgement Page
\newcommand{\ackname}{ACKNOWLEDGMENTS}
\newenvironment{acknowledgment}{%
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\begin{center}
	{\bfseries\ackname}
	\vspace{\baselineskip}
	\end{center}
	\begin{doublespace}
	}
	{\end{doublespace}\thispagestyle{plain}
\pagestyle{plain}}
     
% Define the Preface Page
\newcommand{\prefname}{PREFACE}
\newenvironment{preface}{%
     	\newpage
      	\thispagestyle{plain}
      	\pagestyle{plain}
       	\begin{center}
     	{\bfseries\prefname}
    	\vspace{\baselineskip}
     	\end{center}
	\begin{doublespace}
	}
     	{\thispagestyle{plain}
	\end{doublespace}
\pagestyle{plain}}

% Redefine the \@chapter command to put "Chapter" 
% before each chapter entry in the ToC and to put
% "Appendix" before each appendix entry in the ToC.
% Replaced \chaptername by \@chapapp 7-26-12

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
	\refstepcounter{chapter}%
	\vspace*{-4\baselineskip}
	\typeout{\@chapapp\space\thechapter.}%
		\ifx\chaptername\chapname
		\addcontentsline{toc}{chapter}%
    	{\protect\numberline{\@chapapp\space\thechapter}#1}%
		\else	
		\ifx\covername\appendixname%						
 		\else%										
			\addcontentsline{toc}{section}%				
    	{{\@chapapp\space\thechapter\space}#1}					
	\fi							 				
				\fi%
		 \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
           \chaptermark{#1}%
%           \addtocontents{lof}{\protect\addvspace{10\p@}}%
%           \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
           \@topnewpage[\@makechapterhead{#2}]%
                   \else
           \@makechapterhead{#2}%
           	\@afterheading
                    \fi}
                    
% Rededefine the table of contents command 
\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\tableofcontents{\begin{singlespace}%
		\if@twocolumn
	\@restonecoltrue\onecolumn
    		\else
	\@restonecolfalse
    		\fi
	\chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase\contentsname}
	\@mkboth{%
	\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
	\vspace*{-1.4\baselineskip}
	\@starttoc{toc}%
    		\if@restonecol\twocolumn\fi
	\end{singlespace}}
  
\newcommand{\TOC}{
	\clearpage
	\pagestyle{plain}
	\tableofcontents
	\clearpage
	\pagestyle{plain}}

	\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}
	\renewcommand{\cftaftertoctitle}{\vspace{\baselineskip}}
     	\setlength{\cftbeforechapskip}{\baselineskip}
	\renewcommand{\cftchapnumwidth}{6.5em}  
	    
%  Define the \LOT command to augment the \listofftables command
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand\listoftables{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase
	\listtablename}}
	\addcontentsline{toc}{chapter}
	{\tocentry{\textbf{LIST OF TABLES}}{List of Tables}}
	\@mkboth{\MakeUppercase\listtablesname}%
	{\MakeUppercase\listtablename}%
	\begin{singlespace} 
	\vspace*{-2\baselineskip}
	\@starttoc{lot}%
		\if@restonecol\twocolumn
		\fi
	\end{singlespace}
	}
	
\newcommand{\LOT}{
	\clearpage
	\setlength\cftbeforetabskip{\baselineskip}
	\listoftables
	\clearpage
	\pagestyle{plain}}
    
	\renewcommand{\cftafterlottitle}{\vspace{\baselineskip}}
	\renewcommand{\cfttabnumwidth}{6em}  
	\renewcommand{\cfttabpresnum}{Table }     
        
% Define the \LOF command to augment the \listoffigures command
\renewcommand\listfigurename{LIST OF FIGURES}
	\renewcommand\listoffigures{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase\listfigurename}}
	\addcontentsline{toc}{chapter}
	{\tocentry{\textbf{LIST OF FIGURES}}{ List of Figures}}
	 \@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	\begin{singlespace}
	\vspace*{-2\baselineskip} 
	\@starttoc{lof}%
		\if@restonecol\twocolumn
		\fi
	\end{singlespace}
}

\newcommand{\LOF}{
	\clearpage
	\setlength\cftbeforefigskip{\baselineskip}
	\listoffigures
	\clearpage
	\pagestyle{plain}}

	\renewcommand{\cftafterloftitle}{\vspace{\baselineskip}}
	\renewcommand{\cftfignumwidth}{6em}  
	\renewcommand{\cftfigpresnum}{Figure }     
	        
% Define the KEY TO SYMBOLS
\newenvironment{symbols}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\begin{center}
	\bfseries{\MakeUppercase{\large KEY TO SYMBOLS}}
	\end{center}
	\addcontentsline{toc}{chapter}
	{\tocentry{KEY TO SYMBOLS}{Key to Symbols}}%
	\vspace*{\baselineskip}}
{\newpage}

% Define the KEY TO ABBREVIATIONS
\newenvironment{abbrev}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\begin{center}
	\bfseries{\MakeUppercase{\large KEY TO ABBREVIATIONS}}
	\end{center}
	\addcontentsline{toc}{chapter}
	{\tocentry{KEY TO ABBREVIATIONS}{Key to Abbreviations}}%
	\vspace*{\baselineskip}}
{\newpage}

% Single space quotation environments.
\renewenvironment{quotation}
	{\begin{singlespace}\list{}{\listparindent 1.5em%
	\itemindent    \listparindent
	\rightmargin   \leftmargin
	\parsep  \z@ \@plus\p@}%
	\item\relax}
{\endlist\end{singlespace}}
\renewenvironment{quote}
	{\begin{singlespace}\list{}{\rightmargin\leftmargin}%
	\item\relax}
{\endlist\end{singlespace}}    
               
% Redefine the \appendix command 
% to be used for a single appendix.
\newcommand{\appendicesname}{Appendices}
\renewcommand\appendix{\par
	\clearpage\vspace*{\fill}
	\begin{center}
	\Huge{\textbf{\MakeUppercase{\covername}}}
	\addcontentsline{toc}{chapter}
	{\tocentry{\appendixname}{\appendixname}}			
	\end{center}
	\vfill
	\newpage
	\setcounter{chapter}{0}%
 	\setcounter{section}{0}%
	\renewcommand{\chaptername}{\appendixname}
 	\gdef\chaptername{\appendixname}%
 	\gdef\thechapter{\@Alph\c@chapter}
	\clearpage
}

% Define the command \appendices to be used 
% for 2 or more appendices.
\newcommand\appendices{\par
	\renewcommand{\covername}{Appendices}
	\clearpage\vspace*{\fill}
	\begin{center}
	\Huge{\textbf{\MakeUppercase{\covername}}}
	\addcontentsline{toc}{chapter}
	{\tocentry{\covername}{\covername}}
	\end{center}
	\vfill
	\newpage
	\setcounter{chapter}{0}%
 	\setcounter{section}{0}%
 	\gdef\chaptername{\appendixname}%
 	\gdef\thechapter{\@Alph\c@chapter}
  	\clearpage
}
     
% Single space the bibliography.
% to change to ToC entry, delete 5 lines down and insert 11 lines down.
\renewenvironment{thebibliography}[1]
	{\clearpage
	\vspace*{\fill}
	\begin{center}
	\Huge \textbf{\MakeUppercase{\bibname}}
	\addcontentsline{toc}{chapter}{\tocentry{BIBLIOGRAPHY}{Bibliography}}%

	\vspace{\baselineskip}% 
	\end{center}
	\vfill
	\newpage
	\chapter*{\vspace{-2.2\baselineskip}\centerline{\MakeUppercase{\bibname}}}%
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
         %\addcontentsline{toc}{chapter}{\tocentry{\bibname}{\bibname}}
	\vspace*{-1.2\baselineskip}
	\begin{singlespace}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\@openbib@code
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\setlength{\itemsep}{.2in}
	\sloppy
      	\clubpenalty4000
      	\@clubpenalty \clubpenalty
      	\widowpenalty4000%
      	\sfcode`\.\@m}
      	{\def\@noitemerr
       	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
	\end{singlespace}}
     
% Properly locates page number for landscape
\let\LS@makecol=\@makecol
\let\LS@makefcolumn=\@makefcolumn
\def\LS@rot{%
	\setbox\@outputbox\vbox{\hbox{\rotatebox{90}%
	{\makebox[-4.5in][l]{\raisebox{-.4in}{\the\value{page}}}\box\@outputbox}}}}


% Set the starting page style
\pagestyle{empty} 
 