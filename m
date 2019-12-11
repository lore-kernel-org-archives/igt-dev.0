Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813236EA30
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:43 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:11 -0800
Message-Id: <20191211005235.67897-6-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 05/29] Use /bin/sh for shell scripts
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
List-ID: <igt-dev@lists.freedesktop.org>

These scripts don't use an bash-specific functionality, and bsd is
not available by default on FreeBSD.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 man/rst2man.sh             | 2 +-
 tests/generate_testlist.sh | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man/rst2man.sh b/man/rst2man.sh
index 49a98fc5..b7f28991 100755
--- a/man/rst2man.sh
+++ b/man/rst2man.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 rst2man=$1
 input=$2
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
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
