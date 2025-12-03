Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A95D116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374DF10E794;
	Wed,  3 Dec 2025 09:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pi3vUvJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADC610E794
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764752502; x=1796288502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2yb/5e6CbwbpwhUsr9z9xnmqaV8QrtP+Sw8l6tvxOyU=;
 b=Pi3vUvJZZiHzF7wzZc9okFrhU8ckWmplXmhZ45XC5deX40aQpu9gB9Qk
 o37/NaG2GlkJvwMeq4IaFWZqD64QVhXtWRPhHWfRGO5XBl3XPca0l71G8
 rFZjDCP9XLR65hzcYc7zecALaJr3ktvN+xIdHaDklh4zAkAKX9KCRPjtJ
 hFjrs22gHTBkDdiplgtQs0RHDD6AsNjflvhiunWuPTnxBDvzk6CDtZE5h
 KcFE1P91toBPYHdqgnq95kwiFJBtjgc7gAxj/tlmwYXMtuc9iPyj/fwTL
 i54p8WsLBM5DK6iO3jbsLhY1fPwvnfmJNrYBk6J3XFxRp2XvKQSRL2llJ A==;
X-CSE-ConnectionGUID: 5agw4+unQBGT2E07OGudfg==
X-CSE-MsgGUID: WysbIw3wSJWPgF7QumFCaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77848162"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77848162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:01:42 -0800
X-CSE-ConnectionGUID: y7Xh0HOeRpOvkUgIk/zjVw==
X-CSE-MsgGUID: /ohQgZRyQgmDvzTvyvmOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195410014"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:01:41 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_frontbuffer_tracking: Enable HDR in
 feature tests
Date: Wed,  3 Dec 2025 14:38:36 +0530
Message-Id: <20251203090836.1164827-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251203090836.1164827-1-swati2.sharma@intel.com>
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
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

Expands the existing feature framework to exercise HDR configurations as part
of the standard test suite.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 135 +++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index eda97f7df..6d48527a5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -38,6 +38,7 @@
 #include <poll.h>
 #include <pthread.h>
 #include <limits.h>
+#include <inttypes.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -46,6 +47,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
+#include "igt_hdr.h"
 
 /**
  * SUBTEST: basic
@@ -948,6 +950,12 @@ struct {
 	.can_test = false,
 };
 
+struct {
+	bool can_test;
+} hdr = {
+	.can_test = false,
+};
+
 igt_pipe_crc_t *pipe_crc;
 igt_crc_t *wanted_crc;
 struct {
@@ -1857,6 +1865,12 @@ static void unset_all_crtcs(void)
 	igt_display_commit(&drm.display);
 }
 
+static void intel_hdr_disable(igt_output_t *output)
+{
+	igt_hdr_set_metadata(output, NULL);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
+}
+
 static bool disable_features(const struct test_mode *t)
 {
 	if (t->feature == FEATURE_DEFAULT)
@@ -1864,6 +1878,7 @@ static bool disable_features(const struct test_mode *t)
 
 	intel_fbc_disable(drm.fd);
 	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
+	intel_hdr_disable(prim_mode_params.output);
 
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
 }
@@ -2124,6 +2139,10 @@ static void teardown_fbc(void)
 {
 }
 
+static void teardown_hdr(void)
+{
+}
+
 static void setup_psr(void)
 {
 	if (prim_mode_params.output->config.connector->connector_type !=
@@ -2158,6 +2177,27 @@ static void setup_drrs(void)
 	drrs.can_test = true;
 }
 
+static void setup_hdr(void)
+{
+	if (!igt_output_supports_max_bpc(prim_mode_params.output) || !igt_output_supports_hdr(prim_mode_params.output)) {
+		igt_info("Can't test HDR: %s doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+			  igt_output_name(prim_mode_params.output));
+		return;
+	}
+
+	if (!igt_is_panel_hdr(drm.fd, prim_mode_params.output)) {
+		igt_info("Can't test HDR: %s not HDR capable.\n", igt_output_name(prim_mode_params.output));
+		return;
+	}
+
+	if (igt_get_output_max_bpc(drm.fd, prim_mode_params.output->name) < 10) {
+		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
+		return;
+	}
+
+	hdr.can_test = true;
+}
+
 static void setup_environment(void)
 {
 	setup_modeset();
@@ -2165,6 +2205,7 @@ static void setup_environment(void)
 	setup_fbc();
 	setup_psr();
 	setup_drrs();
+	setup_hdr();
 
 	setup_crcs();
 }
@@ -2176,6 +2217,7 @@ static void teardown_environment(void)
 	teardown_crcs();
 	teardown_psr();
 	teardown_fbc();
+	teardown_hdr();
 	teardown_modeset();
 	teardown_drm();
 }
@@ -2252,6 +2294,10 @@ static void do_flush(const struct test_mode *t)
 
 #define ASSERT_NO_IDLE_GPU		(1 << 11)
 
+#define HDR_ASSERT_FLAGS               (3 << 12)
+#define ASSERT_HDR_ENABLED             (1 << 12)
+#define ASSERT_HDR_DISABLED            (1 << 13)
+
 static int adjust_assertion_flags(const struct test_mode *t, int flags)
 {
 	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
@@ -2262,6 +2308,8 @@ static int adjust_assertion_flags(const struct test_mode *t, int flags)
 		if (!((flags & ASSERT_DRRS_LOW) ||
 		    (flags & ASSERT_DRRS_INACTIVE)))
 			flags |= ASSERT_DRRS_HIGH;
+		if (!(flags & ASSERT_HDR_DISABLED))
+			flags |= ASSERT_HDR_ENABLED;
 	}
 
 	if ((t->feature & FEATURE_FBC) == 0 || (flags & DONT_ASSERT_FBC_STATUS))
@@ -2270,6 +2318,8 @@ static int adjust_assertion_flags(const struct test_mode *t, int flags)
 		flags &= ~PSR_ASSERT_FLAGS;
 	if ((t->feature & FEATURE_DRRS) == 0)
 		flags &= ~DRRS_ASSERT_FLAGS;
+	if ((t->feature & FEATURE_HDR) == 0)
+		flags &= ~HDR_ASSERT_FLAGS;
 
 	return flags;
 }
@@ -2288,6 +2338,27 @@ static void do_crc_assertions(int flags)
 	igt_assert_crc_equal(&crc, wanted_crc);
 }
 
+static bool intel_hdr_is_enabled(igt_output_t *output)
+{
+	uint64_t blob_id =
+		igt_output_get_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+	uint64_t max_bpc =
+		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+
+	return blob_id != 0 && max_bpc >= 10;
+}
+
+static void hdr_print_status(igt_output_t *output)
+{
+	uint64_t blob_id =
+		igt_output_get_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+	uint64_t max_bpc =
+		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+
+	igt_info("HDR metadata blob id: %" PRIu64 "\n", blob_id);
+	igt_info("MAX_BPC: %" PRIu64 "\n", max_bpc);
+}
+
 static void do_status_assertions(int flags)
 {
 	if (!opt.check_status) {
@@ -2339,6 +2410,18 @@ static void do_status_assertions(int flags)
 	} else if (flags & ASSERT_PSR_DISABLED)
 		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still enabled\n");
+
+	if (flags & ASSERT_HDR_ENABLED) {
+		if (!intel_hdr_is_enabled(prim_mode_params.output)) {
+			hdr_print_status(prim_mode_params.output);
+			igt_assert_f(false, "HDR not enabled\n");
+		}
+	} else if (flags & ASSERT_HDR_DISABLED) {
+		if (intel_hdr_is_enabled(prim_mode_params.output)) {
+			hdr_print_status(prim_mode_params.output);
+			igt_assert_f(false, "HDR still enabled\n");
+		}
+	}
 }
 
 static void __do_assertions(const struct test_mode *t, int flags,
@@ -2356,7 +2439,8 @@ static void __do_assertions(const struct test_mode *t, int flags,
 
 	/* Check the CRC to make sure the drawing operations work
 	 * immediately, independently of the features being enabled. */
-	do_crc_assertions(flags);
+	if (!(t->feature & FEATURE_HDR))
+		do_crc_assertions(flags);
 
 	/* Now we can flush things to make the test faster. */
 	do_flush(t);
@@ -2368,7 +2452,7 @@ static void __do_assertions(const struct test_mode *t, int flags,
 	 * case, the first check should be enough and a new CRC check
 	 * would only delay the test suite while adding no value to the
 	 * test suite. */
-	if (t->screen == SCREEN_PRIM)
+	if (!(t->feature & FEATURE_HDR) && t->screen == SCREEN_PRIM)
 		do_crc_assertions(flags);
 
 	if (fbc.supports_last_action && opt.fbc_check_last_action) {
@@ -2490,6 +2574,16 @@ static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane
 	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
 }
 
+static void intel_hdr_enable(igt_output_t *output)
+{
+	struct hdr_output_metadata meta;
+
+	/* Fill HDR metadata and enable it on the output */
+	igt_hdr_fill_st2048(&meta);
+	igt_hdr_set_metadata(output, &meta);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+}
+
 static bool enable_features_for_test(const struct test_mode *t)
 {
 	bool ret = false;
@@ -2500,9 +2594,13 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_FBC)
 		intel_fbc_enable(drm.fd);
 	if (t->feature & FEATURE_PSR)
-		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
+		ret |= psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
 	if (t->feature & FEATURE_DRRS)
 		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
+	if (t->feature & FEATURE_HDR) {
+		intel_hdr_enable(prim_mode_params.output);
+		ret = true;   /* HDR metadata must force a commit */
+	}
 
 	return ret;
 }
@@ -2526,6 +2624,11 @@ static void check_test_requirements(const struct test_mode *t)
 		igt_require_f(drrs.can_test,
 			      "Can't test DRRS with the current outputs\n");
 
+	if (t->feature & FEATURE_HDR) {
+		igt_require_f(hdr.can_test,
+			      "Can't test HDR with the current outputs\n");
+	}
+
 	/*
 	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
 	 * case needs DRRS + PSR enabled, that will be skipped.
@@ -2602,9 +2705,13 @@ static void prepare_subtest_data(const struct test_mode *t,
 	if (need_modeset)
 		igt_display_commit(&drm.display);
 
-	init_blue_crc(t->format, t->tiling);
-	if (pattern)
-		init_crcs(t->format, t->tiling, pattern);
+	/* HDR alters the output (EOTF, tone-mapping, bpc), so CRCs won’t match
+	 * the SDR reference CRCs. Skip CRC checks for HDR tests. */
+	if (!(t->feature & FEATURE_HDR)) {
+		init_blue_crc(t->format, t->tiling);
+		if (pattern)
+			init_crcs(t->format, t->tiling, pattern);
+	}
 
 	need_modeset = enable_features_for_test(t);
 	if (need_modeset)
@@ -2665,9 +2772,13 @@ static void rte_subtest(const struct test_mode *t)
 
 	prepare_subtest_data(t, NULL);
 
-	unset_all_crtcs();
-	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
-		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+	/* unset_all_crtcs() clears HDR metadata (blob_id becomes 0), causing HDR
+	 * to be unintentionally disabled. Skip it for HDR tests. */
+	if (!(t->feature & FEATURE_HDR)) {
+		unset_all_crtcs();
+		do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
+			      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+	}
 
 	if (t->pipes == PIPE_SINGLE)
 		enable_prim_screen_and_wait(t);
@@ -3550,7 +3661,8 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
 	start_busy_thread(params->primary.fb);
 	usleep(10000);
 
-	unset_all_crtcs();
+	if (!(t->feature & FEATURE_HDR))
+		unset_all_crtcs();
 	params->primary.fb = &fb2;
 	set_mode_for_params(params);
 
@@ -3584,7 +3696,8 @@ static void suspend_subtest(const struct test_mode *t)
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 	do_assertions(ASSERT_DRRS_LOW);
 
-	unset_all_crtcs();
+	if (!(t->feature & FEATURE_HDR))
+		unset_all_crtcs();
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
 		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
-- 
2.25.1

