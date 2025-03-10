Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8533FC282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 17:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3650D10E416;
	Mon, 10 Mar 2025 17:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK73vVYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8E10E416
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741626580; x=1773162580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y2WXgklQetEw8wQfBLioS/+w0xDTOSjshxTtfwypLHg=;
 b=ZK73vVYToqIctigh5r8sx5be5sf/eze53NR5EbFwQEm05XPE4YYq1c3b
 GYm1sMfHkWy8CH+N0T2V92OJ5TGnftsM6xHYLspByxum74kQbAYSD/gbL
 cJg1c1TlNxLymwlAZMbX3lDUCcaTv2EkfE54DMZN5D2Em66niRhYipRYx
 30DSU8t5Rhl0tQIi0zrdztCH3IKbaTPx8O8FQ9GoPA/Ow2FgSlwkrPS33
 yGyzY4EdGkm/CpI64nsQX+O5Pt6kPLVqY/qibKi+ha24ivin2LpoPCtml
 3W5NADDorRJDDVzsisoyjo0F1jSalVbpLTDE+wHJeen7JHBA0I8E6a6gw w==;
X-CSE-ConnectionGUID: x/D1hUUJSPWdRelNRjdM2g==
X-CSE-MsgGUID: PeDPwaX9S6irhVYP6isHHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42849346"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42849346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:09:39 -0700
X-CSE-ConnectionGUID: ++OxS0dVRNeTCixBXf0oaQ==
X-CSE-MsgGUID: oS4cQFmBTaqfedY/MMr6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120573799"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2025 10:09:37 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] tests/kms: Simplify DRM debug severity update
Date: Mon, 10 Mar 2025 22:45:39 +0530
Message-Id: <20250310171539.273699-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310171539.273699-1-pranay.samala@intel.com>
References: <20250310171539.273699-1-pranay.samala@intel.com>
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

This fixes directly sends the bits to be include in the
DRM debug mask using "igt_drm_debug_severity_update(DRM_UT_KMS)".

If any other verbosity is needed then it can also be
included doing bitwise OR in the parametes.

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 12 +++---------
 tests/kms_atomic_transition.c           | 11 +----------
 tests/kms_cursor_legacy.c               | 10 +---------
 3 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 6a872efd2..66687a3d2 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -613,7 +613,6 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		int dir, current_log_level;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -621,18 +620,13 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
 		 */
+
+		igt_drm_debug_severity_update(DRM_UT_KMS);
+
 		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
 			     "Unable to disable ignore long hpd\n");
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 0342af206..6c5bfa188 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1171,8 +1171,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1185,14 +1183,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
+		igt_drm_debug_severity_update(DRM_UT_KMS);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..e317fbf30 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1839,7 +1839,6 @@ igt_main
 	};
 
 	igt_fixture {
-		int dir, current_log_level;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1851,14 +1850,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
+		igt_drm_debug_severity_update(DRM_UT_KMS);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

