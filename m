Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F85C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 14:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0810E3FE;
	Mon, 31 Mar 2025 14:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCeRhXTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37510E3FE
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743432202; x=1774968202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qgqyBz8GM8nySYZT5Er/QUxBlmeOh8UOMXTUvEdOYI=;
 b=OCeRhXTbcP6QgQZ4MDchacB3quAo8+ob163KXcL/h79bMCyifrhwV4D9
 OEiim8kaSb5HH8D898jW9aCjt6yCrwe5SJMMEytrhO1xb/FNHu8xPretp
 Lbj1p+9Etw6SbnUuTFDi88dCR6MMQ2El7aGc4jGaXdd0658NWd6I4XouO
 qlLBYg+Xm4fiSNo8xVFZfAjUs6QaaxE1jIA6Px4MwAKgzy1eZGrAUdd1u
 uaUIThxm5jtEPBNiNFBOdvY+w3Sy2Zm/d0co0c3Fl2IXL0uHT1bGV5IZ+
 weC3mcclYf0YnlU3Qtg7hVDVkbxv1iJg/paHujOL70VCnCI7fP2CehXjX Q==;
X-CSE-ConnectionGUID: fFkJ/DvuSX6IDMmLmDTD8A==
X-CSE-MsgGUID: mwIGj8rtSqi/kQSve7cXmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44632035"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44632035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:42:07 -0700
X-CSE-ConnectionGUID: YymnH5HZRnO9m3zQ7ZkTzw==
X-CSE-MsgGUID: TYNTqMprTP2ZCeT35vTkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="127009840"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 07:42:06 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid string
 test for engine sysfs properties
Date: Mon, 31 Mar 2025 14:27:49 +0000
Message-Id: <20250331142749.1821941-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250331142749.1821941-1-sobin.thomas@intel.com>
References: <20250331142749.1821941-1-sobin.thomas@intel.com>
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

v2: Added error check for return values for igt_sysfs_scanf and
igt_sysfs_printf. Removed the changes for fault injection in
tests/intel/xe_fault_injection.c

v1: Initial changes for checking error string.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 4fc764f82..594c51d44 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -10,6 +10,11 @@
  * Sub-category: SysMan tests
  * Functionality: scheduler control interface
  *
+ * SUBTEST: %s-invalid-string
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ * min max values.
+ * Test category: Negative string test
+ *
  * SUBTEST: %s-invalid
  * Description: Test to check if %s arg[1] schedule parameter rejects any
  *		unrepresentable intervals.
@@ -121,6 +126,29 @@ static void test_min_max(int xe, int engine, const char **property,
 	igt_assert_eq(set, default_max);
 }
 
+static void test_invalid_string(int xe, int engine, const char **property,
+				uint16_t class, int gt)
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
+			continue;
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
@@ -130,6 +158,7 @@ igt_main
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
+		{ "invalid-string", test_invalid_string },
 		{ }
 	};
 
-- 
2.34.1

