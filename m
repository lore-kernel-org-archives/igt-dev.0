Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A9BC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165910F1DE;
	Wed, 23 Sep 2026 21:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAiQKBGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170E110F1DF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Z0w3VYinXLNT6nhWQScYJUfcuyqwwvLFe8hGX+gyy/E=;
 b=NAiQKBGV50P/cbh8XfcXHSpsVL4DXmhZMo/wKDSXKcb/sBmb/eEMz5Me
 RzViQ+MBBeSxONd6mQo2L6givju48TjRT/Ath6u9dg0vL597BT3m0EEfZ
 THDUbWtBNz5fxsAG8sWkq3FY1P7IjVgXulXu1QFdPMYcny1ELWbvC7BoT
 WA0THm1uZJo/qARScZEyca53Ddy4Pl646HnWv57Kgvy9HhC3M7wX2a86P
 pvgGnYNGMGFd+qwzgBGUVFknF3rl+zdZNWLryKHDeBCLjcqRG4ytV2jEU
 CLHswpYFwoDNWzu4O3ARXvXwYCEec0/QOrwbwJilnp5bv5WdBUYaFoNCD Q==;
X-CSE-ConnectionGUID: LOmetemxS0CP7DOENHS2XA==
X-CSE-MsgGUID: YL/2LOpUTlyurOf4/t1EVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445401"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445401"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:53 -0700
X-CSE-ConnectionGUID: p661o5b2RaeUlSePBJIkUA==
X-CSE-MsgGUID: kI3E27sHTTikpP6uJyxRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907690"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:09 -0300
Subject: [PATCH i-g-t v2 02/11] lib/xe: Make debugfs_file_has_wa() aware of
 the debugfs file layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-wa_14026539277-v2-2-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Currently debugfs_file_has_wa() uses strstr() to check if a workaround
name is present in the debugfs dump.  That's a bit fragile because
that solution isn't aware of the layout of a workaround debugfs dump.
The strstr() call could match a substring of a workaround or even a
"section line" of the file.

Make workaround matching more robust by adding a proper parser for the
debugfs dump.

While at it, let's make sure that we have a lib test to validate the
new logic.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/tests/meson.build |  1 +
 lib/tests/xe_wa.c     | 42 +++++++++++++++++++++++++++++++
 lib/tests/xe_wa.h     | 12 +++++++++
 lib/xe/xe_wa.c        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index f1db66d07c28..aa8cb37c2252 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -28,6 +28,7 @@ lib_tests = [
 	'igt_thread',
 	'igt_types',
 	'i915_perf_data_alignment',
+	'xe_wa',
 ]
 
 lib_fail_tests = [
diff --git a/lib/tests/xe_wa.c b/lib/tests/xe_wa.c
new file mode 100644
index 000000000000..d03d3f4e2ca0
--- /dev/null
+++ b/lib/tests/xe_wa.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_core.h"
+
+#include "tests/xe_wa.h"
+
+static char fake_dump[] =
+	"Some workarounds\n"
+	"	wa_a\n"
+	"	wa_b\n"
+	"Another set of workarounds\n"
+	"	wa_c\n"
+	"	wa_d\n"
+	"Yet another, but empty section\n"
+	"A final section\n"
+	"	wa_x, wa_y, wa_z\n"
+	"	wa_abcd\n";
+
+int igt_simple_main()
+{
+	/* Match workaround that is the single occurrence in the line. */
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_c"), 1);
+
+	/* Match workarounds that are listed with others in the same line. */
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_x"), 1);
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_y"), 1);
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_z"), 1);
+
+	/* Do not match non-existing workarounds. */
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "non-existing"), 0);
+
+	/* Match full workaround name and not substrings. */
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_abc"), 0);
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_abcd"), 1);
+
+	/* Don't match section titles. */
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "Some workarounds"), 0);
+	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "Another set of workarounds"), 0);
+}
diff --git a/lib/tests/xe_wa.h b/lib/tests/xe_wa.h
new file mode 100644
index 000000000000..3ca2a553fe68
--- /dev/null
+++ b/lib/tests/xe_wa.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef LIB_TESTS_XE_WA_H
+#define LIB_TESTS_XE_WA_H
+
+int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa);
+
+#endif /* LIB_TESTS_XE_WA_H */
+
diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 7b8e54b2ad27..c0c97e244564 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -4,6 +4,7 @@
  */
 
 #include <fcntl.h>
+#include <regex.h>
 #include <stdint.h>
 #include <stdio.h>
 
@@ -13,6 +14,68 @@
 #include "xe/xe_query.h"
 #include "xe/xe_wa.h"
 
+#include "tests/xe_wa.h"
+
+static int debugfs_dump_has_wa(char *dump, const char *wa)
+{
+	size_t wa_len;
+	regex_t regex;
+	regmatch_t match[2];
+	int ret;
+
+	if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
+		igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
+			     wa);
+
+		return -1;
+	}
+
+	wa_len = strlen(wa);
+	ret = 0;
+
+	while (*dump) {
+		/*
+		 * Each workaround name is indented by one tab
+		 * character; unindented lines are used as "section
+		 * names" identifying the type of workarounds that
+		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
+		 * etc) and should be ignored.
+		 */
+		if (*dump != '\t')
+			goto next_line;
+
+		while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
+			char *other_wa = dump + match[1].rm_so;
+			size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
+
+			dump += match[0].rm_eo;
+
+			if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
+				ret = 1;
+
+				goto done;
+			}
+		}
+
+	next_line:
+		while (*dump && *dump != '\n')
+			dump++;
+
+		if (*dump)
+			dump++;
+	}
+
+done:
+	regfree(&regex);
+
+	return ret;
+}
+
+int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
+{
+	return debugfs_dump_has_wa(dump, wa);
+}
+
 static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 			       const char *debugfs_name, const char *wa)
 {
@@ -23,12 +86,12 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 
 	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
 	if (debugfs_dump) {
-		char *has_wa = strstr(debugfs_dump, wa);
+		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
 
 		free(debugfs_dump);
 
-		if (has_wa)
-			return 1;
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.55.0

