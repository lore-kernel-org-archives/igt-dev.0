Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACB3C982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC6D89C55;
	Mon, 21 Sep 2026 12:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfVNr/SZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8610E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994653; x=1821530653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IbtJ1aw1rxd4UpEumyabLcqr6DNB3xFEe6BpHpx/OmA=;
 b=TfVNr/SZvVPZbUSz+8hvuQYdZIJWfXoXdwVCdSbu7Srvc1U1RTiVGs3L
 oIxe2DA9OnXCikDmjddOO/bX7hqVRVkLhl3ayPWtoG7aWUJ8g5SE5LidR
 Eipb/vFSPvP3K9tkDUiWhTfE87UCCzd8D87mOTIa9ydIogLZW8wSG1JH+
 odqh9e922ZrUrypZ6ZR//bTf9rFkYoxLH7ZY8ByNt1BVMYMq4A6GyFyb2
 UwViZA4gNg0YCCEy+lbik3QXes1Pq4GeCQfvOzLjjnzU+NGIvWA4wQFDd
 cJYSf1gp5TMZhPnQLK17J2WKdEpGHso+ebDJldATfT58qv+32E2WdphRB w==;
X-CSE-ConnectionGUID: Pv0koLVRTtibyNSnyJe7XA==
X-CSE-MsgGUID: 2toBmmmSTre1lMnFE+NUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1007032"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1007032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:44:13 -0700
X-CSE-ConnectionGUID: RHOF+8iMTnqyHlmBwDlVnQ==
X-CSE-MsgGUID: uTeW7P6ZRo+w0RRncU/dJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272798023"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 05:44:11 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_joiner: Add PSR2 selective fetch
 test with joiner
Date: Mon, 21 Sep 2026 12:44:07 +0000
Message-ID: <20260921124408.358774-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921124408.358774-1-mika.kahola@intel.com>
References: <20260921124408.358774-1-mika.kahola@intel.com>
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

Add basic-force-big-joiner-psr2-sel-fetch to check that PSR2
selective fetch enters while forced into big joiner mode.

PSR2 selective fetch only supports the PIPE_A|PIPE_B joiner pair, so
restrict setup_pipe() to PIPE_A. Force enable_psr=2, since it can
otherwise cap PSR at PSR1 regardless of the debugfs override. Retry
psr_wait_entry(), since bigjoiner commits settle slower than
single-pipe ones.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_joiner.c | 88 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 2f069db67..9e056942e 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -33,6 +33,7 @@
  */
 
 #include "igt.h"
+#include "igt_psr.h"
 #include "kms_dsc_helper.c"
 #include "kms_joiner_helper.h"
 
@@ -61,6 +62,10 @@
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
  *		the test exclusively targets non-bigjoiner outputs.
  *
+ * SUBTEST: basic-force-big-joiner-psr2-sel-fetch
+ * Description: Verify PSR2 selective fetch can be entered while the output is
+ *		driven in force big joiner mode.
+ *
  * SUBTEST: basic-force-ultra-joiner
  * Description: Verify basic ultra joiner modeset in force joiner mode across all pipes.
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
@@ -83,6 +88,7 @@ IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
 typedef struct {
 	int drm_fd;
+	int debugfs_fd;
 	int big_joiner_output_count;
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
@@ -217,6 +223,22 @@ static void require_big_joiner(data_t *data, enum force_joiner_mode mode)
 			      "No big joiner output found\n");
 }
 
+/* Returns a force joiner capable output supporting PSR2 selective fetch, or NULL. */
+static igt_output_t *get_psr2_sel_fetch_output(data_t *data)
+{
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_big_joiner_output_count; i++) {
+		output = data->non_big_joiner_output[i];
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+				     PSR_MODE_2_SEL_FETCH, output))
+			return output;
+	}
+
+	return NULL;
+}
+
 static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
 {
 	drmModeModeInfo bj_mode;
@@ -307,6 +329,51 @@ static void test_single_joiner(data_t *data, igt_output_t **outputs, int output_
 	}
 }
 
+static void test_joiner_psr2_sel_fetch(data_t *data, igt_output_t *output)
+{
+	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
+	enum pipe master_pipe;
+	igt_plane_t *primary;
+	igt_fb_t fb;
+	drmModeModeInfo *mode;
+	bool entered;
+	int retry;
+
+	/* enable_psr=1 (force PSR1) silently fails intel_psr2_config_valid(), overriding debugfs. */
+	igt_set_module_param_int(data->drm_fd, "enable_psr", 2);
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Arm PSR2 selective fetch before the joiner modeset so it applies to the next commit. */
+	igt_require_f(psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_2_SEL_FETCH, output),
+		      "Failed to enable PSR2 selective fetch on %s\n", output->name);
+
+	/* psr_joiner_config_valid() only allows the joiner pipe mask to be PIPE_A|PIPE_B. */
+	master_pipe = setup_pipe(data, output, PIPE_A, available_pipe_mask);
+	igt_require_f(master_pipe == PIPE_A,
+		      "No PIPE_A/B joiner pairing available for %s\n", output->name);
+
+	mode = igt_output_get_mode(output);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Bigjoiner commits settle slower than single-pipe ones, so retry past the 500ms default. */
+	entered = false;
+	for (retry = 0; retry < 4 && !entered; retry++)
+		entered = psr_wait_entry(data->debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
+	igt_assert_f(entered,
+		     "PSR2 selective fetch did not enter with joiner active on %s\n", output->name);
+
+	psr_disable(data->drm_fd, data->debugfs_fd, output);
+	igt_display_reset(&data->display);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
 static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i, cleanup;
@@ -641,6 +708,7 @@ int igt_main()
 		j = 0;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
@@ -764,6 +832,25 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify PSR2 selective fetch can be entered while the output "
+		     "is driven in force big joiner mode");
+	igt_subtest_with_dynamic("basic-force-big-joiner-psr2-sel-fetch") {
+		igt_output_t *psr_output;
+
+		require_big_joiner(&data, FORCE_JOINER_ENABLE);
+
+		psr_output = get_psr2_sel_fetch_output(&data);
+		igt_require_f(psr_output, "No output supporting PSR2 selective fetch found\n");
+
+		igt_dynamic_f("pipe-%s", psr_output->name) {
+			bool status = kmstest_force_connector_joiner(data.drm_fd, psr_output->config.connector,
+							     JOINED_PIPES_BIG_JOINER);
+			igt_assert_f(status, "Failed to toggle force joiner on %s\n", psr_output->name);
+			test_joiner_psr2_sel_fetch(&data, psr_output);
+			igt_reset_connectors();
+		}
+	}
+
 	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
 		require_big_joiner(&data, FORCE_JOINER_ENABLE);
 		if (data.non_big_joiner_output_count >= 1) {
@@ -836,6 +923,7 @@ int igt_main()
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
+		close(data.debugfs_fd);
 		drm_close_driver(data.drm_fd);
 		igt_reset_connectors();
 	}
-- 
2.43.0

