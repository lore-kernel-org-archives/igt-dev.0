Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B3C12A3A9
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 01:55:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id i77so3759202ioa.7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 18:55:11 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 20:54:13 -0500
Message-Id: <20220816015413.1187415-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] replaced /bin/bash shebangs with /bin/sh
 for BSD compatibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jakesfreeland@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jake Freeland <jakesfreeland@gmail.com>

---
 man/rst2man.sh                   | 2 +-
 meson.sh                         | 2 +-
 scripts/code_cov_capture         | 2 +-
 scripts/code_cov_gather_on_build | 2 +-
 scripts/code_cov_gen_report      | 2 +-
 scripts/code_cov_selftest.sh     | 2 +-
 scripts/generate_clear_kernel.sh | 2 +-
 scripts/run-tests.sh             | 2 +-
 scripts/who.sh                   | 2 +-
 tests/generate_testlist.sh       | 6 +++---
 tests/igt_command_line.sh        | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/man/rst2man.sh b/man/rst2man.sh
index 49a98fc5..b7f28991 100755
--- a/man/rst2man.sh
+++ b/man/rst2man.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 rst2man=$1
 input=$2
diff --git a/meson.sh b/meson.sh
index 7cf9d4a3..e112a93c 100755
--- a/meson.sh
+++ b/meson.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 cat > Makefile <<EOF
 
diff --git a/scripts/code_cov_capture b/scripts/code_cov_capture
index 8662b0f1..73c1567d 100755
--- a/scripts/code_cov_capture
+++ b/scripts/code_cov_capture
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 trap 'catch $LINENO' ERR
 catch() {
diff --git a/scripts/code_cov_gather_on_build b/scripts/code_cov_gather_on_build
index eebee89f..a095aa10 100755
--- a/scripts/code_cov_gather_on_build
+++ b/scripts/code_cov_gather_on_build
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 KSRC=$1
 KOBJ=$2
diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
index b7c90b11..b6bc703f 100755
--- a/scripts/code_cov_gen_report
+++ b/scripts/code_cov_gen_report
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 MERGED_INFO="merged"
 GATHER_ON_BUILD="code_cov_gather_on_build.sh"
diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
index 1c4bd96a..8d84b44c 100755
--- a/scripts/code_cov_selftest.sh
+++ b/scripts/code_cov_selftest.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 trap 'catch $LINENO' ERR
 catch() {
diff --git a/scripts/generate_clear_kernel.sh b/scripts/generate_clear_kernel.sh
index 90bbdf5d..b000daed 100755
--- a/scripts/generate_clear_kernel.sh
+++ b/scripts/generate_clear_kernel.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # SPDX-License-Identifier: MIT
 #
diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index 6986232e..1ee5e5fb 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # Copyright © 2014 Intel Corporation
 #
diff --git a/scripts/who.sh b/scripts/who.sh
index b2216398..205cdca0 100755
--- a/scripts/who.sh
+++ b/scripts/who.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # usage: sudo who.sh
 #
diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
index 87637fc8..d506b149 100755
--- a/tests/generate_testlist.sh
+++ b/tests/generate_testlist.sh
@@ -1,16 +1,16 @@
-#!/bin/bash
+#!/bin/sh
 
 OUTPUT=$1
 shift
 
 echo TESTLIST > $OUTPUT
 
-if [[ $# -gt 0 ]] ; then
+if [ $# -gt 0 ] ; then
 	echo -n $1 >> $OUTPUT
 	shift
 fi
 
-while [[ $# -gt 0 ]] ; do
+while [ $# -gt 0 ] ; do
 	echo -n " $1" >> $OUTPUT
 	shift
 done
diff --git a/tests/igt_command_line.sh b/tests/igt_command_line.sh
index fb8f2e2a..3b5b63e4 100755
--- a/tests/igt_command_line.sh
+++ b/tests/igt_command_line.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # Copyright © 2014 Intel Corporation
 #
-- 
2.37.1
