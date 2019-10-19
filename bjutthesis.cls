\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2019/09/16 2.7 Thesis Template]

\RequirePackage{xparse}
\RequirePackage{ezinfo}

%% Template MACROs
\DeclareRobustCommand{\bjutthesis}{ {\rmfamily B\textsc{\kern-.1emj\kern-.025emu\kern-.02emt}\kern-.08emT\kern-.1667em\lower.475ex\hbox{H}\kern-.0667emE\kern-.0667em\lower.475ex\hbox{S}\kern-.05emI\kern-.0667em\lower.475ex\hbox{S}} }
\def\version{ver.\,2.7}

%% ==== basics
\LoadClass[UTF8, scheme=plain, zihao=-4, linespread=1.56]{ctexbook}
\ctexset {%
  punct      = quanjiao,
  space      = auto,
  autoindent = true,
  today      = small }
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
    pagestyle    = bjut@headings },
  section = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 2.3ex plus .2ex,
    indent       = \z@,
    format       = \secfont\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true },
  subsection = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 1.5ex plus .2ex,
    indent       = \z@,
    format       = \subsecfont\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true },
  subsubsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \subsubsecfont,
    runin        = true,
    aftertitle   = \hspace{\ccwd} } }
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
\newcommand\textbffs[1]{{\bfseries\bjut@fangsong #1}}

%% ==== layout
\RequirePackage{geometry}
\geometry {%
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
  footskip    = 8.5mm }

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
  \fancyfoot[C]{\zihao{-5}--\,\thepage\,--}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{\z@} }

\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bjut@headings} }
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bjut@headings} }
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagestyle{bjut@headings} }

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
  pdfborder          = 0 0 0 }
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
\usepackage[normalem]{ulem}
\useunder{\uline}{\ulined}{}
\RequirePackage[pagecolor=white, nopagecolor=white]{pagecolor}
\RequirePackage[copies]{contour}  % outlined text on cover
\contourlength{2pt}

\newcommand{\makecover}{%
  \begin{titlepage}
  \newgeometry{left=10mm, right=10mm, top=10mm}
  \definecolor{covercolor}{RGB}{186,15,43}
  \pagecolor{covercolor}
  \begin{flushleft}\zihao{5}\heiti
    \renewcommand\arraystretch{.75}
    \setlength\tabcolsep{2pt}
    \begin{tabular}{p{30mm}@{：}l}
      \makebox[30mm][s]{中文图书分类号} & \ez@clc \\
      \makebox[30mm][s]{密级}       & \ez@secretlevel\\
      \makebox[30mm][s]{{\hfill}UDC}  & \ez@udc \\  
      \makebox[30mm][s]{学校代码}     & \ez@schoolcode \\
    \end{tabular}
  \end{flushleft}
  \vskip 1.5cm  
  \begin{center}
    \includegraphics[width=10.5cm]{./cls/bjut_logo_white}  
    \vskip 1.6cm
    \contour[20]{white}{\makebox[12cm][s]{\fontsize{48}{48}\heiti 博士学位论文}}
    \vskip .8cm
    \makebox[10.5cm][s]{\fontsize{23}{23}\selectfont DOCTORAL DISSERTATION}
  \end{center}    
  \vfill
  \begin{flushleft}\zihao{-2}\heiti
    \leftskip 2.5cm
    \renewcommand\arraystretch{1.6}
    \setlength\tabcolsep{4pt}
    \begin{tabular}{p{45mm}@{：}p{92mm}}
      \makebox[45mm][s]{论文题目} & \ez@ctitle \\
      \makebox[45mm][s]{论文作者} & \ez@cauthor \\
      \makebox[45mm][s]{学科}   & \ez@cdiscipline \\
      \makebox[45mm][s]{指导教师} & \ez@csupervisor\\
      \makebox[45mm][s]{论文提交日期} & \ez@cdate
    \end{tabular}
  \end{flushleft}\normalsize\normalfont
  \end{titlepage}
  \restoregeometry\nopagecolor
  \global\let\makecover\relax }

\renewcommand{\maketitle}{%
  \begin{titlepage}
%  \newgeometry{left=3cm, right=3cm, top=2.5cm, bottom=5.0cm}
  \begin{center}\zihao{5}
    \renewcommand\arraystretch{.9}
    \setlength\tabcolsep{0pt}
    \begin{tabular}{p{30mm}p{76mm}p{20mm}l}%@{\hspace{-.5em}}
      \makebox[30mm][s]{{\hfill}UDC：} & \ez@udc & \makebox[20mm][s]{学校代码：} & \ez@schoolcode \\
      \makebox[30mm][s]{中文图书分类号：} & \ez@clc & \makebox[20mm][s]{学号：} & \ez@studentid\\
       & & \makebox[20mm][s]{密级：} & \ez@secretlevel
    \end{tabular}
  \end{center}
  \vskip 1.5cm
  \begin{center}
    \makebox[12cm][s]{\zihao{-1}\textbfkai{北京工业大学工学博士学位论文}}
  \end{center}
  \vskip 1.2cm
  \begin{center}
    \renewcommand\arraystretch{1.5}
    \setlength\tabcolsep{0pt}
    \begin{tabular}{p{20mm}@{：}p{10.8cm}}
      \makebox[20mm][s]{\zihao{4}\textbfsong{题目}} & \zihao{4}{\ulined\ez@ctitle\hfill\mbox{}}\\
      % \cline{2-2}
      \makebox[20mm][s]{\zihao{4}\textbfsong{英文题目}} & \zihao{4}\MakeUppercase{\ulined\ez@etitle\hfill\mbox{}}\\
      % \cline{2-2}
    \end{tabular}
  \end{center}
  \vfill
  \begin{flushleft}\zihao{4}\fangsong
    \leftskip 1cm
    \setlength\tabcolsep{0pt}
    \begin{tabular}{p{40mm}@{：}l}
      \makebox[40mm][s]{\textbffs{论文作者}}   & \ez@cauthor\\        
      \makebox[40mm][s]{\textbffs{学科专业}}   & \ez@cdiscipline\\        
      \makebox[40mm][s]{\textbffs{研究方向}}   & \ez@cmajor\\        
      \makebox[40mm][s]{\textbffs{申请学位}}   & \ez@cdegree\\        
      \makebox[40mm][s]{\textbffs{指导教师}}   & \ez@csupervisor~\ez@csupervstitle\\        
      \makebox[40mm][s]{\textbffs{所在单位}}   & \ez@ccollege\\        
      \makebox[40mm][s]{\textbffs{答辩日期}}   & \ez@cdate\\        
      \makebox[40mm][s]{\textbffs{授予学位单位}} & \ez@corganization\\
    \end{tabular}
  \end{flushleft}
\end{titlepage}\restoregeometry
\global\let\maketitle\relax }

\newcommand\makeetitle{%
  \begin{titlepage}
    \mbox{}
    \vfill
    \begin{center}
      \zihao{4}\bfseries\MakeUppercase\ez@etitle
    \end{center}
    \vspace{\stretch{2}}
    \begin{center}
      A DISSERTATION\\
      SUBMITTED TO THE \MakeUppercase\ez@ecollege\ AND THE COMMITTEE ON GRADUATE STUDIES OF BEIJING UNIVERSITY OF TECHNOLOGY\\
      IN PARTIAL FULFILLMENT OF THE REQUIREMENTS \\
      FOR THE DEGREE OF \\
      DOCTOR OF PHILOSOPHY
    \end{center}
    \vspace{\stretch{2}}
    \begin{center}
    \ez@eauthor
    \par
    \ez@edate
    \end{center}
    \vfill
  \end{titlepage} 
  \let\makeetitle\relax}

\newcommand{\makestate}{%
  \begin{titlepage}
    \mbox{}
    \vskip .5cm
    \begin{center}
      \makebox[4cm][s]{\zihao{3}\heiti 独创性声明}  
    \end{center}
    {\justify
      \hspace{2\ccwd}本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。\kern-.1em尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，\kern-.1em也不包含为获得北京工业大学或其它教育机构的学位或证书而使用过的材料。\kern-.1em与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
    \begin{center}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{p{88mm}p{20mm}p{38mm}}\zihao{5}
         & \makebox[20mm][s]{签名：} & \underline{\hspace{37mm}}\\
         & \makebox[20mm][s]{日期：} & \hspace{\stretch{2}}年{\hfill}月 {\hfill}日
      \end{tabular}
    \end{center}
    \vskip 4cm
      \begin{center}
      \makebox[6.5cm][s]{\zihao{3}\heiti 关于论文使用授权的说明}  
    \end{center}
    {\justify
      \hspace{2\ccwd}本人完全了解北京工业大学有关保留、使用学位论文的规定，即：\kern-.1em学校有权保留送交论文的复印件，允许论文被查阅和借阅；\kern-.1em学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。
      \par 
      \raggedright
      \hspace{2\ccwd}（保密的论文在解密后应遵守此规定）}
    \begin{center}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \leftskip 1cm
      \begin{tabular}{p{22mm}p{38mm}p{18mm}p{20mm}p{38mm}}\zihao{5}
        \makebox[22mm][s]{签名：} & \underline{\hspace{30mm}} & & \makebox[20mm][s]{日期：} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
        \makebox[22mm][s]{导师签名：} & \underline{\hspace{30mm}} & & \makebox[20mm][s]{日期：} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
      \end{tabular}
    \end{center}  
  \end{titlepage}
  \global\let\makestate\relax }

\AtEndPreamble{%
  \pgfplotsset{compat=1.16}
}
\AtBeginDocument{%
  \pagestyle{empty}
}
\endinput