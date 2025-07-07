Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378D8C83F03
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001410E305;
	Mon,  7 Jul 2025 03:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5bhj6v4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309010E305
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858734; x=1783394734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNJRK1KFU2h7G5T1v5ptuQ2KZHuJVXoJFxY7Zin41BQ=;
 b=Z5bhj6v4BDN6b9uSY/x8P74ZhJ7ImGFjdOsMHZwfWIWOUqS5hGxNelm6
 jPoiPAy4UopPwQeEDF9bSP7psI3kwkcULnInkWanv1HgGZ+cwWWZlc9mS
 uinQUZOZ8rRz7TsUA6M8LZh5uYK1yBRp+53jj5TDzsIRWxTYao7xLaUeo
 Fq7VgGaVk4FWY77N/pjvuZNB82EXs63FO0yeJ+i16gIcBIVM3J7Kg8SRh
 Z8eJafRgIBaCr7L08wgryDP1OE332HfgcyQAaUH8Ai0wdncUptvr/+gQK
 3NepTcciZ0Iycxu+gOSghk10NI2CMODCs7g0adSxpcXDZWNDcH63dujh9 A==;
X-CSE-ConnectionGUID: O9sUZrhFSAiWpBa++zXYaA==
X-CSE-MsgGUID: fpgSPmInTsmP4boZEG0Ybw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134990"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:33 -0700
X-CSE-ConnectionGUID: pVqinxZ2TuOCzNFKoy2sMQ==
X-CSE-MsgGUID: +hNHz9WgRYq0/eSGIlC2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288782"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:31 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 5/5] lib/igt_sysfs: Move igt_exit_handler into test
Date: Mon,  7 Jul 2025 09:02:46 +0530
Message-Id: <20250707033246.751156-6-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707033246.751156-1-pranay.samala@intel.com>
References: <20250707033246.751156-1-pranay.samala@intel.com>
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
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_sysfs.c                         | 8 +-------
 lib/igt_sysfs.h                         | 1 +
 tests/intel/kms_dp_linktrain_fallback.c | 1 +
 tests/kms_atomic_transition.c           | 1 +
 tests/kms_cursor_legacy.c               | 1 +
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 3331d46d0..aec157b5b 100644
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
@@ -530,12 +530,6 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-
-	/*
-	 * TODO: Check whether multiple exit handlers will get installed,
-	 * if we call this api multiple times
-	 */
-	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 }
 
 void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index b86ceb63d..9cbd216e6 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -148,6 +148,7 @@ void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
 void update_debug_mask_if_ci(unsigned int debug_mask_if_ci);
+void igt_drm_debug_mask_reset_exit_handler(int sig);
 
 enum drm_debug_category {
 	DRM_UT_CORE      = 1 << 0,
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index e67c29f86..fa58999e8 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -605,6 +605,7 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 
 		/*
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 0829133a1..8c6094987 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1187,6 +1187,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5973dcaed..9f6e644e1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1851,6 +1851,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
-- 
2.34.1

