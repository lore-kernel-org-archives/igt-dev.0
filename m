Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C1C606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cUqhv+N1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507710E6E7;
	Fri, 23 Oct 2026 21:05:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37710E5F1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789392; x=1824325392;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=endbyfxCM/WabkC5CmmUi9GfWNmIrt1+4MG7VKdmcrg=;
 b=cUqhv+N19KoHRLmfrztKz2foonYxtyqLXxFASYms8nEJ+jOlPMWnnH8l
 EqFdY3e2dCRlMBJbYwmvMLoCo3PCHZaR8OwdMSYgDqk69fqxMM3M0EmH3
 EQ6rNM/L1mqUyOEuPZ859hw+R6VFYMJBbNn9H4XRmdkBTC6nvWA68uDrG
 rj+VHXHdVHNciaofk9Mq1Q3q69yRUpnQGVFVnYOw/2ja2vPhWdf2elKs4
 c4ABMSDa+nZMbCiBE7R5YUHJB9LtOcSNGVFByHfa9POeuZx5NehyYqGZG
 5JTZhuNh1h5MpuKt8jdO6jIVX/zgmgA2U1+3fcap58njgWlf+f80Lkc07 w==;
X-CSE-ConnectionGUID: Ht7RiobdRbGBGSaLtCB03Q==
X-CSE-MsgGUID: mdbE9NoQRRyXxS/J4WON6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457460"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457460"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:09 -0700
X-CSE-ConnectionGUID: 9eoxd+0KSSm3TRXIXnfFrw==
X-CSE-MsgGUID: G6ttF7zYRSOq4VsmIsIXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585776"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:08 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:37 -0300
Subject: [PATCH i-g-t v3 02/11] lib/xe: Make debugfs_file_has_wa() aware of
 the debugfs file layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261023-wa_14026539277-v3-2-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently debugfs_file_has_wa() uses strstr() to check if a workaround
name is present in the debugfs dump.  That's a bit fragile because
that solution isn't aware of the layout of a workaround debugfs dump.
The strstr() call could match a substring of a workaround or even a
"section line" of the file.

Make workaround matching more robust by adding a proper parser for the
debugfs dump.

While at it, let's make sure that we have a lib test to validate the
new logic.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/tests/meson.build |  1 +
 lib/tests/xe_wa.c     | 42 +++++++++++++++++++++++++++++++
 lib/tests/xe_wa.h     | 12 +++++++++
 lib/xe/xe_wa.c        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 0a7c903f16a4..18967e59293c 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -29,6 +29,7 @@ lib_tests = [
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
2.56.0

