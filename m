Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C7E68149
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 09:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB010E4AB;
	Tue, 17 Feb 2026 09:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjrbVxjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B601B10E4AB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771320010; x=1802856010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VroK6iKOxbB7+NaUDKcKCIVEuG3isSou8Xwf2c0TBrE=;
 b=jjrbVxjNhew1Y+6H1ZkFkEDX2GSxj5jVI+qdgn17C+aC9GtaXJdpw5G1
 7hIBdjLrgB1nedjnY9iM8vey6fnfRz7hhHGYvm4ll+MTR7jF36LdccHJc
 6rkafI8cUMBP0q2lnnOAF5vCSaqroO0JoJ1QG6XKjaFICGjbKBuvYeheg
 0LHABFAihSQeJZ3ijG1KXtRHSGdwp6AV/5+w1vWL2DjOpPJP3LCc2speR
 mKTqkzC/7mVSgAFiekJdSS5kUEjTjCbwf6XDc7e1laax23Ox0xD3iOGZ2
 pREj2HOUA3tQ0jblTCPPLlXa3yExnpiYgrpL7jQjHpj01r84k3kNDumhl A==;
X-CSE-ConnectionGUID: +IR5va4oTFeqJnZURAzRvg==
X-CSE-MsgGUID: XKtsotBoQYGF5vezmYGmeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83823013"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83823013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:10 -0800
X-CSE-ConnectionGUID: /wVE05iYQpW2oNQZY5OvAA==
X-CSE-MsgGUID: wIZcKTSDTQOjp6NNmzBa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="217964927"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa003.jf.intel.com with ESMTP; 17 Feb 2026 01:20:09 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Restructure modifier
 validation into per-modifier subtests
Date: Tue, 17 Feb 2026 15:00:48 +0530
Message-Id: <20260217093048.1597495-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Previously, all modifiers were exercised within a single
subtest, making failures/skips hard to isolate and debug.
This new flow generates explicit subtest names (filter-modifier-%s)
for each modifier, improving clarity and CI reporting.

Each subtest now validates only the selected modifier, and
unsupported format/modifier combinations are cleanly skipped.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 34 +++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index eddfad6b9..0140363bc 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -21,9 +21,6 @@
  * SUBTEST: filter-strength
  * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
  *
- * SUBTEST: filter-modifiers
- * Description: Verify content adaptive sharpness filter with varying modifiers.
- *
  * SUBTEST: filter-rotations
  * Description: Verify content adaptive sharpness filter with varying rotations.
  *
@@ -70,6 +67,17 @@
  *              sharpness filter.
 */
 
+/**
+ * SUBTEST: filter-modifier-%s
+ * Description: Verify content adaptive sharpness filter with varying modifiers.
+ *
+ * arg[1]:
+ *
+ * @linear:	linear
+ * @x-tiled:	x-tiled
+ * @4-tiled:	4-tiled
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 
 /*
@@ -596,16 +604,22 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying modifiers.");
-	igt_subtest_with_dynamic("filter-modifiers") {
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 		data.rotation = IGT_ROTATION_0;
 		data.format = DRM_FORMAT_XRGB8888;
 		data.filter_strength = MID_FILTER_STRENGTH;
-
-		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
-			data.modifier = modifiers[i].modifier;
-			data.modifier_name = modifiers[i].name;
+		data.modifier = modifiers[i].modifier;
+		data.modifier_name = modifiers[i].name;
+
+		igt_describe("Verify content adaptive sharpness filter with "
+			     "varying modifiers.");
+		igt_subtest_with_dynamic_f("filter-modifier-%s", data.modifier_name) {
+			igt_skip_on_f((!igt_display_has_format_mod(&data.display,
+								   DRM_FORMAT_XBGR8888,
+								   data.modifier)),
+				       "Skipping: Modifier " IGT_MODIFIER_FMT
+				       " is not supported on this platform\n",
+				       IGT_MODIFIER_ARGS(data.modifier));
 
 			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
 		}
-- 
2.34.1

