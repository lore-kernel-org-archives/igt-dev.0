Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6310E603
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 15:03:39 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nUV8B-006e0z-7t
 for igt-dev@lists.freedesktop.org; Wed, 16 Mar 2022 16:00:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 15:59:57 +0100
Message-Id: <20220316150003.1583681-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20220316150003.1583681-1-mauro.chehab@linux.intel.com>
References: <20220316150003.1583681-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 04/10] scripts/code_cov_gather*/sh: add help
 scripts for code coverage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

When a Linux Kernel is built with gcov support, the compiler creates
some other object files (*.gcno) that are dependent of the compiler
version, and contain references to the source files.

At Kernel runtime at the test machine, counter files will be visible at
sysfs (*.gcda files), which are also on a compiler specific format.

In order to be able to properly parse the contents of the counters, the
information from 3 different places should be merged altogether:

	- Runtime counters: /sys/.../*.gcda and hiperlinks to *.gcno
	- Compile-time cross-reference object files: *.gcno
	- Kernel source code.

If the build machine is different than the source machine, some special
scripts are needed in order to either copy the source files to the
runtime machine or vice versa.

This is described at:

	https://www.kernel.org/doc/html/latest/dev-tools/gcov.html

Copy the two scripts described there as-is.

Further patches will modify them as needed.

Acked-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_gather_on_build.sh | 23 +++++++++++++++++++++++
 scripts/code_cov_gather_on_test.sh  | 20 ++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100755 scripts/code_cov_gather_on_build.sh
 create mode 100755 scripts/code_cov_gather_on_test.sh

diff --git a/scripts/code_cov_gather_on_build.sh b/scripts/code_cov_gather_on_build.sh
new file mode 100755
index 000000000000..99c436f76fb8
--- /dev/null
+++ b/scripts/code_cov_gather_on_build.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+KSRC=$1
+KOBJ=$2
+DEST=$3
+
+if [ -z "$KSRC" ] || [ -z "$KOBJ" ] || [ -z "$DEST" ]; then
+  echo "Usage: $0 <ksrc directory> <kobj directory> <output.tar.gz>" >&2
+  exit 1
+fi
+
+KSRC=$(cd $KSRC; printf "all:\n\t@echo \${CURDIR}\n" | make -f -)
+KOBJ=$(cd $KOBJ; printf "all:\n\t@echo \${CURDIR}\n" | make -f -)
+
+find $KSRC $KOBJ \( -name '*.gcno' -o -name '*.[ch]' -o -type l \) -a \
+                 -perm /u+r,g+r | tar cfz $DEST -P -T -
+
+if [ $? -eq 0 ] ; then
+  echo "$DEST successfully created, copy to test system and unpack with:"
+  echo "  tar xfz $DEST -P"
+else
+  echo "Could not create file $DEST"
+fi
diff --git a/scripts/code_cov_gather_on_test.sh b/scripts/code_cov_gather_on_test.sh
new file mode 100755
index 000000000000..8834aa0d78af
--- /dev/null
+++ b/scripts/code_cov_gather_on_test.sh
@@ -0,0 +1,20 @@
+#!/bin/bash -e
+
+DEST=$1
+GCDA=/sys/kernel/debug/gcov
+
+if [ -z "$DEST" ] ; then
+  echo "Usage: $0 <output.tar.gz>" >&2
+  exit 1
+fi
+
+TEMPDIR=$(mktemp -d)
+echo Collecting data..
+find $GCDA -type d -exec mkdir -p $TEMPDIR/\{\} \;
+find $GCDA -name '*.gcda' -exec sh -c 'cat < $0 > '$TEMPDIR'/$0' {} \;
+find $GCDA -name '*.gcno' -exec sh -c 'cp -d $0 '$TEMPDIR'/$0' {} \;
+tar czf $DEST -C $TEMPDIR sys
+rm -rf $TEMPDIR
+
+echo "$DEST successfully created, copy to build system and unpack with:"
+echo "  tar xfz $DEST"
-- 
2.35.1
