Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA0CF884C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 12:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EADF10E173;
	Thu, 20 Nov 2025 12:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpGkuN5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3010E173
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763642081; x=1795178081;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0O0vDqzt9XgP5DaqJEU90LjZQHqnsPHXOeSjU1mC0F8=;
 b=YpGkuN5CasWlMqDGfTrRzUVTBW0fQn8eF5kNqyQWuezAtEe/M7KatLKg
 SSYQtiZ3njOS8V8xHm11cJOVIgtrWEOAPPJ9l+xN6rGQtHYEUcafXi0tk
 HcEfj9bU3tazW88EpSkt9V8TsPuTsnB9zotATb2D/tOVGNBrvdtf68ggk
 i16u6YrNpoi512XD24xHBoGooY9i+4dU+CtgrPadPkBQXamYBy0FL7tNy
 jeXFjJRSmUXbTLDbgQHBlwIaKEjDWe9brWKfFidKFIQxlSDwdezF/TiLD
 SrtUj7K3g0z6KAqek/SkhsQju0+JGf3c2bzaeU0APGR8olUPaguAQGpAa Q==;
X-CSE-ConnectionGUID: 4ZiHHlZJTPyw5IS2zfB02g==
X-CSE-MsgGUID: GawwYsK7RrqQpGmuY8pbeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69325333"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69325333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:34:40 -0800
X-CSE-ConnectionGUID: EFmcAUzxTvaQs0xXzfcMjQ==
X-CSE-MsgGUID: b3M4kRLjSaGCNnwhkyM/XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191786197"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 04:34:38 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, gustavo.sousa@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed
Date: Thu, 20 Nov 2025 18:04:37 +0530
Message-ID: <20251120123437.467347-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test for the parsing of gt_types_allowed configfs.
Validate different gt types like primary, media gt types
and check if it can be set or not. Also try to set invalid values.

v2: Tried to validate gt types in different orders and ways.
Removed kmod_unbind before checking invalid values. (Sousa).

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>`
---
 tests/intel/xe_configfs.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 911e18965..da1879bb2 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -149,6 +149,43 @@ static void test_engines_allowed(int configfs_device_fd)
 	}
 }
 
+/**
+ * SUBTEST: gt-types-allowed
+ * Description: Validate gt_types_allowed attribute
+ */
+static void test_gt_types_allowed(int configfs_device_fd)
+{
+	static const char *values[] = {
+		"primary,media", "primary", "media", "",
+		"media,primary", "primary\n", "primary\nmedia",
+		"media\n", "media\nprimary\n",
+	};
+
+	static const char *invalid_values[] = {
+                "check",
+        };
+
+	/*
+	 * These only test if gt type parsing is correct, so just make sure
+	 * there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const char *v = values[i];
+
+		igt_debug("Writing '%s' to gt_types_allowed\n", v);
+		igt_assert(igt_sysfs_set(configfs_device_fd, "gt_types_allowed", v));
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(invalid_values); i++) {
+		const char *v = invalid_values[i];
+
+		igt_debug("Writing '%s' to gt_types_allowed\n", v);
+		igt_assert(!igt_sysfs_set(configfs_device_fd, "gt_types_allowed", v));
+	}
+}
+
 /**
  * SUBTEST: ctx-restore-post-bb-invalid
  * Description: Validate ctx_restore_post_bb attribute for invalid values
@@ -343,6 +380,10 @@ igt_main
 	igt_subtest("engines-allowed")
 		test_engines_allowed(configfs_device_fd);
 
+	igt_describe("Validate gt_types_allowed");
+	igt_subtest("gt-types-allowed")
+		test_gt_types_allowed(configfs_device_fd);
+
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid")
 		test_ctx_restore_invalid(configfs_device_fd, "post");
-- 
2.43.0

