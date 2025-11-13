Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190EDCD6E71
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 14:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28C710E829;
	Thu, 13 Nov 2025 14:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jddK1a4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160010E829
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763043787; x=1794579787;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQle9uBPQiY3RZIhlbsSEl7tj1n7j5GQfG1ztA/zZdc=;
 b=jddK1a4zv4L/FbAiW0cmDGl/ngO/wdWUmldlCnr0xfzpe51Hz18iwA0Q
 3UDDzkKPZvfCjnpCLHc2DJgqvYOL1+U9FRul8d8hd/8/wSooH7kLl37ZK
 vrUw7wgmyN9gc+UaR9nY9S0irmDrDOmxzAIXfgbIeulMtyqRvQ/Lynx5h
 mGL2L8Lv7WIEbad29gmZQ/5Jzu7NmWndCutyPaFzDl+CuaMwJkP0LCiwr
 LF/Y6+pifhEs6Zk6f+iO792weOV/ZzMVWWUcyiagBhu6xDCbUhO4xqJNh
 Qq+T5VdqLDhMqf3mmyJlwPdmmIuOQhPazcwU7SGX2dTbPN0tuWjixgI5r w==;
X-CSE-ConnectionGUID: 9wl6JnykRly1C4QsS2wAcw==
X-CSE-MsgGUID: 1YvWty7bSn+k08KN+KqG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65219137"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65219137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:23:07 -0800
X-CSE-ConnectionGUID: IoUD/rcaQX2A9wfRd7FuVg==
X-CSE-MsgGUID: +TFgj5wlSpKy9B+fnOrrpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193953792"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 06:23:06 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed
Date: Thu, 13 Nov 2025 19:53:04 +0530
Message-ID: <20251113142304.404065-1-priyanka.dandamudi@intel.com>
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

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>`
---
 tests/intel/xe_configfs.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 911e18965..85e5c6d51 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -149,6 +149,42 @@ static void test_engines_allowed(int configfs_device_fd)
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
+	igt_kmod_unbind("xe", bus_addr);
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
@@ -343,6 +379,10 @@ igt_main
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

