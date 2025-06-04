Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1344C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30E10E600;
	Wed,  4 Jun 2025 05:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBtFGeIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279E10E600
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014641; x=1780550641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=880LvkbRT2VgQjV8qXUWcAp0vh5J+VY3lhpJTbpT7zk=;
 b=BBtFGeIBf0XvsLW/C9VvO9EVPD5zn/xj3vGE9i1lFSJxu5qr6hWAGPI7
 r01ulwGb8hAW/mvsmjoXlVUDGQyJT8sFkdvTk7cjpanR49mhwW7u+MHmY
 4WdAP7xlucfTHqB7u5EPS6FpCM0kmobRnIqzKO+kJ6OUjKfoquPC0Wns/
 khLZH19N8libWEFAEAWNwmDV2Rr+WMA7qS8bz0PCNTY8TktSsAOhFaVyx
 eIwNfpHWux/EQ9kmGPxKea7DqhVf2dCHUNxrq3uRuHV/fe/9ACoG8eDOe
 4HPuGHNWuaACxaaMWJzlVs8Wa8nHuOgh4vIwfC/kCXLwQfg2Ei2idVX2x A==;
X-CSE-ConnectionGUID: yEyzKs1kT9eZT0fLm4R1hQ==
X-CSE-MsgGUID: k3Ad4V9hS8yGcnKCJZ6owQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738321"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:24:01 -0700
X-CSE-ConnectionGUID: mDF2s6whSy6gk1Nhhm2thQ==
X-CSE-MsgGUID: 0xRjeIfhSdOVYOKNvVLbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551523"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:59 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 5/5] lib/igt_sysfs: Move igt_exit_handler into test
Date: Wed,  4 Jun 2025 11:00:46 +0530
Message-Id: <20250604053046.1702233-6-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604053046.1702233-1-pranay.samala@intel.com>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
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

In case of nested updated the exit handler will be called multiple
times. Hence calling it before the updates rather than calling after
update.

v3:
- Refactored for readability and address logical comment.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c                         | 8 +-------
 lib/igt_sysfs.h                         | 1 +
 tests/intel/kms_dp_linktrain_fallback.c | 1 +
 tests/kms_atomic_transition.c           | 1 +
 tests/kms_cursor_legacy.c               | 1 +
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 427aed4de..c90881d53 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -493,7 +493,7 @@ void igt_drm_debug_mask_reset(void)
 	close(dir);
 }
 
-static void igt_drm_debug_mask_reset_exit_handler(int sig)
+void igt_drm_debug_mask_reset_exit_handler(int sig)
 {
 	igt_drm_debug_mask_reset();
 }
@@ -531,12 +531,6 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-
-	/*
-	 * TODO: Check whether multiple exit handlers will get installed,
-	 * if we call this api multiple times
-	 */
-	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 }
 
 /**
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 06badaf0e..583be5d98 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -147,6 +147,7 @@ void igt_drm_debug_mask_update(unsigned int new_log_level);
 void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
+void igt_drm_debug_mask_reset_exit_handler(int sig);
 
 enum drm_debug_category {
 	DRM_UT_CORE      = 1 << 0,
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 9cd6f3d54..adbaa0749 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -616,6 +616,7 @@ igt_main
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 
 		/*
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 3202ab668..486d5b2ab 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1197,6 +1197,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 281812a4d..74118c014 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1861,6 +1861,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
-- 
2.34.1

