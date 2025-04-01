Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB9C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 11:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212C10E2C3;
	Tue,  1 Apr 2025 11:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9ZWof39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCD110E0ED
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743508795; x=1775044795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QflA2TVNS0Gzn4OE33NwIS+g+pyMD43vLTj12GepP2c=;
 b=K9ZWof39SOP86lzZ64TqAozZRyCUc2ceWNCkDt3di+S+qWZwPjY5U/kU
 rQOSk9iFyeovrr1XHVXyHKlOqVn95Z7aFep9Txn9d8rVRD74zvK6IJmrm
 iOKGatCsI9ZvF3nK5sB9tlCunG608uSssKXwCzW313Vt3vlrpmSTvDdBV
 6tt8WURYOMRIS0CsE+UruE35qOFhP86OT5n0h4g4jVZcVv12+InqS7fgN
 YdX2G+3GxzDgYxqTmcpU/60rHDjhnvRQgLbGIwnfK/fmEEkwMfk8V7mqn
 m4deAYG34E0ro1M+C2iPQgBTkDz6vu88/K0O37sDfO61KrPmA1JxL5HSF A==;
X-CSE-ConnectionGUID: y8FfN1XbQ7KlJnXYZuJLzg==
X-CSE-MsgGUID: 9wIXwr7iREaKXa7eyzUpQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44926927"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44926927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 04:59:55 -0700
X-CSE-ConnectionGUID: swo6WXncT4G+4BkNz0RePA==
X-CSE-MsgGUID: 7tihRyOIQWWTy8Qa6wI+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="163594529"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa001.jf.intel.com with ESMTP; 01 Apr 2025 04:59:54 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Tue,  1 Apr 2025 11:45:29 +0000
Message-Id: <20250401114529.1828868-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401114529.1828868-1-sobin.thomas@intel.com>
References: <20250401114529.1828868-1-sobin.thomas@intel.com>
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

From: Sobin Thomas <sobin.thomas@intel.com>

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

v3: Fixed the test logic. Fixed the tabs

v2: Added error check for return values for igt_sysfs_scanf and
igt_sysfs_printf. Removed the changes for fault injection in
tests/intel/xe_fault_injection.c

v1: Initial changes for checking error string.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 4fc764f82..eb95d0d6e 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -10,6 +10,11 @@
  * Sub-category: SysMan tests
  * Functionality: scheduler control interface
  *
+ * SUBTEST: %s-invalid-string
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ *		min max values.
+ * Test category: Negative string test
+ *
  * SUBTEST: %s-invalid
  * Description: Test to check if %s arg[1] schedule parameter rejects any
  *		unrepresentable intervals.
@@ -121,6 +126,28 @@ static void test_min_max(int xe, int engine, const char **property,
 	igt_assert_eq(set, default_max);
 }
 
+static void test_invalid_string(int xe, int engine, const char **property,
+			uint16_t class, int gt)
+{
+	unsigned int saved, set;
+	char invalid_input[] = "999abc";
+
+	for (int i = 0; i < 3; i++) {
+		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &saved) == 1);
+		igt_info("Initial %s: %u\n", property[i], saved);
+		if (igt_sysfs_printf(engine, property[i], "%s", invalid_input) > 0) {
+			igt_critical("invalid value %s can be set to property %s\n",
+					invalid_input, property[i]);
+		}
+
+		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &set) == 0);
+
+		//Check if the values are unchanged.
+		igt_assert_eq(set, saved);
+	}
+}
+
+
 #define MAX_GTS 8
 igt_main
 {
@@ -130,6 +157,7 @@ igt_main
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
+		{ "invalid-string", test_invalid_string },
 		{ }
 	};
 
-- 
2.34.1

