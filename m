Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5FEC47DD3
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 16:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2B910E863;
	Thu, 18 Jan 2024 16:09:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2058010E863
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594160; x=1737130160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BFDuwUmrOYzuwcdt97KqmdDCnzhoRsjZunZOwo+/49Y=;
 b=c8QZl8zpZ8cWlJTIQpgrhPpow3IS/kiXE5YtZQYdhwL464r8rsMY76vm
 cn9olTxD0+vKSPwYOG1APQMJePpHDJ6FpMRO7i94cdi0K4YbOLgM/xoIi
 dgTtUoP6X05g71v8bk4vUp52T4IQ9a83VJrfGAPjoSlmfN2BDYMR+EhFU
 3T4SFBfVwu3XENlDeC+HsERnFYxwVIGqKSK7K/8ufzT8pWFpDSwuR6/vc
 OY8ZcdjEZw7dL9y2xi+o/1ugP+MtDrqN/3kl3xFo8VXx0dgV7VzDZO0ZH
 Eq9ky6mm/30PYlcohavdvPmfMvk35e7h3Hg9cRLqBk7A9xYooCfwgrq8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="382071"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="382071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="33145336"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:18 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: add new test to
 validate force bigjoiner
Date: Thu, 18 Jan 2024 21:48:47 +0530
Message-Id: <20240118161847.1001234-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118161847.1001234-1-kunal1.joshi@intel.com>
References: <20240118161847.1001234-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Earlier bigjoiner was enabled only for below cases
a) for mode having hdisplay > 5k
b) if clock requirement were higher than 1 pipe could handle

https://patchwork.freedesktop.org/series/124730/
With above series we can force bigjoiner without such constraints.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 92 +++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index aba2adfbe..bc1c49023 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -46,8 +46,10 @@
  *
  * SUBTEST: 2x-modeset
  * Description: Verify simultaneous modeset on 2 big joiner outputs
+ *
+ * SUBTEST: force-bigjoiner
+ * Description: Verify bigjoiner on non bigjoiner outputs by force
  */
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
 struct bigjoiner_output {
@@ -67,6 +69,23 @@ typedef struct {
 
 static int max_dotclock;
 
+static void force_big_joiner_on_all_outputs(data_t *data, bool enable)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		/*
+		 * Force big joiner on output
+		 */
+		igt_assert_f(igt_force_bigjoiner_enable(data->drm_fd, output->name, enable) >= 0,
+			     "Failed to %s big joiner for connector %s\n",
+			     enable ? "enable" : "disable", output->name);
+		igt_assert_f(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == enable ? 1 : 0,
+			     "Failed to force big joiner on output %s\n", output->name);
+	}
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
 static void test_invalid_modeset(data_t *data)
 {
 	igt_output_t *output;
@@ -107,6 +126,53 @@ static void test_invalid_modeset(data_t *data)
 	igt_assert_lt(ret, 0);
 }
 
+static void cleanup(data_t *data, igt_output_t *output, struct igt_fb *primary_fb, igt_plane_t **primary) {
+    for_each_connected_output(&data->display, output) {
+        igt_output_set_pipe(output, PIPE_NONE);
+    }
+    force_big_joiner_on_all_outputs(data, false);
+    free(primary_fb);
+    free(primary);
+}
+
+static void force_bigjoiner(data_t *data, int simultaneous_bigjoner)
+{
+	int no_of_outputs;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	enum pipe pipe;
+	struct igt_fb *primary_fb = malloc(data->n_pipes * sizeof(struct igt_fb));
+	igt_plane_t **primary = malloc(data->n_pipes * sizeof(igt_plane_t *));
+
+	igt_display_reset(display);
+	pipe = 0;
+	no_of_outputs = 0;
+
+	force_big_joiner_on_all_outputs(data, true);
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 0.0, &primary_fb[no_of_outputs]);
+		igt_output_set_pipe(output, pipe);
+		primary[no_of_outputs] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary[no_of_outputs], &primary_fb[no_of_outputs]);
+		igt_info("Using (pipe %s + %s) to run the subtest with mode %dx%d@%d.\n",
+				kmstest_pipe_name(pipe), igt_output_name(output),
+				output->override_mode.hdisplay, output->override_mode.vdisplay, output->override_mode.vrefresh);
+		no_of_outputs++;
+		pipe = pipe + 2;
+		if (pipe >= data->n_pipes || no_of_outputs >= simultaneous_bigjoner)
+			break;
+	}
+	if (no_of_outputs != simultaneous_bigjoner) {
+		cleanup(data, output, primary_fb, primary);
+		igt_skip("Can't test all outputs\n");
+	}
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	cleanup(data, output, primary_fb, primary);
+}
+
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -257,24 +323,27 @@ igt_main
 			j++;
 		}
 
-		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
-
-		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic") {
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
 			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
 				test_basic_modeset(&data);
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 		data.pipe1 = pipe_seq[j - 1];
 
 		igt_display_reset(&data.display);
@@ -323,11 +392,15 @@ igt_main
 					test_invalid_modeset(&data);
 			}
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
 	}
 
 	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
 	igt_subtest_with_dynamic("2x-modeset") {
 		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
+
 		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
 		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
@@ -335,10 +408,17 @@ igt_main
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
 				test_dual_display(&data);
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
+	}
+
+	igt_describe("Verify bigjoiner on non bigjoiner outputs by force");
+	igt_subtest_with_dynamic("force-bigjoiner") {
+		for (i = 1; i  < valid_output+1; i++)
+			igt_dynamic_f("%dx", i)
+				force_bigjoiner(&data, i);
 	}
 
 	igt_fixture {
-		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.25.1

