Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BEEC02193
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 17:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D75F10E843;
	Wed, 29 Jan 2025 17:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaBQ3g34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDCB10E843
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738170159; x=1769706159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nWuf9vqbvAZTrJBqO0Bgk6B56IBI0vsu3GciHSZ5Oik=;
 b=VaBQ3g34UsWMi5YYxZ1adIIFxCKvKNB426zOg9JghzanyIE9oYsodK+t
 aTT+BexOGie+JABzo3sbonEMGTRC2BchkftYlMTlCwGYFrVEcKxaS0nKN
 SYpZxnEAeITC3/OwtDMPPzcteU4eHFMUN6gIL3XOp36d0VrnlJc4Me0ZA
 DB6sLt/ShVwOjVxZkmH3wApJzXuOsSTDsocZN68siVNSXtlefUE3tf/Df
 5IMpkH2uAfxYyGrfvfeD0khm6smmVJQJ4nWVpfv145UrXov71Ak26No4w
 vLLQvEacGIe87erFbPfdzkG0eVMZ0uE924Sg1PlUlwHF8vT3hIEVbT0/N w==;
X-CSE-ConnectionGUID: v6JTjP3jRSq7LSomXQK9dA==
X-CSE-MsgGUID: aovE+42+TlSph3LOtk8PXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49350040"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="49350040"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:02:38 -0800
X-CSE-ConnectionGUID: 9RW4VnfTT5CIPJk/to9DBQ==
X-CSE-MsgGUID: COrfUCuYQI6sQWbz/Yxzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="108904427"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:02:36 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Wed, 29 Jan 2025 22:47:54 +0530
Message-Id: <20250129171754.3654118-1-jeevan.b@intel.com>
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

v2: Fix nonjoiner_mode_found to find the required case(6K@30).
    Remove clk sort and minor fixes. (Karthik)
v3: Rename nonjoiner to non_joiner and minor modifications. (Swati)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 086cfeb71..a174d1872 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -74,6 +74,9 @@
  *
  * SUBTEST: switch-modeset-ultra-joiner-big-joiner
  * Description: Verify switching between ultra joiner and big joiner modeset.
+ *
+ * SUBTEST: basic-non-joiner
+ * Description: Vefiry basic non-joiner mode across all pipes.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -85,6 +88,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int non_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -94,6 +98,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -164,6 +169,23 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
+static bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+				  drmModeModeInfo *mode)
+{
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if ((current_mode->hdisplay == 6144 && current_mode->vrefresh == 30) ||
+		    mode->clock < max_dotclock) {
+			*mode = *current_mode;
+			return true;
+		}
+	}
+	return false;
+}
+
 static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
 {
 	igt_plane_t *primary;
@@ -491,6 +513,47 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
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
+	count = data->non_joiner_output_count;
+	outputs = data->non_joiner_output;
+	igt_display_reset(&data->display);
+
+	for (int i = 0; i < count; i++) {
+		output = outputs[i];
+		con = output->config.connector;
+
+		if (non_joiner_mode_found(data->drm_fd, con, &mode)) {
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
+		} else {
+			igt_warn("No valid non-joiner mode found for output %s\n", igt_output_name(output));
+		}
+	}
+}
+
 igt_main
 {
 	bool ultra_joiner_supported, is_dgfx;
@@ -505,6 +568,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.non_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -523,6 +587,7 @@ igt_main
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool non_joiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -533,6 +598,7 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
@@ -548,6 +614,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (non_joiner_found)
+				data.non_joiner_output[data.non_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -713,6 +782,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-non-joiner") {
+		igt_require_f(data.n_pipes >= 1,
+			      "Minimum of 1 pipe is required.\n");
+		igt_dynamic_f("non-joiner")
+			test_single_non_joiner(&data);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

