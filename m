Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61796FF887E
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 17:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34610E0B6;
	Wed, 29 Apr 2026 17:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAqPy6w7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F61B10E2E5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 17:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777484655; x=1809020655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5F2NamzrPHHTgkTs4M4wvN1RCbwKULfawf/xYcG8JS0=;
 b=KAqPy6w797CeT/dP6d731meu7qPK+q6U3I0fbOB1GGtIbTncQdM2AvYb
 C+343nvXw20UGIueoAxFYxOxKrwLPLp2wDT6umYBbkcSpw+zRvv4uNoVk
 /R1atZ/lYH6gKJ8aZi86BYEWkyYG6W1v55yz7keOM/kXpG+pIf9bppWXF
 4O9Sdnu1xwijzXVfTCBymYr5U17RTwhNSnQRi3c+rc8sJi2r60AfniibH
 ExBu1QBNbNNGGwuvDlYxrg1XZSqcWR+d7VPELlyNyjQ94SyQlU38UY2Dx
 95XojstmbEkrNmgLu4YLIoUDQcxfjb5iCillm5yS1vn+VkCBOZkWwVnEk w==;
X-CSE-ConnectionGUID: VscAaQrHSmqhueUpoecNZA==
X-CSE-MsgGUID: xF1k4KwFS2iEhBrydb2/Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65950877"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="65950877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:44:15 -0700
X-CSE-ConnectionGUID: KiCWDgAeQma+XpcsuIUNHw==
X-CSE-MsgGUID: FWEXT7K0TBi9p7PX9aR/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233309106"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 10:44:14 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v5 4/4] tests/intel/kms_frontbuffer_tracking: Enable HDR in feature
 tests
Date: Wed, 29 Apr 2026 23:22:05 +0530
Message-Id: <20260429175205.2327206-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429175205.2327206-1-swati2.sharma@intel.com>
References: <20260429175205.2327206-1-swati2.sharma@intel.com>
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

Enable HDR mode on the primary output when the test's feature mask
includes FEATURE_HDR. This lets the existing feature-test matrix
(draw methods × buffer modes × pipes) exercise FBC, PSR and DRRS
while an HDR infoframe is active.

The disable path tears down HDR metadata so subsequent tests start
from a clean SDR baseline.

v2: -place igt headers in alphabetical order (Kamil)
v3: -rebase
v4: -guard intel_hdr_disable() with hdr.can_test to avoid asserting
    on connectors lacking MAX_BPC/HDR_OUTPUT_METADATA (e.g. VGA-1 on snb)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 158 +++++++++++++++++++++++--
 1 file changed, 150 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 273f1f584..e7bb3fa18 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -38,6 +38,7 @@
 #include <poll.h>
 #include <pthread.h>
 #include <limits.h>
+#include <inttypes.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -45,6 +46,7 @@
 #include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_hdr.h"
 #include "igt_psr.h"
 
 /**
@@ -1504,6 +1506,12 @@ struct {
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
@@ -2448,6 +2456,11 @@ static void unset_all_crtcs(void)
 	igt_display_commit(&drm.display);
 }
 
+static void intel_hdr_disable(igt_output_t *output)
+{
+	igt_hdr_disable(output);
+}
+
 static bool disable_features(const struct test_mode *t)
 {
 	if (t->feature == FEATURE_DEFAULT)
@@ -2455,6 +2468,8 @@ static bool disable_features(const struct test_mode *t)
 
 	intel_fbc_disable(&drm.display);
 	intel_drrs_disable(prim_mode_params.crtc);
+	if (hdr.can_test)
+		intel_hdr_disable(prim_mode_params.output);
 
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
 }
@@ -2715,6 +2730,17 @@ static void teardown_fbc(void)
 {
 }
 
+static void teardown_hdr(void)
+{
+	if (!hdr.can_test)
+		return;
+
+	/* Disable HDR and restore connector state */
+	intel_hdr_disable(prim_mode_params.output);
+
+	hdr.can_test = false;
+}
+
 static void setup_psr(void)
 {
 	if (prim_mode_params.output->config.connector->connector_type !=
@@ -2749,6 +2775,29 @@ static void setup_drrs(void)
 	drrs.can_test = true;
 }
 
+static void setup_hdr(void)
+{
+	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
+	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
+	    !igt_output_supports_hdr(prim_mode_params.output)) {
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
+	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
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
@@ -2756,6 +2805,7 @@ static void setup_environment(void)
 	setup_fbc();
 	setup_psr();
 	setup_drrs();
+	setup_hdr();
 
 	setup_crcs();
 }
@@ -2767,6 +2817,7 @@ static void teardown_environment(void)
 	teardown_crcs();
 	teardown_psr();
 	teardown_fbc();
+	teardown_hdr();
 	teardown_modeset();
 	teardown_drm();
 }
@@ -2843,6 +2894,10 @@ static void do_flush(const struct test_mode *t)
 
 #define ASSERT_NO_IDLE_GPU		(1 << 11)
 
+#define HDR_ASSERT_FLAGS               (3 << 12)
+#define ASSERT_HDR_ENABLED             (1 << 12)
+#define ASSERT_HDR_DISABLED            (1 << 13)
+
 static int adjust_assertion_flags(const struct test_mode *t, int flags)
 {
 	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
@@ -2853,6 +2908,8 @@ static int adjust_assertion_flags(const struct test_mode *t, int flags)
 		if (!((flags & ASSERT_DRRS_LOW) ||
 		    (flags & ASSERT_DRRS_INACTIVE)))
 			flags |= ASSERT_DRRS_HIGH;
+		if (!(flags & ASSERT_HDR_DISABLED))
+			flags |= ASSERT_HDR_ENABLED;
 	}
 
 	if ((t->feature & FEATURE_FBC) == 0 || (flags & DONT_ASSERT_FBC_STATUS))
@@ -2861,6 +2918,8 @@ static int adjust_assertion_flags(const struct test_mode *t, int flags)
 		flags &= ~PSR_ASSERT_FLAGS;
 	if ((t->feature & FEATURE_DRRS) == 0)
 		flags &= ~DRRS_ASSERT_FLAGS;
+	if ((t->feature & FEATURE_HDR) == 0)
+		flags &= ~HDR_ASSERT_FLAGS;
 
 	return flags;
 }
@@ -2879,6 +2938,27 @@ static void do_crc_assertions(int flags)
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
@@ -2927,6 +3007,18 @@ static void do_status_assertions(int flags)
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
@@ -2944,7 +3036,8 @@ static void __do_assertions(const struct test_mode *t, int flags,
 
 	/* Check the CRC to make sure the drawing operations work
 	 * immediately, independently of the features being enabled. */
-	do_crc_assertions(flags);
+	if (!(t->feature & FEATURE_HDR))
+		do_crc_assertions(flags);
 
 	/* Now we can flush things to make the test faster. */
 	do_flush(t);
@@ -2956,7 +3049,7 @@ static void __do_assertions(const struct test_mode *t, int flags,
 	 * case, the first check should be enough and a new CRC check
 	 * would only delay the test suite while adding no value to the
 	 * test suite. */
-	if (t->screen == SCREEN_PRIM)
+	if (!(t->feature & FEATURE_HDR) && t->screen == SCREEN_PRIM)
 		do_crc_assertions(flags);
 
 	if (fbc.supports_last_action && opt.fbc_check_last_action) {
@@ -3078,6 +3171,11 @@ static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane
 	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
 }
 
+static void intel_hdr_enable(igt_output_t *output)
+{
+	igt_hdr_enable(output);
+}
+
 static bool enable_features_for_test(const struct test_mode *t)
 {
 	bool ret = false;
@@ -3088,9 +3186,13 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_FBC)
 		intel_fbc_enable(&drm.display);
 	if (t->feature & FEATURE_PSR)
-		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
+		ret |= psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
 	if (t->feature & FEATURE_DRRS)
 		intel_drrs_enable(prim_mode_params.crtc);
+	if (t->feature & FEATURE_HDR) {
+		intel_hdr_enable(prim_mode_params.output);
+		ret |= true;   /* HDR metadata must force a commit */
+	}
 
 	return ret;
 }
@@ -3114,6 +3216,11 @@ static void check_test_requirements(const struct test_mode *t)
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
@@ -3190,9 +3297,15 @@ static void prepare_subtest_data(const struct test_mode *t,
 	if (need_modeset)
 		igt_display_commit(&drm.display);
 
-	init_blue_crc(t->format, t->tiling);
-	if (pattern)
-		init_crcs(t->format, t->tiling, pattern);
+	/*
+	 * HDR alters the output (EOTF, tone-mapping, bpc), so CRCs won't match
+	 * the SDR reference CRCs. Skip CRC checks for HDR tests.
+	 */
+	if (!(t->feature & FEATURE_HDR)) {
+		init_blue_crc(t->format, t->tiling);
+		if (pattern)
+			init_crcs(t->format, t->tiling, pattern);
+	}
 
 	need_modeset = enable_features_for_test(t);
 	if (need_modeset)
@@ -3253,9 +3366,23 @@ static void rte_subtest(const struct test_mode *t)
 
 	prepare_subtest_data(t, NULL);
 
+	/*
+	 * unset_all_crtcs() clears HDR metadata (blob_id becomes 0).
+	 * After verifying the disabled state, re-arm HDR props on the
+	 * output so the next modeset picks them up.
+	 */
 	unset_all_crtcs();
 	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
-		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE |
+		      ASSERT_HDR_DISABLED);
+
+	/*
+	 * Re-arm HDR props on the in-memory output object.
+	 * This only stages the state; the actual commit happens
+	 * inside enable_prim_screen_and_wait().
+	 */
+	if (t->feature & FEATURE_HDR)
+		intel_hdr_enable(prim_mode_params.output);
 
 	if (t->pipes == PIPE_SINGLE)
 		enable_prim_screen_and_wait(t);
@@ -4143,6 +4270,13 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
 	usleep(10000);
 
 	unset_all_crtcs();
+	/*
+	 * Re-arm HDR props on the in-memory output object.
+	 * This only stages the state; the actual commit happens
+	 * inside set_mode_for_params().
+	 */
+	if (t->feature & FEATURE_HDR)
+		intel_hdr_enable(prim_mode_params.output);
 	params->primary.fb = &fb2;
 	set_mode_for_params(params);
 
@@ -4179,8 +4313,16 @@ static void suspend_subtest(const struct test_mode *t)
 	unset_all_crtcs();
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
-		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE |
+		      ASSERT_HDR_DISABLED);
 
+	/*
+	 * Re-arm HDR props on the in-memory output object.
+	 * This only stages the state; the actual commit happens
+	 * inside set_mode_for_params().
+	 */
+	if (t->feature & FEATURE_HDR)
+		intel_hdr_enable(prim_mode_params.output);
 	set_mode_for_params(params);
 	do_assertions(0);
 }
-- 
2.25.1

