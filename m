Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC92606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XO8WCo4C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DC10E130;
	Wed,  4 Nov 2026 13:10:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9353510FBD8
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797667; x=1825333667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lk+Go7WyqD/v+BXuHqLsjXfhENYXy+Tsa6hUkUxawN8=;
 b=XO8WCo4Cg5UzNMi6g2lSvDmjVx3/oWNsX3RDvT+4qGmvwntJj2tBxtYk
 PxwCSGBF8fMwL4yVCS2puqnUyVCPWbt3sxf4XW/dH1nF1ml8zOFkBn2XW
 lRrghpz/XTOOLLSektgIbkKc9Ej844DLPauPXurDN+5/RcncnxCdxK7ky
 rerQXGdNJGUJL6Kt7BnXXrpUrt6N53B6Lf7NbkerBjE1JAmY7y3ZzWmmE
 wM81ZeHQ3rgljElNve3gKcboKkUs28VLBGe23E5MOq1hl1IRkDUR3+sR/
 C9fW/4jBUC9kvlzkbuBpLlEtKGPAJcE6BqNefi/nP7yg8iPCLGAk6XtRn Q==;
X-CSE-ConnectionGUID: y8+KIxEiSwiWHt874JP3pg==
X-CSE-MsgGUID: DkBNyYVtRdaUMkw+75X6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424646"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:07:43 -0800
X-CSE-ConnectionGUID: PcsaiSb3QI64HfRsora/Ag==
X-CSE-MsgGUID: grMTzEWiQumQkPRYeVyiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6565704"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa008.jf.intel.com with ESMTP; 04 Nov 2026 05:07:42 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel/kms_joiner: Add PSR2 selective fetch
 test with joiner
Date: Wed,  4 Nov 2026 13:07:36 +0000
Message-ID: <20261104130737.2549248-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104130737.2549248-1-mika.kahola@intel.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add basic-force-big-joiner-psr2-sel-fetch to check that PSR2
selective fetch enters while forced into big joiner mode.

PSR2 selective fetch only supports the PIPE_A|PIPE_B joiner pair, so
restrict setup_pipe() to PIPE_A. Force enable_psr=2, since it can
otherwise cap PSR at PSR1 regardless of the debugfs override. Retry
psr_wait_entry(), since bigjoiner commits settle slower than
single-pipe ones.

v2: Skip the test if joiner is not supported on eDP.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_joiner.c | 93 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 0a04f7ca8..8edec55d2 100644
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
@@ -307,6 +329,56 @@ static void test_single_joiner(data_t *data, igt_output_t **outputs, int output_
 	}
 }
 
+static void test_joiner_psr2_sel_fetch(data_t *data, igt_output_t *output)
+{
+	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
+	enum hardware_pipe master_pipe;
+	igt_plane_t *primary;
+	igt_fb_t fb;
+	drmModeModeInfo *mode;
+	bool entered = false, joiner_active;
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
+	joiner_active = igt_is_joiner_enabled_for_pipe(data->drm_fd, master_pipe);
+
+	if (joiner_active) {
+		/* Bigjoiner commits settle slower than single-pipe ones, so retry past the 500ms default. */
+		for (retry = 0; retry < 4 && !entered; retry++)
+			entered = psr_wait_entry(data->debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
+	}
+
+	psr_disable(data->drm_fd, data->debugfs_fd, output);
+	igt_display_reset(&data->display);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	igt_require_f(joiner_active, "Joiner not enabled on %s\n", output->name);
+	igt_assert_f(entered,
+		     "PSR2 selective fetch did not enter with joiner active on %s\n", output->name);
+}
+
 static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i, cleanup;
@@ -641,6 +713,7 @@ int igt_main()
 		j = 0;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
@@ -764,6 +837,25 @@ int igt_main()
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
@@ -836,6 +928,7 @@ int igt_main()
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
+		close(data.debugfs_fd);
 		drm_close_driver(data.drm_fd);
 		igt_reset_connectors();
 	}
-- 
2.43.0

