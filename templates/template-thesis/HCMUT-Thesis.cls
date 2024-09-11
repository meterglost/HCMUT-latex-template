\NeedsTeXFormat{LaTeX2e}

\RequirePackage{iftex}
\RequireXeTeX

% ==================== Custom class ====================

\ProvidesClass{HCMUT-Thesis}[2024/08/01-v1.0.0] % {Year}/{Month}/{Day}-v{Major}.{Minor}.{Patch}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=TEMPLATE,
    prefix=TEMPLATE@
}

\DeclareBoolOption[true]{padding} % for printing
\DeclareBoolOption[false]{showpad}

\DeclareStringOption{author}
\DeclareStringOption{passwd}

\DeclareStringOption{subject}
\DeclareStringOption{project}

\ProcessKeyvalOptions*

% ==================== Base class ====================

\LoadClass[a4paper]{report}

\providecommand{\pdfauthor}{\TEMPLATE@author}
\providecommand{\pdfpasswd}{\TEMPLATE@passwd}
\providecommand{\pdfsubject}{\TEMPLATE@subject}
\providecommand{\pdfproject}{\TEMPLATE@project}

% ==================== Internal packages ====================

\RequirePackage{settings/_init}
\RequirePackage{settings/_page}
\RequirePackage{settings/_text}
% \RequirePackage{settings/_cite}
\RequirePackage{settings/_code}
\RequirePackage{settings/_math}
\RequirePackage{settings/_image}
\RequirePackage{settings/_array}
\RequirePackage{settings/_final}

% ==================== Add metadata ====================

\hypersetup{
    pdftitle={\pdfproject},
    pdfauthor={\pdfauthor},
    pdfsubject={\pdfsubject},
}

\special{pdf:encrypt userpw (\pdfpasswd) ownerpw (\pdfpasswd) length 128 perm 2052}
