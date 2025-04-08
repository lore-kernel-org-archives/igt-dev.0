Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A6DC3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 04:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BA410E5B0;
	Tue,  8 Apr 2025 04:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjG01DcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6EA10E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 04:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086880; x=1775622880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+QW4nvvo6osh/Z9lggm6U3Ze9jNafeX6kVwyiq8oPQ=;
 b=JjG01DcNqrO8meWCQBcn/aBGjLQMtc+IusBKzJC9zvdQs2tQZELHHCdI
 XLy6JVF3bBU1YB9fkf12G3TKnWfvwPV76ILQocopvfmMXKQbXcTGndW2c
 AgRRHvXFtfQaTMRqs0O3UfmEhQMQRkiUn0PXw/lCs9a84SjX3ty24aex4
 AmnT1Js5dWB6e3sjgDmCNRtmvmmhSj9x3Fu2gS/VOjVx3tuW0btw5Xh4m
 kr+1NRwjhEaCEupqiI88uTiK2rv+EzYb9hFgaxYjnzPWDg4ao0SsKdgyU
 lEo69osGXxX8K7+fcusjWeCQtnKwvrROnzQ76xdzw0C9YbInWErp84e1L A==;
X-CSE-ConnectionGUID: 5LWFb1XLSFm7SadrqY0YaA==
X-CSE-MsgGUID: /zxVXrLOTKK+wUFwAyHxMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63044288"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63044288"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:34:40 -0700
X-CSE-ConnectionGUID: qaTw2UQtSQOJN6X8IieR9Q==
X-CSE-MsgGUID: SujQP81DTAuOFf56GsHjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="132278249"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:34:39 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid string
 test for engine sysfs properties
Date: Tue,  8 Apr 2025 04:18:48 +0000
Message-Id: <20250408041848.2264963-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408041848.2264963-1-sobin.thomas@intel.com>
References: <20250408041848.2264963-1-sobin.thomas@intel.com>
MIME-Version: 1.0
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

v4: Added subtests to test large (4k) random strings (kamil).
Replaced igt macro.

v3: Fixed the test logic. Fixed the tabs

v2: Added error check for return values for igt_sysfs_scanf and
igt_sysfs_printf. Removed the changes for fault injection in
tests/intel/xe_fault_injection.c

v1: Initial changes for checking error string.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 4fc764f82..285689778 100644
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
@@ -39,6 +49,46 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
+#define STR_LENGTH 4096
+
+/*
+ * generate_random_string function is supposed to generate random
+ * string with more bias on alphabets than numeric this function
+ * provides random string based on the output of rand() and can
+ * sometime provide same class of characters if the output of
+ * rand() is same.
+ */
+static void generate_random_string(char *str, size_t length)
+{
+	int type = 0;
+	int digit_count = 0;
+	int max_digits = length / 4;
+
+	for (size_t i = 0; i < length; i++) {
+		if (digit_count >= max_digts)
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
+	str[length] = '\0';
+}
+
 static void test_invalid(int xe, int engine, const char **property,
 			 uint16_t class, int gt)
 {
@@ -121,6 +171,52 @@ static void test_min_max(int xe, int engine, const char **property,
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
+	random_str = (char *)calloc(STR_LENGTH, sizeof(char));
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
+				random_str), 0);
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
@@ -129,6 +225,8 @@ igt_main
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

