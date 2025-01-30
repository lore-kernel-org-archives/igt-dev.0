Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD074C0218F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858C010E36D;
	Thu, 30 Jan 2025 17:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iepzeBqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F80210E36D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256719; x=1769792719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EUaICAvem1QjF3S0FeF7QynkGzFdu/sqkMRFKEb4O00=;
 b=iepzeBqcdkv/3OovU3nhNXqIs565jv3j7UYZVu/X1mtHGq/KMMSUg26B
 yhuKMeZpy9DfVzjFCpReKoJaMVOuOZurtH6pyCUtN+DiofXWiN49RAkc8
 fRWz1B5zKUUZ9xVRHbaKli3CUV3pJTK67pUyDpGpULMW67ecqGuBkfeI4
 xsHbUFf2lJV3AkQg+fQSKUCp7FbatM4YGesMurL0lq5DdXY6TwBX3ZAJ0
 KpI+/wWyse89jxM/+uxbnJzdU+jI7OffuDh27RTMIJiH9H6OL5veTihFQ
 zZ1GG08wqBWncCeana78HoacG6uvFGVv6xwY1xUcYI9szNhu/0LPm77f+ g==;
X-CSE-ConnectionGUID: GTdkxlqVSluIXv4fSQu2bg==
X-CSE-MsgGUID: X5O+nn8rT0K7hlXcESugQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38953410"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38953410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:05:19 -0800
X-CSE-ConnectionGUID: Sb7YoICPSjy7GgrcpZcLGQ==
X-CSE-MsgGUID: lJibTHqfQCmvaWE5mX3zjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241177"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:05:16 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Thu, 30 Jan 2025 22:50:30 +0530
Message-Id: <20250130172031.4126606-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
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
v4: Add joiner check. (Karthik)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 78 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 0a9910046..08a9c0cb3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -75,6 +75,9 @@
  *
  * SUBTEST: switch-modeset-ultra-joiner-big-joiner
  * Description: Verify switching between ultra joiner and big joiner modeset.
+ *
+ * SUBTEST: basic-non-joiner
+ * Description: Vefiry basic non-joiner mode across all pipes.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -86,6 +89,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int non_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -95,6 +99,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -153,6 +158,23 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
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
@@ -480,6 +502,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
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
+			igt_assert(!is_joiner_has(data->drm_fd));
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
@@ -494,6 +558,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.non_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -512,6 +577,7 @@ igt_main
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool non_joiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -522,6 +588,7 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
@@ -537,6 +604,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (non_joiner_found)
+				data.non_joiner_output[data.non_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -702,6 +772,14 @@ igt_main
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

