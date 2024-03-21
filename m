Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C0C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 16:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1710EECF;
	Thu, 21 Mar 2024 16:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsXivhn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568DD10EECF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711037780; x=1742573780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U0xleJpBoeSKEKTpiAiM87BnS71ecdmnNU+SpqBphms=;
 b=JsXivhn4lG83RBhZryH2UENninuw85qHCF6uC4m1ywnDoMlRZ+zqpSHl
 hji/BGyQ3HoGKoWe2WtQu7SmFE301UUHhzMUOBhzJnBRf6/ZRiRkuJnPC
 HrKG6EF/IeMcq4KrT0lR8ThPPj2Ox+kc1jr7TyR9XvnGg952LcoLBHUv0
 xBXAvCGfRPGJ0Rw7avGlBaPsiK8JM8ZCD7++/816VPgYNb0XTlQU7lzeg
 ZqqQK3T5OE30ZyzzjY8qq+I4gwmv55kNvrlKbZGsedR0XrmmaFhYXIYVZ
 Gs0XQCCZTrnALbi3CEA6rGEfeT/l6p0JAPgl/bgGmCUZqhyxXyJkqUD5Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16676551"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16676551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14972270"
Received: from unknown (HELO localhost) ([10.245.246.252])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:15:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t] scripts/doc-tests-cross-check: check for collisions
Date: Thu, 21 Mar 2024 17:15:42 +0100
Message-ID: <20240321161549.75950-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Create script for checking if keywords used in descriptions
have any collisions, as we want them to appear in only one field.
For example, 'reset' word is used now in two different fields
Functionality and Sub-category:

tests/intel/xe_exec_reset.c: * Functionality: reset
tests/device_reset.c: * Sub-category: Reset

With this it will help to spot such potential problems.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/doc-tests-cross-check.sh | 160 +++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100755 scripts/doc-tests-cross-check.sh

diff --git a/scripts/doc-tests-cross-check.sh b/scripts/doc-tests-cross-check.sh
new file mode 100755
index 000000000..174b14807
--- /dev/null
+++ b/scripts/doc-tests-cross-check.sh
@@ -0,0 +1,160 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2024 Intel Corporation
+#
+# copy this script to folder as it creates lots of output files
+# igt tests should be reachable from ../tests/ path
+# for example, when you are in main igt folder:
+#
+# mkdir out
+# cp scripts/doc-cross-check.sh out/
+# cd out
+# ./doc-cross-check.sh
+
+# prepare list of .c files for checks
+
+TESTLISTIGT=".testfiles"
+
+ls -1 ../tests/*c        > $TESTLISTIGT
+ls -1 ../tests/intel/*c >> $TESTLISTIGT
+
+TESTLIST=`cat $TESTLISTIGT`
+if [ $? -ne 0 ]; then
+	echo "Error: Could not read test lists"
+	exit 99
+fi
+
+grep_test ()
+{
+	local test
+	local myout
+
+	test=$1
+	myout=$2
+
+	echo "running: $myout file: $test"
+	grep $myout: $test | sed -e "s/...$2: //" \
+		| tr '[:upper:]' '[:lower:]' | sed -e 's/, /\n/g' \
+		| sed -e 's/ /Y/g' >> b.$myout
+	grep -r $myout: ../tests/* >> n.$myout
+}
+
+
+one_scan_dir ()
+{
+	rm b.$1
+	rm n.$1
+
+	for nfile in $TESTLIST; do
+		grep_test $nfile $1
+	done
+
+	sort -u < b.$1 > c.$1
+
+	rm .tmp_one_scan
+	mv n.$1 .tmp_one_scan
+	sort -u < .tmp_one_scan > n.$1
+}
+
+scan_dirs ()
+{
+	rm a.columns
+
+	for todo in $@; do
+		echo $todo >> a.columns
+		echo "Scanning name: $todo"
+		one_scan_dir $todo
+	done
+}
+
+check_test ()
+{
+	TWORDS=`cat c.$1`
+	if [ $? -ne 0 ]; then
+		echo "Error: Could not read c.$1"
+		exit 99
+	fi
+
+#	cat c.$2 c.$3 > w.$1
+# cat c.* except c.$1 is in w.$1
+
+	echo "=============================================="
+	echo "checking: $1"
+	echo "=============================================="
+
+	rm .tmp_check
+
+	for test in $TWORDS; do
+		grep -i -w "$test" w.$1 >> .tmp_check
+	done
+
+	sort -u < .tmp_check > e.$1
+}
+
+# will use .tmpcols and create w.$1
+# this is complement of all columns exept $1
+make_w ()
+{
+	WMK=`cat .tmpcols`
+	if [ $? -ne 0 ]; then
+		echo "Error: Could not read .tmpcols"
+		exit 99
+	fi
+
+	rm .tmp_make_w
+	for one_rec in $WMK; do
+		cat c.$one_rec >> .tmp_make_w
+	done
+
+	sort -u < .tmp_make_w > w.$1
+}
+
+# will use a.columns to cross-check
+check_all ()
+{
+	COL=`cat a.columns`
+	if [ $? -ne 0 ]; then
+		echo "Error: Could not read c.$1"
+		exit 99
+	fi
+
+	for one_col in $COL; do
+		grep -v $one_col a.columns > .tmpcols
+		make_w $one_col
+		check_test $one_col
+	done
+}
+
+echo "=============================================="
+echo "scanning..."
+echo "=============================================="
+# Category/Sub-category/Functionality/Feature
+# scan_dirs Category Feature Sub-category
+
+# Mega feature / Category / Sub-category / Functionality
+# Mega-feature is not used now
+scan_dirs Category Sub-category Functionality
+
+echo "=============================================="
+echo "checking..."
+echo "=============================================="
+check_all
+
+echo "=============================================="
+echo "Columns are in c.* files"
+echo "=============================================="
+wc -l c.[A-Za-z]*
+echo "=============================================="
+echo "Results (possible conflicts) are in e.* files"
+echo "=============================================="
+wc -l e.[A-Za-z]*
+
+echo ""
+echo "=============================================="
+echo "example useage: take a word from e.* file and grep it in c*"
+echo "grep -i word c.*"
+echo "to see where it is used in tests, use:"
+echo "grep -i word n.*"
+echo "=============================================="
+
-- 
2.42.0

