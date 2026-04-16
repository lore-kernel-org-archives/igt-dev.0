Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD2F8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E35C10E84B;
	Thu, 16 Apr 2026 09:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N++FXu/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EEA10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331601; x=1807867601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQA1ETxPY6k6+F3RgIS+PjLLu2I4veRR9oiHLL6sBgc=;
 b=N++FXu/xqMPhV8IEzGCOLaQhBHUOykd380qg8kzp4vNTixI0j50KgIFU
 FKvdoBVP/OmPH4JEgPm+3qozYshxutxV7vpxBQk9/TPNL+UlQacW3dx1v
 7ijskvP5+goRQVurN3f7p44z7pmbmXcEQ6Nm7Ql56GwyrLo+FiLAjmxU5
 6UJBTPNk69mxvOkoCq7Nzq36NVuBDHlsG3g9OqYyvi1MBIgSQKPNN1Qz+
 gP79OZYB8zXgx1qNDUAUHHzBD+lfO4kc2myKUDzCMVcP8YZhhLcSyTaeu
 LX6y53qNyT8bK+m1wDqIQICODs4+XjYoDg8yj8f6DAeCpSUZBPch0TtXG A==;
X-CSE-ConnectionGUID: l7aXBHNfTvGHiGw+KvFSTg==
X-CSE-MsgGUID: 6Y2HTTd7RYuqY0oKIhw0kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775927"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:39 -0700
X-CSE-ConnectionGUID: 05+aSaX4TdmYlHTqYkvtWA==
X-CSE-MsgGUID: SCdEudO5QMaZBW1Ko5jX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235063032"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:37 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 08/11] tests/intel/kms_fbcon_fbt: refactor the code
 to get the right fbc status
Date: Thu, 16 Apr 2026 12:25:56 +0300
Message-ID: <20260416092559.88735-9-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As FBC can be enabled in multiple pipes, to check the fbc status of a pipe,
we need to read the FBC status from the corresponding crtc debugfs entry.
As a step towards that, update all the feature virtual function definitions
so that we can access all the relevant parameters needed for reading the
crtc debugfs entry.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 102 ++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 78c6cc4b2..5863c9e68 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -80,12 +80,12 @@ static void wait_user(const char *msg)
 	igt_debug_wait_for_keypress("fbt");
 }
 
-static bool fbc_supported_on_chipset(int device, int debugfs_fd)
+static bool fbc_supported_on_chipset(struct drm_info *drm)
 {
 	char buf[FBC_STATUS_BUF_LEN];
 	int ret;
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status",
+	ret = igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status",
 				      buf, sizeof(buf));
 	if (ret < 0)
 		return false;
@@ -99,20 +99,20 @@ static bool connector_can_fbc(drmModeConnectorPtr connector)
 	return true;
 }
 
-static void fbc_print_status(int debugfs_fd)
+static void fbc_print_status(struct drm_info *drm)
 {
 	static char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
+	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
 				sizeof(buf));
 	igt_debug("FBC status: %s\n", buf);
 }
 
-static bool fbc_check_status(int debugfs_fd, bool enabled)
+static bool fbc_check_status(struct drm_info *drm, bool enabled)
 {
 	char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
+	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
 				sizeof(buf));
 	if (enabled)
 		return strstr(buf, "FBC enabled\n");
@@ -120,25 +120,27 @@ static bool fbc_check_status(int debugfs_fd, bool enabled)
 		return strstr(buf, "FBC disabled");
 }
 
-static bool fbc_wait_until_enabled(int debugfs_fd)
+static bool fbc_wait_until_enabled(struct drm_info *drm)
 {
-	bool r = igt_wait(fbc_check_status(debugfs_fd, true), 5000, 1);
-	fbc_print_status(debugfs_fd);
+	bool r = igt_wait(fbc_check_status(drm, true), 5000, 1);
+
+	fbc_print_status(drm);
 	return r;
 }
 
-static bool fbc_is_disabled(int debugfs_fd)
+static bool fbc_is_disabled(struct drm_info *drm)
 {
-	bool r = fbc_check_status(debugfs_fd, false);
+	bool r = fbc_check_status(drm, false);
 
-	fbc_print_status(debugfs_fd);
+	fbc_print_status(drm);
 	return r;
 }
 
-static bool fbc_wait_until_disabled(int debugfs_fd)
+static bool fbc_wait_until_disabled(struct drm_info *drm)
 {
-	bool r = igt_wait(fbc_check_status(debugfs_fd, false), 5000, 1);
-	fbc_print_status(debugfs_fd);
+	bool r = igt_wait(fbc_check_status(drm, false), 5000, 1);
+
+	fbc_print_status(drm);
 	return r;
 }
 
@@ -181,7 +183,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	 * relies on a tiled and fenceable framebuffer to track modifications.
 	 */
 	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
-		if (!fbc_wait_until_enabled(drm->debugfs_fd))
+		if (!fbc_wait_until_enabled(drm))
 			return false;
 		/*
 		 * Skip cursor blinking check when running in simulation mode.
@@ -193,7 +195,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 
 		return fbc_check_cursor_blinking(drm);
 	} else {
-		return fbc_wait_until_disabled(drm->debugfs_fd);
+		return fbc_wait_until_disabled(drm);
 	}
 }
 
@@ -242,34 +244,34 @@ static bool connector_can_psr(drmModeConnectorPtr connector)
 	return (connector->connector_type == DRM_MODE_CONNECTOR_eDP);
 }
 
-static void psr_print_status(int debugfs_fd)
+static void psr_print_status(struct drm_info *drm)
 {
 	static char buf[PSR_STATUS_MAX_LEN];
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	igt_debugfs_simple_read(drm->debugfs_fd, "i915_edp_psr_status", buf,
 				sizeof(buf));
 	igt_debug("PSR status: %s\n", buf);
 }
 
-static bool psr_wait_until_enabled(int debugfs_fd)
+static bool psr_wait_until_enabled(struct drm_info *drm)
 {
-	bool r = psr_wait_entry(debugfs_fd, PSR_MODE_1, NULL);
+	bool r = psr_wait_entry(drm->debugfs_fd, PSR_MODE_1, NULL);
 
-	psr_print_status(debugfs_fd);
+	psr_print_status(drm);
 	return r;
 }
 
-static bool psr_is_disabled(int debugfs_fd)
+static bool psr_is_disabled(struct drm_info *drm)
 {
-	bool r = psr_disabled_check(debugfs_fd);
+	bool r = psr_disabled_check(drm->debugfs_fd);
 
-	psr_print_status(debugfs_fd);
+	psr_print_status(drm);
 	return r;
 }
 
-static bool psr_supported_on_chipset(int device, int debugfs_fd)
+static bool psr_supported_on_chipset(struct drm_info *drm)
 {
-	return psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL);
+	return psr_sink_support(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL);
 }
 
 static bool psr_wait_until_update(struct drm_info *drm)
@@ -277,24 +279,24 @@ static bool psr_wait_until_update(struct drm_info *drm)
 	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1, NULL);
 }
 
-static void disable_features(int device, int debugfs_fd)
+static void disable_features(struct drm_info *drm)
 {
-	igt_set_module_param_int(device, "enable_fbc", 0);
-	if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
-		psr_disable(device, debugfs_fd, NULL);
+	igt_set_module_param_int(drm->fd, "enable_fbc", 0);
+	if (psr_sink_support(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL))
+		psr_disable(drm->fd, drm->debugfs_fd, NULL);
 }
 
-static inline void fbc_modparam_enable(int device, int debugfs_fd)
+static inline void fbc_modparam_enable(struct drm_info *drm)
 {
-	igt_set_module_param_int(device, "enable_fbc", 1);
+	igt_set_module_param_int(drm->fd, "enable_fbc", 1);
 }
 
-static inline void psr_debugfs_enable(int device, int debugfs_fd)
+static inline void psr_debugfs_enable(struct drm_info *drm)
 {
-	psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
+	psr_enable(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL);
 }
 
-static void fbc_skips_on_fbcon(int debugfs_fd)
+static void fbc_skips_on_fbcon(struct drm_info *drm)
 {
 	const char *reasons[] = {
 		"pixel format not supported",
@@ -312,7 +314,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
 	char buf[FBC_STATUS_BUF_LEN];
 	int i;
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
+	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
 	if (strstr(buf, "FBC enabled\n"))
 		return;
 
@@ -322,7 +324,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
 	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
 }
 
-static void psr_skips_on_fbcon(int debugfs_fd)
+static void psr_skips_on_fbcon(struct drm_info *drm)
 {
 	/*
 	 * Unless fbcon enables interlaced mode all other PSR restrictions
@@ -334,14 +336,14 @@ static void psr_skips_on_fbcon(int debugfs_fd)
 }
 
 struct feature {
-	bool (*supported_on_chipset)(int device, int debugfs_fd);
-	bool (*wait_until_enabled)(int debugfs_fd);
-	bool (*is_disabled)(int debugfs_fd);
+	bool (*supported_on_chipset)(struct drm_info *drm);
+	bool (*wait_until_enabled)(struct drm_info *drm);
+	bool (*is_disabled)(struct drm_info *drm);
 	bool (*wait_until_update)(struct drm_info *drm);
 	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
-	void (*enable)(int device, int debugfs_fd);
+	void (*enable)(struct drm_info *drm);
 	/* skip test if feature can't be enabled due fbcon modeset */
-	void (*skips_on_fbcon)(int debugfs_fd);
+	void (*skips_on_fbcon)(struct drm_info *drm);
 } fbc = {
 	.supported_on_chipset = fbc_supported_on_chipset,
 	.wait_until_enabled = fbc_wait_until_enabled,
@@ -372,24 +374,24 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 {
 	kmstest_set_vt_graphics_mode();
 
-	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
+	igt_require(feature->supported_on_chipset(drm));
 
-	disable_features(drm->fd, drm->debugfs_fd);
-	feature->enable(drm->fd, drm->debugfs_fd);
+	disable_features(drm);
+	feature->enable(drm);
 
 	kmstest_unset_all_crtcs(drm->fd, drm->res);
 	wait_user("Modes unset.");
-	igt_assert(feature->is_disabled(drm->debugfs_fd));
+	igt_assert(feature->is_disabled(drm));
 
 	set_mode_for_one_screen(drm, feature->connector_possible_fn);
 	wait_user("Screen set.");
-	igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
+	igt_assert(feature->wait_until_enabled(drm));
 
 	if (suspend) {
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
 		sleep(5);
-		igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
+		igt_assert(feature->wait_until_enabled(drm));
 	}
 
 	restore_fbcon(drm);
@@ -398,7 +400,7 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 	sleep(3);
 
 	wait_user("Back to fbcon.");
-	feature->skips_on_fbcon(drm->debugfs_fd);
+	feature->skips_on_fbcon(drm);
 	igt_assert(feature->wait_until_update(drm));
 
 	if (suspend) {
-- 
2.43.0

