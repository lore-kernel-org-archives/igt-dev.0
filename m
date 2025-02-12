Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303BC021A4
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED810E7CA;
	Wed, 12 Feb 2025 07:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzxjdYDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5707310E7CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739344835; x=1770880835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Tg3Wm6x/YAzOwU+P6u4g2ya87wdPX4WEhIh0PgSRvo=;
 b=gzxjdYDbGeHYWs23g61Bv0t8Ru+3FICp6Bh52ubHCGdirfUAwEw9J4Rl
 D6EBRheCFUlXYnJp5eo3Wza+NDDA7Wy8R4YbV702AwhCHG0edK3q2H1Hs
 7VhBnS2EnB+H2uG9BTUqKC8J0ghQoQWk2b9pjGlXCB381xr4WmOtv7xOq
 50kQAPWtUtTSK6mCRapjnfIW1j7f4ZICbtafCPznGCaps6YPdi9ViyabJ
 Kyj1pha84sZNi7uMNae1dwqI9ydT6qmaHrOIH39IE+3mgM8qSin+1yOkb
 iPJK7d6/gWcMNfftAkJQW7RLGfB4Fdg8aXeZ6FC+ZZclm6rV7i6+z+q3v w==;
X-CSE-ConnectionGUID: HMW6S5cfTV6LTs3hG9pnng==
X-CSE-MsgGUID: WyON9VnDQWqGeDIhguQofQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27586587"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="27586587"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:20:35 -0800
X-CSE-ConnectionGUID: 2LCjf5/1TKmB+wEzUSrgVQ==
X-CSE-MsgGUID: +IChrLbXR1W6Ct4hbWx/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112596794"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:20:33 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Wed, 12 Feb 2025 13:06:04 +0530
Message-Id: <20250212073604.1580120-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212073604.1580120-1-jeevan.b@intel.com>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
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

We need to ensure that the system does not enable a joiner for modes
that do not require it. This test runs on all pipes and validates
that the highest available resolution and refresh rate within the
max dot clock limit is selected. The test then forces a modeset and
flip on the given pipe and checks the status using the joiner check.
If the joiner is mistakenly enabled for a non-joiner mode, the test
should fail.

v2: Fix nonjoiner_mode_found to find the required case.
    Remove clk sort and minor fixes.
v3: Rename nonjoiner to non_joiner and minor modifications.
v4: Add joiner check.
v5: Rename test name and function name, Update test description,
    update non_joiner_mode_found logic.
v6: Update commit message and rename test, function name.
v7: Fix mode selection, loop through all pipes instead on
    pipe - 1, update igt description and add igt info to display
    the selected mode.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 086cfeb71..062a0e49d 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -74,6 +74,10 @@
  *
  * SUBTEST: switch-modeset-ultra-joiner-big-joiner
  * Description: Verify switching between ultra joiner and big joiner modeset.
+ *
+ * SUBTEST: basic-max-non-joiner
+ * Description: Validate basic max non-joiner modeset by selecting the max mode
+ *		supported on single pipe.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -85,6 +89,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int non_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -94,6 +99,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -491,6 +497,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 	}
 }
 
+static void test_basic_max_non_joiner(data_t *data)
+{
+	int count;
+	enum pipe pipe;
+	igt_output_t **outputs, *output;
+	igt_fb_t fb;
+	igt_plane_t *primary;
+	drmModeModeInfo mode;
+
+	count = data->non_joiner_output_count;
+	outputs = data->non_joiner_output;
+	igt_display_reset(&data->display);
+
+	for (int i = 0; i < count; i++) {
+		output = outputs[i];
+
+		for (pipe = 0; pipe < data->n_pipes; pipe++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+				igt_output_set_pipe(output, pipe);
+				igt_require(max_non_joiner_mode_found(data->drm_fd,
+								      output->config.connector,
+								      max_dotclock, &mode));
+				igt_output_override_mode(output, &mode);
+				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
+					 mode.vdisplay, mode.vrefresh);
+				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+						      DRM_FORMAT_XRGB8888,
+						      DRM_FORMAT_MOD_LINEAR, &fb);
+				igt_plane_set_fb(primary, &fb);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+				igt_assert_f(!igt_is_joiner_enabled_for_pipe(data->drm_fd, pipe),
+					     "Joiner enabled on pipe %c", 'A' + pipe);
+
+				igt_display_reset(&data->display);
+				igt_plane_set_fb(primary, NULL);
+				igt_remove_fb(data->drm_fd, &fb);
+			}
+		}
+	}
+}
+
 igt_main
 {
 	bool ultra_joiner_supported, is_dgfx;
@@ -505,6 +553,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.non_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -523,6 +572,7 @@ igt_main
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool non_joiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -533,6 +583,8 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			non_joiner_found = max_non_joiner_mode_found(data.drm_fd, connector,
+								     max_dotclock, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
@@ -548,6 +600,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (non_joiner_found)
+				data.non_joiner_output[data.non_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -713,6 +768,16 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
+		     "all pipes");
+	igt_subtest_with_dynamic("basic-max-non-joiner") {
+		igt_require_f(data.n_pipes >= 1,
+			      "At least one pipe is required.\n");
+		igt_require_f(data.non_joiner_output_count  > 0,
+			      "No suitable non-joiner mode found\n");
+			test_basic_max_non_joiner(&data);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

