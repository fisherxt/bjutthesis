\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2019/09/16 1.0 Thesis Template]

%% Template MACROs
%\newcommand\bjutthesis{\textsc{B\kern-.08em\lower.26ex\hbox{j}\kern-.04emu\kern-.02em\lower.26ex\hbox{t}\kern-.12emT\kern-.12em\lower.26ex\hbox{h}\kern-.0eme\kern-.0em\lower.26ex\hbox{s}\kern-.0emi\kern-.0em\lower.26ex\hbox{s}}}
\DeclareRobustCommand{\bjutthesis}{ \rmfamily B\textsc{\kern-.1emj\kern-.025emu\kern-.02emt}\kern-.08emT\kern-.1667em\lower.5ex\hbox{H}\kern-.0667emE\kern-.0667em\lower.5ex\hbox{S}\kern-.05emI\kern-.0667em\lower.5ex\hbox{S}}
\newcommand\version{ver.~2.7}

\RequirePackage{xparse}
\RequirePackage{ezinfo}

%% ==== basics
\LoadClass[UTF8, scheme=plain, zihao=-4, linespread=1.56]{ctexbook}
\ctexset {%
    punct            = quanjiao,
    space            = auto,
    autoindent       = true,
    today            = small
}
\newcommand\chapfont{\zihao{3}\heiti}
\newcommand\secfont{\zihao{4}\heiti}
\newcommand\subsecfont{\zihao{-4}\heiti}
\newcommand\subsubsecfont{\zihao{-4}\kaishu}
\newcommand\itemfont{\zihao{-4}\kaishu}
\setcounter{secnumdepth}{3}
\ctexset {%
    chapter = {
        beforeskip   = \z@,
        afterskip    = 5mm,
        fixskip      = false,
        indent       = \z@,
        format       = \chapfont\centering,
        name         = {第, 章},
        nameformat   = {},
        titleformat  = {},
        numberformat = {}, 
        number       = \arabic{chapter},
        aftername    = \hspace{\ccwd},
        afterindent  = true,
        aftertitle   = {},
        pagestyle    = bjut@headings
    },
    section = {
    	beforeskip   = \z@, % \z@,
    	afterskip    = \z@, % 2.3ex plus .2ex,
    	indent       = \z@,
        format       = \secfont\raggedright,
        aftername    = \hspace{\ccwd},
        afterindent  = true
    },
    subsection = {
    	beforeskip   = \z@, % \z@,
    	afterskip    = \z@, % 1.5ex plus .2ex,
    	indent       = \z@,
        format       = \subsecfont\raggedright,
        aftername    = \hspace{\ccwd},
        afterindent  = true
    },
	subsubsection = {
		beforeskip   = \z@,
		afterskip    = \z@,
		indent       = \z@,
		format       = \subsubsecfont,
		runin        = true,
		aftertitle   = \hspace{\ccwd}
	}
}
\setlength{\parskip}{\z@}

%% ==== fonts, times new roman
\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
% ---- bold Chinese fonts (for Windows)
\newCJKfontfamily\bjut@kaishu[AutoFakeBold]{KaiTi}
\newCJKfontfamily\bjut@songti[AutoFakeBold]{SimSun}
\newCJKfontfamily\bjut@fangsong[AutoFakeBold]{FangSong}
\newcommand\textbfkai[1]{{\bfseries\bjut@kaishu #1}}
\newcommand\textbfsong[1]{{\bfseries\bjut@songti #1}}
\newcommand\textbffangsong[1]{{\bfseries\bjut@fangsong #1}}

%% ==== layout
\RequirePackage{geometry}
\geometry {
    a4paper,
    hcentering,
    ignoreall,
    nomarginpar,
    headheight  = 5.0mm,
    headsep     = 5.5mm,
    top         = 25.4mm,
    bottom      = 25.4mm,
    left        = 31.7mm,
    right       = 31.7mm,
    footskip    = 8.5mm
}

%% ==== pagestyle
\RequirePackage{fancyhdr}

% -- page styles
\newcommand\headertext{北京工业大学工学博士学位论文}
\newcommand\headerfont{\fontsize{9.5bp}{12.5bp}\selectfont\kaishu}
\fancypagestyle{bjut@headings}{%
	\fancyhead{}
	\fancyhead[OC]{\headerfont\leftmark}
	\fancyhead[EC]{\headerfont\headertext}
	\fancyfoot{}
	\fancyfoot[C]{\zihao{-5}--\ \thepage\ --}
	\renewcommand{\headrulewidth}{0.4pt}
	\renewcommand{\footrulewidth}{\z@}
}

\renewcommand\frontmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{bjut@headings}
}
\renewcommand\mainmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{bjut@headings}
}
\renewcommand\backmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagestyle{bjut@headings}
}

%% ==== cross references
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}

\hypersetup{%
	linktoc=all,
	bookmarksnumbered  = true,
	bookmarksopen      = true,
	bookmarksopenlevel = 1,
	breaklinks         = true,
	colorlinks         = false,
	plainpages         = false,
	pdfborder          = 0 0 0}
\urlstyle{same}

%% ==== eqs, figs and tabs
\RequirePackage{amsmath, mathtools, upgreek}             % eqs
\RequirePackage{graphicx, xcolor, tikz, pgfplots}        % figs
\RequirePackage{booktabs, longtable, multirow, dcolumn}  % tabs
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[list=off]{bicaption}

\captionsetup[figure]{labelsep=space}
\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Fig.}

\captionsetup[table]{labelsep=space}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Tab.}

%% ==== numbering
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

%% ==== table of contents
\RequirePackage{bitoc}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}
% -- pagestyle
\tocloftpagestyle{bjut@headings}
% -- dotline: shape and seperation
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftdotsep{0}
% -- chapter entries
\renewcommand{\cftchapfont}{\zihao{-4}\heiti}
\setlength\cftbeforechapskip{\z@}
%\setlength\cftchapnumwidth{3\ccwd}
\renewcommand{\cftchapaftersnumb}{}
\renewcommand{\cftchapdotsep}{0}
% -- section entries
\setlength\cftsecindent{1.5\ccwd}
\setlength\cftsecnumwidth{1.5\ccwd}
\renewcommand{\cftsecaftersnumb}{}
% -- subsection entries
\setlength\cftsubsecindent{3\ccwd}
\setlength\cftsubsecnumwidth{2\ccwd}
\renewcommand{\cftsubsecaftersnumb}{}

%% ==== bibliography
\RequirePackage[super, sort&compress]{gbt7714}
\renewcommand\bibfont{\zihao{5}}
\addtolength\bibsep{-0.7em}

% ==== cover, titlepage and declaration page
\RequirePackage{ragged2e}
\RequirePackage[pagecolor=white, nopagecolor=white]{pagecolor}
\RequirePackage[copies]{contour}
\contourlength{2pt}
% ---- aux command for set bunch of 
\newlength\cellwidth
\newlength{\cellwidthtwo}
\newcommand\itemnamefont\normalfont
\newcommand{\makecover}{%
	\input{bjutcover.tex}
	\global\let\makecover\relax
}
\renewcommand{\maketitle}{%
	\input{bjuttitlepage.tex}
	\global\let\maketitle\relax
}
\newcommand{\makestate}{%
	\input{bjutstatement.tex}
	\global\let\makestate\relax
}

\AtBeginDocument{%
	\pagestyle{empty}
}
\endinput