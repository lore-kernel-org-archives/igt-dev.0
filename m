Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6B10E976
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:47 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nOxQ0-000WkJ-OF
 for igt-dev@lists.freedesktop.org; Tue, 01 Mar 2022 08:59:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 08:59:28 +0100
Message-Id: <20220301075929.125733-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 8/9] scripts:code_cov_gather_on_test: use a
 faster script
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

From: Tomi Sarvela <tomi.p.sarvela@intel.com>

The original shell script takes too long to complete (~7-10 seconds),
while the python version requires only ~500 ms.

As this has a relevant impact when doing the tests, use the faster
version.

Signed-off-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_gather_on_test.py | 91 ++++++++++++++++++++++++++++++
 scripts/code_cov_gather_on_test.sh | 20 -------
 2 files changed, 91 insertions(+), 20 deletions(-)
 create mode 100755 scripts/code_cov_gather_on_test.py
 delete mode 100755 scripts/code_cov_gather_on_test.sh

diff --git a/scripts/code_cov_gather_on_test.py b/scripts/code_cov_gather_on_test.py
new file mode 100755
index 000000000000..b4356aa1397b
--- /dev/null
+++ b/scripts/code_cov_gather_on_test.py
@@ -0,0 +1,91 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0 OR MIT
+#
+# Copyright (C) 2022 Intel Corporation
+#
+# gather_on_test.py
+#
+# by Tomi Sarvela <tomi.p.sarvela@intel.com>
+#
+# Faster implementation for linux kernel GCOV data collection
+# Command line compatible with original gather_on_test.sh
+#
+# Refs:
+# https://www.kernel.org/doc/html/latest/dev-tools/gcov.html
+#
+import argparse
+import errno
+import io
+import os
+import sys
+import tarfile
+
+def parse_args() -> argparse.Namespace:
+    '''Command line arguments'''
+    ap = argparse.ArgumentParser(description="Gather Linux kernel GCOV data")
+    ap.add_argument('output',
+                    help="Output file name (.tar.gz will be added)")
+    ap.add_argument('--gcov', default='/sys/kernel/debug/gcov',
+                    help="GCOV directory, default: /sys/kernel/debug/gcov")
+    return ap.parse_args()
+
+def tar_add_link(tar:tarfile.TarFile, filename:str):
+    '''Add filename as symlink to tarfile'''
+    info = tarfile.TarInfo(filename)
+    if info.name[0] == '/': info.name = info.name[1:]
+    info.type = tarfile.SYMTYPE
+    info.linkname = os.readlink(filename)
+    tar.addfile(info)
+
+def tar_add_file(tar:tarfile.TarFile, filename:str):
+    '''Add filename to tarfile, file size expected to be invalid'''
+    try:
+        with open(filename, "rb") as fp:
+            data = fp.read() # big gulp
+    except OSError as e:
+        print(f"ERROR: {filename}: {e}", file=sys.stderr)
+        return
+    info = tarfile.TarInfo(filename)
+    if info.name[0] == '/': info.name = info.name[1:]
+    info.size = len(data)
+    tar.addfile(info, io.BytesIO(data))
+
+def tar_add_tree(tar:tarfile.TarFile, tree:str):
+    '''Add gcov files in directory tree to tar'''
+    # FIXME: should dirs be added to tar for compatibility?
+    for root, _, files in os.walk(tree, followlinks=False):
+        for file in files:
+            filepath = os.path.join(root, file)
+            if file.endswith('.gcda'): tar_add_file(tar, filepath)
+            if file.endswith('.gcno'): tar_add_link(tar, filepath)
+
+def main() -> int:
+    '''MAIN'''
+    if not os.path.isdir(args.gcov):
+        print(f"ERROR: [Errno {errno.ENOTDIR}] {os.strerror(errno.ENOTDIR)}: '{args.gcov}'",
+              file=sys.stderr)
+        return errno.ENOTDIR
+    if args.output == '-':
+        # reopen stdout as bytes for tarfile
+        fp = os.fdopen(sys.stdout.fileno(), "wb", closefd=False)
+    else:
+        if not args.output.endswith('.tgz') and \
+           not args.output.endswith('.tar.gz'):
+            args.output+='.tar.gz'
+        try:
+            fp = open(args.output, 'wb')
+        except OSError as e:
+            print(f"ERROR: {e}", file=sys.stderr)
+            return e.errno
+    with tarfile.open(fileobj=fp, mode='w:gz') as tar:
+        tar_add_tree(tar, args.gcov)
+    fp.close()
+    return 0
+
+if __name__ == '__main__':
+    try:
+        args = parse_args()
+        sys.exit(main())
+    except KeyboardInterrupt:
+        print("Interrupted", file=sys.stderr)
+        sys.exit(errno.EINTR)
diff --git a/scripts/code_cov_gather_on_test.sh b/scripts/code_cov_gather_on_test.sh
deleted file mode 100755
index 8834aa0d78af..000000000000
--- a/scripts/code_cov_gather_on_test.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/bash -e
-
-DEST=$1
-GCDA=/sys/kernel/debug/gcov
-
-if [ -z "$DEST" ] ; then
-  echo "Usage: $0 <output.tar.gz>" >&2
-  exit 1
-fi
-
-TEMPDIR=$(mktemp -d)
-echo Collecting data..
-find $GCDA -type d -exec mkdir -p $TEMPDIR/\{\} \;
-find $GCDA -name '*.gcda' -exec sh -c 'cat < $0 > '$TEMPDIR'/$0' {} \;
-find $GCDA -name '*.gcno' -exec sh -c 'cp -d $0 '$TEMPDIR'/$0' {} \;
-tar czf $DEST -C $TEMPDIR sys
-rm -rf $TEMPDIR
-
-echo "$DEST successfully created, copy to build system and unpack with:"
-echo "  tar xfz $DEST"
-- 
2.35.1
