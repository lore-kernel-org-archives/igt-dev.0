Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D39EC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340710E743;
	Tue, 11 Feb 2025 17:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp9N2tO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606F10E741
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296214; x=1770832214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cF9t3z0p9EMUxRj8Z1jfruRxMscswj24UQLn/ybHSTI=;
 b=Sp9N2tO/in0vgvvQBpMLsia/1SgT2Y28wogz0+SbpW8epVxbEw4Pyp9w
 AMLpcqdICR3u8kndYbMWWyKjVcepl1lF8w9VAVuqb1GCSIjgEAc+JgTMd
 e85Q5Krgku5wYxu6IbX7msdHYJWWKlK6+gO+9Tb1oIMnZXH661INGvQP0
 5D68gCCmJ2daSezYl0qRS364hgdAzdIhSOlKDIXsW4B8IdZjjPtBqXUbD
 nQjf8F+4Q+CioC4tmVpGshE1AiAdAK4u/6PEXmzGZm49GzVlRicoeGZ5/
 Zeh0pd7BlofKR6easGgeRETzhZcrcS2Td12reONOnhlTKB4gMUFsTCdXT A==;
X-CSE-ConnectionGUID: qi4A8pLxQjmf66Lzg7C/iA==
X-CSE-MsgGUID: U1zKGUWFRFe8bnCWDGu5gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339103"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:14 -0800
X-CSE-ConnectionGUID: xO8BmTQHQyW43tnOsFvO4w==
X-CSE-MsgGUID: gm1yU6dFSeyleS9o/9WY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767522"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:13 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 5/7] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
Date: Tue, 11 Feb 2025 23:35:40 +0530
Message-Id: <20250211180542.1430676-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

Add new dsc-fallback test to check whether DSC
automatically kicks in while falling back to a
lower rate/lane.

v2: fix description (Swati)
    fix indentation (Swati)
    remove extra line (Swati)
    make commit description clear (Ankit)
    split refactor and dsc-fallback test (Ankit)
    switch to igt_debug (Ankit)

v3: use macro instead of magic number (Ankit)
    fix test order (Ankit)
    new line before return (Ankit)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 162 +++++++++++++++++++++++-
 tests/meson.build                       |   4 +-
 2 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index c6e9fba53..d26e25bba 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -17,10 +17,14 @@
 #include "igt_sysfs.h"
 #include "igt.h"
 #include "kms_mst_helper.h"
+#include "kms_dsc_helper.h"
 
 /**
  * SUBTEST: dp-fallback
  * Description: Test fallback on DP connectors
+ *
+ * SUBTEST: dsc-fallback
+ * Description: Test fallback to DSC when BW isn't sufficient
  */
 
 #define RETRAIN_COUNT 1
@@ -46,7 +50,7 @@ typedef struct {
 
 typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
 
-IGT_TEST_DESCRIPTION("Test link training fallback");
+IGT_TEST_DESCRIPTION("Test link-training / dsc fallback");
 
 static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 			      int *output_count)
@@ -424,7 +428,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	}
 }
 
-static bool run_test(data_t *data)
+static bool run_lt_fallback_test(data_t *data)
 {
 	bool ran = false;
 	igt_output_t *output;
@@ -462,6 +466,153 @@ static bool run_test(data_t *data)
 	return ran;
 }
 
+static void test_dsc_sst_fallback(data_t *data)
+{
+	bool non_dsc_mode_found = false;
+	bool dsc_fallback_successful = false;
+	int ret;
+	struct udev_monitor *mon;
+	drmModeModeInfo *mode_to_check;
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int output_count = 0;
+
+	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
+	data->pipe = PIPE_A;
+
+	igt_display_reset(&data->display);
+	igt_reset_link_params(data->drm_fd, data->output);
+	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+
+	/* Find a mode that doesn't require DSC initially */
+	for_each_connector_mode(data->output) {
+		data->mode = &data->output->config.connector->modes[j__];
+		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+				    &data->fb);
+		igt_output_override_mode(data->output, data->mode);
+		igt_output_set_pipe(data->output, data->pipe);
+		data->primary = igt_output_get_plane_type(data->output,
+						DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(data->primary, &data->fb);
+
+		ret = igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		if (ret != 0) {
+			igt_debug("Skipping mode %dx%d@%d on %s\n",
+				 data->mode->hdisplay, data->mode->vdisplay,
+				 data->mode->vrefresh,
+				 igt_output_name(data->output));
+			continue;
+		}
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		if (!igt_is_dsc_enabled(data->drm_fd,
+					data->output->name)) {
+			drmModeModeInfo *non_dsc_mode
+				= igt_output_get_mode(data->output);
+			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
+				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
+				 non_dsc_mode->vrefresh, non_dsc_mode->name,
+				 igt_get_current_link_rate(data->drm_fd, data->output),
+				 igt_get_current_lane_count(data->drm_fd, data->output));
+			non_dsc_mode_found = true;
+			break;
+		}
+	}
+	igt_require_f(non_dsc_mode_found,
+		      "No non-DSC mode found on %s\n",
+		      igt_output_name(data->output));
+
+	/* Repeatedly force link failure until DSC is required (or link is disabled) */
+	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
+		mon = igt_watch_uevents();
+
+		igt_assert_f(force_failure_and_wait(data, data->output,
+						    LT_FAILURE_REDUCED_CAPS,
+						    RETRAIN_COUNT, 1.0, 20.0),
+			     "Forcing DSC fallback timed out\n");
+
+		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
+						     data->output)) {
+			igt_reset_connectors();
+			igt_flush_uevents(mon);
+			return;
+		}
+
+		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
+							    data,
+							    data->output,
+							    mon,
+							    20.0),
+			     "Didn't get hotplug or link-status=BAD for DSC\n");
+		igt_flush_uevents(mon);
+
+		outputs[output_count++] = data->output;
+		set_connector_link_status_good(data, outputs, &output_count);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		mode_to_check = igt_output_get_mode(data->output);
+
+		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
+			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
+				 mode_to_check->hdisplay, mode_to_check->vdisplay,
+				 mode_to_check->vrefresh,
+				 igt_get_current_link_rate(data->drm_fd, data->output),
+				 igt_get_current_lane_count(data->drm_fd, data->output));
+			igt_info("DSC fallback successful on %s\n",
+				 igt_output_name(data->output));
+			dsc_fallback_successful = true;
+			break;
+		} else {
+			igt_info("mode %dx%d@%d still doesn't require DSC\n",
+				 mode_to_check->hdisplay, mode_to_check->vdisplay,
+				 mode_to_check->vrefresh);
+		}
+	}
+	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
+}
+
+static bool run_dsc_sst_fallaback_test(data_t *data)
+{
+	bool ran = false;
+	igt_output_t *output;
+
+	if (!is_dsc_supported_by_source(data->drm_fd)) {
+		igt_info("DSC not supported by source.\n");
+		return ran;
+	}
+
+	for_each_connected_output(&data->display, output) {
+		data->output = output;
+
+		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
+								 data->output)) {
+			igt_info("Output %s doesn't support forcing link training.\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+			igt_info("Skipping output %s as it's not DP\n", output->name);
+			continue;
+		}
+
+		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
+			igt_info("Skipping output %s as DSC not supported by sink\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		ran = true;
+		test_dsc_sst_fallback(data);
+	}
+
+	return ran;
+}
+
 igt_main
 {
 	data_t data = {};
@@ -486,10 +637,15 @@ igt_main
 	}
 
 	igt_subtest("dp-fallback") {
-		igt_require_f(run_test(&data),
+		igt_require_f(run_lt_fallback_test(&data),
 			      "Skipping test as no output found or none supports fallback\n");
 	}
 
+	igt_subtest("dsc-fallback") {
+		igt_require_f(run_dsc_sst_fallaback_test(&data),
+			      "Skipping test: DSC fallback conditions not met.\n");
+	}
+
 	igt_fixture {
 		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
diff --git a/tests/meson.build b/tests/meson.build
index a6f6ad560..95892762e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -366,7 +366,9 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
+	'kms_dp_linktrain_fallback': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
-- 
2.25.1

