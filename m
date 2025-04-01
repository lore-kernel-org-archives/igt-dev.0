Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94060C3601A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFAC10E52D;
	Tue,  1 Apr 2025 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxhNXAsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625CE10E52D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499239; x=1775035239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CQb7VvaEZGce7feyRctwqKiGef3TT0oT6iH/urLhXQ=;
 b=nxhNXAsCZ/PE5/hSPORi5+7mrb7V55EmZzjN9uP6+W6n0xcH618UZ6IU
 jLsqg+2xM49kdtsxP7scSHRJq9jJLHy3ocvL06li6pNK4z1naXCgkF9o2
 d6myDZAlv6nLJSM01QmJChwhJNVQptzXfan+1kaXsVQb1R25aoaN0Xt8h
 i47gP5vds8Jzvc7mYBl7MYAjpvb3I/bSsI9ECTd7JhWWHorKbUkI/Q6wb
 BTFTqzT5sPx6Mzr/LWr1pzSCl6I5NT5ILMHiJ0k0xhtJqZM28JRQUemWf
 VOyCIgvYcyLGXeL06cGW2rWCpMky2hExzlkdkFNo4YWiGCO4nLWi863US w==;
X-CSE-ConnectionGUID: O1G0CweCSESZzgrva78iwQ==
X-CSE-MsgGUID: aZH+xoHyQ1OjCqhHFVQu9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211780"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:37 -0700
X-CSE-ConnectionGUID: 8eovqkmITqe1RypkyezZhA==
X-CSE-MsgGUID: UIEwRN9YQNejQbpdFKFlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166504"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:35 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 5/5] lib/igt_sysfs: Move igt_exit_handler into test
Date: Tue,  1 Apr 2025 14:50:15 +0530
Message-Id: <20250401092015.818465-6-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401092015.818465-1-pranay.samala@intel.com>
References: <20250401092015.818465-1-pranay.samala@intel.com>
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

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c                         | 9 +--------
 lib/igt_sysfs.h                         | 1 +
 tests/intel/kms_dp_linktrain_fallback.c | 1 +
 tests/kms_atomic_transition.c           | 1 +
 tests/kms_cursor_legacy.c               | 1 +
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 0df2ab9fc..735b8c29f 100644
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
@@ -532,13 +532,6 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-
-	/*
-	 * TODO: Check whether multiple exit handlers will get installed,
-	 * if we call this api multiple times
-	 */
-	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
-
 }
 
 /**
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 2f4d25bf6..c351e3069 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -143,6 +143,7 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
+void igt_drm_debug_mask_reset_exit_handler(int sig);
 void igt_drm_debug_mask_update(unsigned int new_log_level);
 void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index a6f7b586f..a093f651a 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -643,6 +643,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		if (parse_bitmask)
 			igt_drm_debug_mask_update(parse_bitmask);
 		else
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a92edc2b1..7403e829e 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1194,6 +1194,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		if (parse_bitmask)
 			igt_drm_debug_mask_update(parse_bitmask);
 		else
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 09d511935..2985e4852 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1872,6 +1872,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		if (parse_bitmask)
 			igt_drm_debug_mask_update(parse_bitmask);
 		else
-- 
2.34.1

