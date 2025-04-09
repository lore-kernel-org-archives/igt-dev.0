Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B35AC369A2
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 02:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197DF10E7B7;
	Wed,  9 Apr 2025 02:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXAK/aCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EB810E7B9
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744166284; x=1775702284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11eBxB45lOm+qh21LK156rIcXBMcqoimshmNqAovcss=;
 b=gXAK/aCDtg5NSMQIaQTqWItzDKg7R9wmyOioE6YbA7oEsdS1uMRlQ3ik
 6vLauk93WD6h42LLs4x8pLShiUjX43cRaLPntTPnL5JCnEYi8EkpYkyXq
 fRTuJSavytrA9fwOzgMvd4GeW6MPWtUUGRM6mNrz8MlWOE1xi9ilnyXA+
 vQxQrKXuc9PDCfaAPz0EmAbPxQ7r/SQWppbwO9AzZOltXT8vw6aLKONVz
 oXADVBwGmEQaEM6v/vPfOtl39288IpHSBb9hZLNxJ2+es5qQVdhmfjMCC
 eS7MMVd8ol33iLowAc3kM1FIx/ITZ4KduOcI0OfFOLc6iTJ/9cVML+3eY A==;
X-CSE-ConnectionGUID: hHm8yyiARS2hHjkT8FQCiQ==
X-CSE-MsgGUID: lhOjvszdR1uaGgQPh02AMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55807324"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="55807324"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 19:38:04 -0700
X-CSE-ConnectionGUID: iifek/iUTd+0t71Pb+AtNw==
X-CSE-MsgGUID: txXhhhfkQyCBw0fMYFkhoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133653499"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 19:38:02 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Wed,  9 Apr 2025 02:22:17 +0000
Message-Id: <20250409022217.2292395-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409022217.2292395-1-sobin.thomas@intel.com>
References: <20250409022217.2292395-1-sobin.thomas@intel.com>
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

v5: Fixed documentation and fixed error.

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
index 4fc764f82..c4386ffce 100644
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
+/**
+ * generate_random_string:
+ * @str: pointer to string buffer that will be having random string generated.
+ * @length: length of string to generate, excluding null termination
+ *
+ * Generates random string that will always contain non-numerical characters.
+ */
+static void generate_random_string(char *str, size_t length)
+{
+	int type = 0;
+	int digit_count = 0;
+	int max_digits = length / 4;
+
+	for (size_t i = 0; i < length; i++) {
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
+	random_str = (char *)malloc(sizeof(char) * (STR_LENGTH + 1));
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

