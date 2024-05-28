Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DF0C25B7C
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 10:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D461120BB;
	Tue, 28 May 2024 10:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naBWc8C8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781D71120BB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890549; x=1748426549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m1INLDyT3yR1KvZveuhoA1UD1U/lvEGSj+FVhJ7QrFU=;
 b=naBWc8C8JB0Oq/bL/qD/H0bycF6P7C2A4DRQTLV1mkVMlYNi3R0mfnaM
 jzPqL4oNcNgdOmTH9tNbWMkL4/gDcb/PZhlm213v+Ot+zlEnd7Tna0iCb
 TalggdEENHdIKBlVwwAWiDs7edNkzMNT7STBQjetGwY46JOJONLALkV8B
 7oWpmz/J0UYv5npoTUYqulV9r9X0i5xfv5lWSEWtQ2dBhuOhJHI32a2GZ
 RVbOvQtSkPmbMKS21cGh2zSJm3W4icn9/GNgAF5PIOArtWAqH1o6nc3aa
 f+Xlkyjqsvt1ro3GuX40P/rJ7+4of0m8pPrfKzj7YEeZxYbh7fth/+tKR g==;
X-CSE-ConnectionGUID: EFBDysRsTwC9xRz5e+dV8Q==
X-CSE-MsgGUID: /lJux7VsQFG2OfcndthqkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13354724"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13354724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:02:28 -0700
X-CSE-ConnectionGUID: atw+1ID/QUaIRJL/esyNcQ==
X-CSE-MsgGUID: il7eYYHbTHSzpCf3izcU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39423401"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:02:26 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, suraj.kandpal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate the
 deep sleep state during extended vblank
Date: Tue, 28 May 2024 15:39:44 +0530
Message-Id: <20240528100944.561032-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a new test to validate deep sleep states during extended vblank
scenarios, where two frames are committed simultaneously for a given
time with reduced refresh rate.
v2: dealy of one frame added to simulate extended vblank.
    remove vrr related debug checks.
v3: fix typo and add define. (Suraj)
v4: fix structure and add skip if no vrr monitor found. (Bhanu)
v5: remove redundant code and correct delay logic. (Bhanu)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 7766d34d7..7ce1b7051 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -76,6 +76,10 @@
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
+ *
+ * SUBTEST: deep-pkgc
+ * Description: This test validates display engine entry to PKGC10 state for extended vblank
+ * Functionality: pm_dc
  */
 
 /* DC State Flags */
@@ -89,6 +93,7 @@
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
+#define MSECS (1000000ul)
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -584,6 +589,64 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 	return get_dc_counter(str);
 }
 
+static void test_deep_pkgc_state(data_t *data)
+{
+	unsigned int pre_val = 0, cur_val = 0;
+	time_t start = time(NULL), duration = 2, delay;
+	enum pipe pipe;
+	bool pkgc_flag = false;
+	bool vrr_supported = false, flip = true;
+
+	igt_display_t *display = &data->display;
+	igt_plane_t *primary;
+	igt_output_t *output = NULL;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		/* Check VRR capabilities before setting up */
+		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
+			vrr_supported = true;
+			break;
+		}
+	}
+
+	/* Skip the test if no VRR capable output is found */
+	if (!vrr_supported)
+		igt_skip("No VRR capable output found, skipping the test.\n");
+
+	igt_display_reset(display);
+
+	if (output) {
+		igt_output_set_pipe(output, pipe);
+
+		data->output = output;
+		data->mode = igt_output_get_mode(output);
+		setup_videoplayback(data);
+
+		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+		pre_val = read_pkgc_counter(data->debugfs_root_fd);
+		delay = 1 * (MSECS / (data->mode->vrefresh - 10));
+
+		igt_plane_set_fb(primary, &data->fb_rgb);
+		igt_display_commit(&data->display);
+
+		while (time(NULL) - start < duration) {
+			flip = !flip;
+			igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
+			igt_display_commit(&data->display);
+
+			cur_val = read_pkgc_counter(data->debugfs_root_fd);
+			if (cur_val > pre_val) {
+				pkgc_flag = true;
+				break;
+			}
+			usleep(delay);
+		}
+	}
+	cleanup_dc3co_fbs(data);
+	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
+}
+
 static void test_pkgc_state_dpms(data_t *data)
 {
 	unsigned int timeout_sec = 6;
@@ -687,6 +750,15 @@ igt_main
 			test_dc_state_psr(&data, CHECK_DC6);
 	}
 
+	igt_describe("This test validates display engine entry to PKGC10 state "
+		     "during extended vblank");
+	igt_subtest("deep-pkgc") {
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+			      "PC8+ residencies not supported\n");
+		igt_require(intel_display_ver(data.devid) >= 20);
+		test_deep_pkgc_state(&data);
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while all connectors's DPMS property set to OFF");
 	igt_subtest("dc5-dpms") {
-- 
2.25.1

