Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA86C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 14:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4B10E83B;
	Thu,  8 Feb 2024 14:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPki0JlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310310E6AA
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707403497; x=1738939497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6CkzvZVz69tZslerIAoz6k06S1zw98umuXsCi5Ye6sw=;
 b=RPki0JlUCP1YUcPZM6Dtkmp3tLtdfUMAlR+lF2UjOOaTI89lT5W/dzle
 Y6rRE+opSaroaoL/5oEZmvRpg0h+vON/hJbUgNS1f3MaxVkbQHFzLU9JV
 khz6zWCYk9+zGsZ7KDFo45YNEd36ZUsTC+Sw4FlWMni9QejMrGcyQ/yee
 CzO6bYXB4PM4TDEcB1M+ZKCdbbvVpLxhP0HCAvV/3GSjrV6mqhcgbqboI
 1MHuekC9+PEOTJWr1tIco2qzyFSoGpz2UNzItLrdjNAJ9YJ2hfNiUO4y3
 yG/FCBG0nblHSKrl9oST/w12ZOP9jUPyAN//VRMdOUKq3nXLf1wuUKjiC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436365213"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436365213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32736936"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:56 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: add support for PR selective update
Date: Thu,  8 Feb 2024 20:24:24 +0530
Message-Id: <20240208145425.1940941-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208145425.1940941-1-kunal1.joshi@intel.com>
References: <20240208145425.1940941-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

adapt to kmd changes to support PR selective update
https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

v2: "PSR2 selective fetch: enable" valid for both cases (Jouni)
v3: Organize patches according to title (Jouni)
    Use macro instead of function (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c                          | 98 ++++++++++++++++----------
 lib/igt_psr.h                          | 14 ++--
 tests/intel/kms_dirtyfb.c              |  4 +-
 tests/intel/kms_fbcon_fbt.c            |  4 +-
 tests/intel/kms_frontbuffer_tracking.c |  4 +-
 tests/intel/kms_pm_dc.c                |  6 +-
 tests/intel/kms_psr.c                  |  4 +-
 tests/intel/kms_psr2_sf.c              |  8 ---
 tests/intel/kms_psr2_su.c              |  2 +-
 tests/intel/kms_psr_stress_test.c      |  4 +-
 tests/kms_async_flips.c                |  4 +-
 tests/kms_cursor_legacy.c              |  4 +-
 12 files changed, 84 insertions(+), 72 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index ac214fcfc..9accd2047 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -27,6 +27,10 @@
 #include "igt_sysfs.h"
 #include <errno.h>
 
+#define SET_DEBUGFS_PATH(output, path) \
+	sprintf(path, "%s%s%s", output ? output->name : "", output ? "/" : "", \
+			output ? "i915_psr_status" : "i915_edp_psr_status")
+
 bool psr_disabled_check(int debugfs_fd)
 {
 	char buf[PSR_STATUS_MAX_LEN];
@@ -37,11 +41,13 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
-bool psr2_selective_fetch_check(int debugfs_fd)
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
+	char debugfs_file[128] = {0};
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	SET_DEBUGFS_PATH(output, debugfs_file);
+	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				sizeof(buf));
 
 	return strstr(buf, "PSR2 selective fetch: enabled");
@@ -54,11 +60,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ? "SRDENT" : "DEEP_SLEEP";
 	int ret;
 
-	if (output)
-		sprintf(debugfs_file, "%s/i915_psr_status", output->name);
-	else
-		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
-
+	SET_DEBUGFS_PATH(output, debugfs_file);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
 				     buf, sizeof(buf));
 	if (ret < 0) {
@@ -90,13 +92,18 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 10);
 }
 
-static ssize_t psr_write(int debugfs_fd, const char *buf)
+static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
 {
+	/*
+	 * FIXME: Currently we don't have separate psr_debug file for each output.
+	 * so, we are using i915_edp_psr_debug file for all outputs.
+	 * Later we need to add support for separate psr_debug file for each output.
+	 */
 	return igt_sysfs_write(debugfs_fd, "i915_edp_psr_debug", buf,
-			       strlen(buf));
+						   strlen(buf));
 }
 
-static int has_psr_debugfs(int debugfs_fd)
+static int has_psr_debugfs(int debugfs_fd, igt_output_t *output)
 {
 	int ret;
 
@@ -105,7 +112,7 @@ static int has_psr_debugfs(int debugfs_fd)
 	 * Legacy mode will return OK here, debugfs api will return -EINVAL.
 	 * -ENODEV is returned when PSR is unavailable.
 	 */
-	ret = psr_write(debugfs_fd, "0xf");
+	ret = psr_write(debugfs_fd, "0xf", output);
 	if (ret == -EINVAL) {
 		errno = 0;
 		return 0;
@@ -113,7 +120,7 @@ static int has_psr_debugfs(int debugfs_fd)
 		return ret;
 
 	/* legacy debugfs api, we enabled irqs by writing, disable them. */
-	psr_write(debugfs_fd, "0");
+	psr_write(debugfs_fd, "0", output);
 	return -EINVAL;
 }
 
@@ -134,14 +141,14 @@ static int psr_restore_debugfs_fd = -1;
 
 static void restore_psr_debugfs(int sig)
 {
-	psr_write(psr_restore_debugfs_fd, "0");
+	psr_write(psr_restore_debugfs_fd, "0", NULL);
 }
 
-static bool psr_set(int device, int debugfs_fd, int mode)
+static bool psr_set(int device, int debugfs_fd, int mode, igt_output_t *output)
 {
 	int ret;
 
-	ret = has_psr_debugfs(debugfs_fd);
+	ret = has_psr_debugfs(debugfs_fd, output);
 	if (ret == -ENODEV) {
 		igt_skip("PSR not available\n");
 		return false;
@@ -179,7 +186,7 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 			debug_val = "0x1";
 		}
 
-		ret = psr_write(debugfs_fd, debug_val);
+		ret = psr_write(debugfs_fd, debug_val, output);
 		igt_require_f(ret > 0, "PSR2 SF feature not available\n");
 	}
 
@@ -193,15 +200,15 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 	return ret;
 }
 
-bool psr_enable(int device, int debugfs_fd, enum psr_mode mode)
+bool psr_enable(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return psr_set(device, debugfs_fd, mode);
+	return psr_set(device, debugfs_fd, mode, output);
 }
 
-bool psr_disable(int device, int debugfs_fd)
+bool psr_disable(int device, int debugfs_fd, igt_output_t *output)
 {
 	/* Any mode different than PSR_MODE_1/2 will disable PSR */
-	return psr_set(device, debugfs_fd, -1);
+	return psr_set(device, debugfs_fd, -1, output);
 }
 
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output)
@@ -211,11 +218,7 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 	char buf[PSR_STATUS_MAX_LEN];
 	int ret;
 
-	if (output)
-		sprintf(debugfs_file, "%s/i915_psr_status", output->name);
-	else
-		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
-
+	SET_DEBUGFS_PATH(output, debugfs_file);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));
 	if (ret < 1)
@@ -245,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes");
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
@@ -305,7 +310,7 @@ void psr_print_debugfs(int debugfs_fd)
 	igt_info("%s", buf);
 }
 
-bool i915_psr2_selective_fetch_check(int drm_fd)
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret;
@@ -314,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	ret = psr2_selective_fetch_check(debugfs_fd);
+	ret = selective_fetch_check(debugfs_fd, output);
 	close(debugfs_fd);
 
 	return ret;
@@ -331,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
  * Returns:
  * True if PSR mode changed to PSR1, false otherwise.
  */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret = false;
+	enum psr_mode mode;
 
 	if (!is_intel_device(drm_fd))
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (psr2_selective_fetch_check(debugfs_fd)) {
-		psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
+	if (selective_fetch_check(debugfs_fd, output)) {
+		mode = psr_get_mode(debugfs_fd, output);
+		if (mode == PR_MODE_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PR_MODE, output);
+		else if (mode == PSR_MODE_2_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
+		else
+			igt_assert("switch not possible from current psr mode\n");
 		ret = true;
 	}
 
@@ -355,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
  * Restore PSR2 selective fetch after tests were executed, this function should
  * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
  */
-void i915_psr2_sel_fetch_restore(int drm_fd)
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
+	enum psr_mode mode;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
+	mode = psr_get_mode(debugfs_fd, output);
+	if (mode == PR_MODE)
+		psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH, output);
+	else
+		psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
 	close(debugfs_fd);
 }
 
@@ -369,27 +386,30 @@ void i915_psr2_sel_fetch_restore(int drm_fd)
  *
  * Return the current PSR mode.
  */
-enum psr_mode psr_get_mode(int debugfs_fd)
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
+	char debugfs_file[128] = {0};
 	int ret;
 
-
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	SET_DEBUGFS_PATH(output, debugfs_file);
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));
 	if (ret < 0) {
-		igt_info("Could not read i915_edp_psr_status: %s\n",
+		igt_info("Could not read psr status: %s\n",
 			 strerror(-ret));
 		return PSR_DISABLED;
 	}
 
 	if (strstr(buf, "Panel Replay Enabled"))
 		return PR_MODE;
+	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-	else if (strstr(buf, "PSR2 enabled"))
+	else if (strstr(buf, "PSR2"))
 		return PSR_MODE_2;
-	else if (strstr(buf, "PSR1 enabled"))
+	else if (strstr(buf, "PSR1"))
 		return PSR_MODE_1;
 
 	return PSR_DISABLED;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 82a4e8c5e..36ba7f068 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,21 +46,21 @@ enum fbc_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd);
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
-bool psr_enable(int device, int debugfs_fd, enum psr_mode);
-bool psr_disable(int device, int debugfs_fd);
+bool psr_enable(int device, int debugfs_fd, enum psr_mode, igt_output_t *output);
+bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
-enum psr_mode psr_get_mode(int debugfs_fd);
+enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
 
-bool i915_psr2_selective_fetch_check(int drm_fd);
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output);
 
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
-void i915_psr2_sel_fetch_restore(int drm_fd);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output);
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
 bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
 
 #endif
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 7bf49cb15..22ca83305 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -127,7 +127,7 @@ static void enable_feature(data_t *data)
 		intel_fbc_enable(data->drm_fd);
 		break;
 	case FEATURE_PSR:
-		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1);
+		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
 		break;
 	case FEATURE_DRRS:
 		intel_drrs_enable(data->drm_fd, data->pipe);
@@ -167,7 +167,7 @@ static void check_feature(data_t *data)
 static void disable_features(data_t *data)
 {
 	intel_fbc_disable(data->drm_fd);
-	psr_disable(data->drm_fd, data->debugfs_fd);
+	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 	intel_drrs_disable(data->drm_fd, data->pipe);
 }
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 90484dccf..71e42f19c 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -277,7 +277,7 @@ static void disable_features(int device, int debugfs_fd)
 {
 	igt_set_module_param_int(device, "enable_fbc", 0);
 	if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
-		psr_disable(device, debugfs_fd);
+		psr_disable(device, debugfs_fd, NULL);
 }
 
 static inline void fbc_modparam_enable(int device, int debugfs_fd)
@@ -287,7 +287,7 @@ static inline void fbc_modparam_enable(int device, int debugfs_fd)
 
 static inline void psr_debugfs_enable(int device, int debugfs_fd)
 {
-	psr_enable(device, debugfs_fd, PSR_MODE_1);
+	psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
 }
 
 static void fbc_skips_on_fbcon(int debugfs_fd)
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 912cca3f8..023843161 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2234,7 +2234,7 @@ static bool disable_features(const struct test_mode *t)
 	intel_fbc_disable(drm.fd);
 	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
 
-	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
+	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
 }
 
 static void *busy_thread_func(void *data)
@@ -2867,7 +2867,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_FBC)
 		intel_fbc_enable(drm.fd);
 	if (t->feature & FEATURE_PSR)
-		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
+		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
 	if (t->feature & FEATURE_DRRS)
 		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 0d5824e67..7deebf83d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -362,7 +362,7 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
 static void setup_dc3co(data_t *data)
 {
 	data->op_psr_mode = PSR_MODE_2;
-	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode);
+	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
 	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
 		      "PSR2 is not enabled\n");
 }
@@ -665,7 +665,7 @@ igt_main
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
-		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		test_dc_state_psr(&data, CHECK_DC5);
 	}
 
@@ -675,7 +675,7 @@ igt_main
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
-		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		if (intel_display_ver(data.devid) >= 14)
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 521d4c708..3822b3081 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -519,7 +519,7 @@ static bool psr_enable_if_enabled(data_t *data)
 		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
 			 data->op_psr_mode);
 
-	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode);
+	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static inline void manual(const char *expected)
@@ -658,6 +658,7 @@ static void test_cleanup(data_t *data)
 
 	igt_remove_fb(data->drm_fd, &data->fb_green);
 	igt_remove_fb(data->drm_fd, &data->fb_white);
+	psr_disable(data->drm_fd, data->debugfs_fd, data->output);
 }
 
 static void setup_test_plane(data_t *data, int test_plane)
@@ -976,7 +977,6 @@ igt_main
 	}
 
 	igt_fixture {
-		psr_disable(data.drm_fd, data.debugfs_fd);
 
 		close(data.debugfs_fd);
 		buf_ops_destroy(data.bops);
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index ecf9ad77f..8e6a9e02c 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1012,11 +1012,6 @@ igt_main
 			data.fbc_flag = true;
 		}
 
-		/* Test if PSR2 can be enabled */
-		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
-			      "Error enabling PSR2\n");
-
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
 
@@ -1026,9 +1021,6 @@ igt_main
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
 
-		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
-			      "PSR2 selective fetch not enabled\n");
-
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
 			coexist_features[n_pipes] = 0;
 			if (check_psr2_support(&data)) {
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 936b5beb3..437ee36f6 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -338,7 +338,7 @@ igt_main
 
 		/* Test if PSR2 can be enabled */
 		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2),
+					 data.debugfs_fd, PSR_MODE_2, NULL),
 			      "Error enabling PSR2\n");
 		data.op = FRONTBUFFER;
 		data.format = DRM_FORMAT_XRGB8888;
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 7aea8e8a5..bca3bd513 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -230,7 +230,7 @@ static void prepare(data_t *data)
 	r = timerfd_settime(data->completed_timerfd, 0, &interval, NULL);
 	igt_require_f(r != -1, "Error setting completed_timerfd\n");
 
-	data->initial_state = psr_get_mode(data->debugfs_fd);
+	data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
 	igt_require(data->initial_state != PSR_DISABLED);
 	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, NULL));
 }
@@ -343,7 +343,7 @@ static void run(data_t *data)
 	}
 
 	/* Check if after all this stress the PSR is still in the same state */
-	igt_assert(psr_get_mode(data->debugfs_fd) == data->initial_state);
+	igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data->initial_state);
 }
 
 igt_main
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..2895168f7 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
 	 * necessary, causing the async flip to fail because async flip is not
 	 * supported in cursor plane.
 	 */
-	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
+	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
 		      "PSR2 sel fetch causes cursor to be added to primary plane " \
 		      "pages flips and async flip is not supported in cursor\n");
 
@@ -704,7 +704,7 @@ igt_main
 		 * necessary, causing the async flip to fail because async flip is not
 		 * supported in cursor plane.
 		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd),
+		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
 			      "PSR2 sel fetch causes cursor to be added to primary plane " \
 			      "pages flips and async flip is not supported in cursor\n");
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 0017659d4..91e5e9b07 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
 		 * page flip with cursor legacy APIS when Intel's PSR2 selective
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
-		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd);
+		intel_psr2_restore = i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
@@ -2074,7 +2074,7 @@ igt_main
 
 	igt_fixture {
 		if (intel_psr2_restore)
-			i915_psr2_sel_fetch_restore(display.drm_fd);
+			i915_pr_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.25.1

