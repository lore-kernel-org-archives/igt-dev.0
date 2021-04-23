Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3C46E0BF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 08:28:23 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 23 Apr 2021 11:29:18 +0300
Message-Id: <20210423082919.25489-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] gitignore: Stop ignoring autotools files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Now that autotools is gone we can stop ignoring its generated files.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 .gitignore           | 47 --------------------------------------------
 assembler/.gitignore | 12 -----------
 2 files changed, 59 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3f1e25a2..470e438f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,50 +2,6 @@
 #		X.Org module default exclusion patterns
 #		The next section if for module specific patterns
 #
-#	Do not edit the following section
-# 	GNU Build System (Autotools)
-aclocal.m4
-autom4te.cache/
-autoscan.log
-ChangeLog
-compile
-config.guess
-config.h
-config.h.in
-config.log
-config-ml.in
-config.py
-config.status
-config.status.lineno
-config.sub
-configure
-configure.scan
-depcomp
-.deps/
-INSTALL
-install-sh
-.libs/
-libtool
-libtool.m4
-ltmain.sh
-lt~obsolete.m4
-ltoptions.m4
-ltsugar.m4
-ltversion.m4
-Makefile
-Makefile.in
-mdate-sh
-missing
-mkinstalldirs
-*.pc
-py-compile
-stamp-h?
-symlink-tree
-texinfo.tex
-ylwrap
-*.log
-*.trs
-
 #	Do not edit the following section
 # 	Edit Compile Debug Document Distribute
 *~
@@ -86,9 +42,6 @@ TAGS
 build-aux/
 __pycache__
 
-gtk-doc.make
-gtk-doc.m4
-
 intel-gpu-tools-*/
 igt-gpu-tools-*/
 
diff --git a/assembler/.gitignore b/assembler/.gitignore
index 796fe290..337e0473 100644
--- a/assembler/.gitignore
+++ b/assembler/.gitignore
@@ -1,15 +1,3 @@
-.deps
-Makefile
-Makefile.in
-aclocal.m4
-autom4te.cache
-configure
-configure.lineno
-config.log
-config.status
-depcomp
-install-sh
-missing
 *.o
 
 intel-gen4asm
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
