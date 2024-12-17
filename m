Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C46E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318E10EA71;
	Tue, 17 Dec 2024 19:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYoiopAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F6910EA59
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734462124; x=1765998124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/p3usSZ5TF2GG8znusKn3Y/2Wnsx64aTc3MBviEbuMw=;
 b=fYoiopAIYbD8rHIMPCuRWkRyDdlbugx3MLXGeU+ou72CKZtLlRhIU5Zx
 l8DyMGd/Q28A9C1fRFLFkb3k5gUDsn4xNzVWQZkk0maofodbCXc5kGV1L
 ueupo+ytgkw5F9ga8CvEusAaBwtvh5+pnCBYF8WGBQXU3SLn0JnTDeSb6
 LHk1PXPj4Nui+MsHxY+f1Pc380A98Zjv7AS46EaqnraBuoEaiTlKQl5lS
 PlNQEAQbZkZzjmB6MPDEbeXtb2N9vhlh1I99b9bbfX0+fcCqjhN07nOhX
 xUJW+3/oxdjtQvpe59hlW0SFMW+PbtQb6EtG/kBHk+JqYeB2y6/590VYV w==;
X-CSE-ConnectionGUID: WSt68olhQNKYUpqMQNl/Kw==
X-CSE-MsgGUID: nKtToGWRQQ61wmgQlmeIjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35032238"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="35032238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:02:03 -0800
X-CSE-ConnectionGUID: KxQd6YQXTASHbKeHLSt2dQ==
X-CSE-MsgGUID: dKOda2k9TVC+nGoTWofsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97508687"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:02:00 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, swati2.sharma@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] RFC: tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Wed, 18 Dec 2024 00:46:57 +0530
Message-Id: <20241217191657.2102779-1-jeevan.b@intel.com>
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

We need to ensure that the system does not use a joiner for modes that do
not require it. This test will validate that the correct non-joiner mode
is selected, and then forcing a modeset and flip on the last pipe. If the
joiner is mistakenly enabled for a non-joiner mode, the test should fail.
otherwise, the commit should proceed as expected.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 83 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 9a353ee1b..a41f201d1 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -71,10 +71,15 @@
  * SUBTEST: invalid-modeset-force-ultra-joiner
  * Description: Verify if the modeset on the other pipes are rejected when
  *              the pipe A is active with force ultra joiner modeset.
+ *
+ * SUBTEST: basic-non-joiner
+ * Description:
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
 #define INVALID_TEST_OUTPUT 2
+#define HDISPLAY_6K_PER_PIPE 6144
+#define HDISPLAY_5K_PER_PIPE 5120
 
 typedef struct {
 	int drm_fd;
@@ -82,6 +87,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int nonjoiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -91,6 +97,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *nonjoiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -161,6 +168,25 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
+static bool nonjoiner_mode_found(int drm_fd, drmModeConnector *connector, drmModeModeInfo *mode)
+{
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if ((current_mode->hdisplay <= HDISPLAY_6K_PER_PIPE &&
+		    current_mode->clock <= max_dotclock) ||
+		    (current_mode->hdisplay <= HDISPLAY_5K_PER_PIPE)) {
+			*mode = *current_mode;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
@@ -409,6 +435,49 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 	}
 }
 
+static void test_single_non_joiner(data_t *data)
+{
+	int count;
+	igt_output_t **outputs, *output;
+	igt_fb_t fb;
+	igt_plane_t *primary;
+	drmModeModeInfo mode;
+	drmModeConnector *con;
+
+	count = data->nonjoiner_output_count;
+	outputs = data->nonjoiner_output;
+
+	for (int i = 0; i < count; i++) {
+		igt_display_reset(&data->display);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		output = outputs[i];
+		con = output->config.connector;
+
+		if (nonjoiner_mode_found(data->drm_fd, con, &mode)) {
+			igt_output_override_mode(output, &mode);
+			igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
+				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
+				 igt_output_name(output), mode.hdisplay,
+				 mode.vdisplay, mode.vrefresh);
+
+			igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
+
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
+					      DRM_FORMAT_MOD_LINEAR, &fb);
+
+			igt_plane_set_fb(primary, &fb);
+			igt_assert(igt_display_try_commit2(&data->display, COMMIT_ATOMIC));
+			igt_plane_set_fb(primary, NULL);
+			igt_remove_fb(data->drm_fd, &fb);
+		}
+		else {
+			igt_warn("No valid non-joiner mode found for output %s\n", igt_output_name(output));
+		}
+	}
+}
+
 igt_main
 {
 	bool ultra_joiner_supported, is_dgfx;
@@ -423,6 +492,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.nonjoiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -441,6 +511,7 @@ igt_main
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool nonjoiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -451,6 +522,7 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			nonjoiner_found = nonjoiner_mode_found(data.drm_fd, connector, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
@@ -465,6 +537,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (nonjoiner_found)
+				data.nonjoiner_output[data.nonjoiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -615,6 +690,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-non-joiner") {
+		igt_require_f(data.n_pipes >= 1,
+			      "Minimum of 1 pipes are required\n");
+		igt_dynamic_f("non-joiner")
+			test_single_non_joiner(&data);
+        }
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

