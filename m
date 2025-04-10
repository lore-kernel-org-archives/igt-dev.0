Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E64C369A4
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 09:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6656310E872;
	Thu, 10 Apr 2025 09:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAKRoWnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C9110E872
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744277645; x=1775813645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fzdKTvGCTUDqyaeEEouX19Yqz9JWzr86kSRhEBkFsnE=;
 b=cAKRoWnJMkt/v2SV7seETQIc5E7cQwqyLsD8ymx5Dko76jtdFnNzvnvL
 y4PXbAe8Lc+3e6aBzx9I3S9pPPce4KgH+hOxdHKqLxuoF1rC7V09ytgaQ
 0Y+fdYr1Ula+pm2JEwXDDSbaEH14V8e+zk/dlXRw/3q7NCBqHydMZcMQ9
 YrsgtbjId1tomEMolDap0eX2g9vdQgTvzKUIU5qaPjElDKcnUIxoedTH0
 gRa6FEbXBHVZfftbzmP6y2pHRYjxlsjMcmZPKbwgwweqaD4LiwP3+qnU+
 2ljucJL6cT0uZ2991+NuxmgfZrjK1taJYyYxt1U9DSK/dzx8wKZzHEqPZ g==;
X-CSE-ConnectionGUID: dxdCTlBORhqCXmWm/CrA7w==
X-CSE-MsgGUID: SkJaoP4bQ9WtYA7vrAMGnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49626024"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49626024"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:33:11 -0700
X-CSE-ConnectionGUID: wk5XJdqHSC+nmnWY8K+QCw==
X-CSE-MsgGUID: X8GTLTpcTyekIUoOH18RHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133571304"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:33:10 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid string
 test for engine sysfs properties
Date: Thu, 10 Apr 2025 09:17:15 +0000
Message-Id: <20250410091715.2611957-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410091715.2611957-1-sobin.thomas@intel.com>
References: <20250410091715.2611957-1-sobin.thomas@intel.com>
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

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

v6: Fixed string termination logic in generate_random_string. (kamil)

v5: Fixed documentation and fixed error.

v4: Added subtests to test large (4k) random strings (kamil).
Replaced igt macro.

v3: Fixed the test logic. Fixed the tabs

v2: Added error check for return values for igt_sysfs_scanf and
igt_sysfs_printf. Removed the changes for fault injection in
tests/intel/xe_fault_injection.c

v1: Initial changes for checking error string.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 99 ++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 4fc764f82..faafabd29 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -15,6 +15,16 @@
  *		unrepresentable intervals.
  * Test category: negative test
  *
+ * SUBTEST: %s-invalid-string
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ *		invalid string values.
+ * Test category: negative test
+ *
+ * SUBTEST: %s-invalid-large-string
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ *		large invalid strings (4k).
+ * Test category: negative test
+ *
  * SUBTEST: %s-min-max
  * Description: Test to check if %s arg[1] schedule parameter checks for
  *		min max values.
@@ -39,6 +49,47 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
+#define STR_LENGTH 4096
+
+/**
+ * generate_random_string:
+ * @str: pointer to string buffer that will be having random string generated.
+ * @length: length of string to generate.
+ *
+ * Generates random string that will always contain non-numerical characters.
+ */
+static void generate_random_string(char *str, size_t length)
+{
+	int type = 0;
+	int digit_count = 0;
+	int max_digits = length / 4;
+	int loop_count = length - 1;
+
+	for (size_t i = 0; i < loop_count; i++) {
+		if (digit_count >= max_digits)
+			type = rand() % 2;
+		else
+			type = rand() % 3;
+
+		switch (type) {
+		case 0:
+			str[i] = 'A' + (rand() % 26);
+			break;
+		case 1:
+			str[i] = 'a' + (rand() % 26);
+			break;
+		case 2:
+			str[i] = '0' + (rand() % 10);
+			digit_count++;
+			break;
+		default:
+			str[i] = '_';
+			break;
+		}
+	}
+	str[length - 1] = '\0';
+}
+
 static void test_invalid(int xe, int engine, const char **property,
 			 uint16_t class, int gt)
 {
@@ -121,6 +172,52 @@ static void test_min_max(int xe, int engine, const char **property,
 	igt_assert_eq(set, default_max);
 }
 
+static void test_invalid_string(int xe, int engine, const char **property,
+				 uint16_t class, int gt)
+{
+	unsigned int saved, set;
+	static const char invalid_input[] = "999abc";
+
+	for (int i = 0; i < 3; i++) {
+		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &saved), 1);
+		igt_info("Initial %s: %u\n", property[i], saved);
+		/* Assert if the invalid write is returning negative error */
+		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
+			      invalid_input), 0);
+
+		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &set), 1);
+		/* Check if the values are unchanged. */
+		igt_assert_eq(set, saved);
+	}
+}
+
+static void test_invalid_large_string(int xe, int engine, const char **property,
+				       uint16_t class, int gt)
+{
+	unsigned int saved, set;
+	char *random_str;
+
+	random_str = (char *)malloc(sizeof(char) * (STR_LENGTH));
+	igt_assert_f(random_str, "Memory allocation failed\n");
+
+	generate_random_string(random_str, STR_LENGTH);
+	igt_debug("Generated random string: %.10s...\n", random_str);
+
+	for (int i = 0; i < 3; i++) {
+		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &saved), 1);
+		igt_info("Initial %s: %u\n", property[i], saved);
+
+		/* Assert if the invalid write is returning negative error */
+		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
+			      random_str), 0);
+
+		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &set), 1);
+		/* Check if the values are unchanged. */
+		igt_assert_eq(set, saved);
+	}
+	free(random_str);
+}
+
 #define MAX_GTS 8
 igt_main
 {
@@ -129,6 +226,8 @@ igt_main
 		void (*fn)(int, int, const char **, uint16_t, int);
 	} tests[] = {
 		{ "invalid", test_invalid },
+		{ "invalid-string", test_invalid_string },
+		{ "invalid-large-string", test_invalid_large_string },
 		{ "min-max", test_min_max },
 		{ }
 	};
-- 
2.34.1

