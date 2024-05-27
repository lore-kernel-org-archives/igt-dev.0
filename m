Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35BC25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 04:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B0A10F84E;
	Mon, 27 May 2024 04:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUYFRWR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CC210F84E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 04:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716783118; x=1748319118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EVtZiMS4FKj/UCsC90gDl8R8e0LgaQ1B3tbfM3Ru6Ts=;
 b=mUYFRWR7nCrVWdvEPKo0BtOf+mv8saZsEBrubkYMYINyhmplxHGbHlQu
 aqA1TFor07SS6BuCumo9q+C6B/WJ3aYOxnmpQzpnrDYcRu+jRLnvk88h5
 6XZr5Sbm0AqobVxpHTwHCYy/1mZkudLvjucPOC9PEfagL60ULzXoZnzkU
 3G1QdOcnhkmVJmYIyD1SVzzinTW2F4oCqsc0bldqD+RKdpPJcCqzUltSF
 r0Ush4CrJTNrQKcenPNCC0Ro9sp3/uQ+JAKOCkH98H1x2QZZSaUmtxMzs
 AHelR5dDOzEK0zgo9QpahMOifSnRMYeF1LHUgE6alapMcNlK46MA6LHmQ Q==;
X-CSE-ConnectionGUID: tzcVAPOVStaDe6nwg78CVA==
X-CSE-MsgGUID: fIRPorhERFi741al8HwVZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="35601606"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="35601606"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 21:11:57 -0700
X-CSE-ConnectionGUID: VMnRU9QFQhqXbwZLl49tBg==
X-CSE-MsgGUID: F/f2clD8Q16tQ1ffVjrKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="34716012"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 21:11:55 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, suraj.kandpal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate the
 deep sleep state during extended vblank
Date: Mon, 27 May 2024 09:49:08 +0530
Message-Id: <20240527041908.513920-1-jeevan.b@intel.com>
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
scenarios, where two frames are committed simultaneously for a give
time with reduced refresh rate.
v2: dealy of one frame added to simulate extended vblank.
    remove vrr related debug checks.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 7766d34d7..9f89e537d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -584,6 +584,46 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 	return get_dc_counter(str);
 }
 
+static void test_deep_pkgc_state(data_t *data)
+{
+	unsigned int pre_val = 0, cur_val = 0;
+	time_t start = time(NULL), duration = 2, delay;
+	enum pipe pipe;
+	bool pkgc_flag;
+	igt_display_t *display = &data->display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_output_set_pipe(output, pipe);
+		data->output = output;
+		data->mode = igt_output_get_mode(output);
+		setup_videoplayback(data);
+		igt_require(igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE));
+		igt_require(igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE));
+
+		primary = igt_output_get_plane_type(data->output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		pre_val = read_pkgc_counter(data->debugfs_root_fd);
+		delay = 1 * ((1000 * 1000) / data->mode->vrefresh);
+		while (time(NULL) - start < duration) {
+			igt_plane_set_fb(primary, &data->fb_rgb);
+			igt_display_commit(&data->display);
+			usleep(delay);
+
+			igt_plane_set_fb(primary, &data->fb_rgr);
+			igt_display_commit(&data->display);
+			cur_val = read_pkgc_counter(data->debugfs_root_fd);
+			if (cur_val > pre_val) {
+				pkgc_flag = true;
+				continue;
+			}
+		}
+	}
+	cleanup_dc3co_fbs(data);
+	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
+}
+
 static void test_pkgc_state_dpms(data_t *data)
 {
 	unsigned int timeout_sec = 6;
@@ -687,6 +727,15 @@ igt_main
 			test_dc_state_psr(&data, CHECK_DC6);
 	}
 
+	igt_describe("This test validates display engine entry to DC8 state "
+		     "while extended vblank");
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

