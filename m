Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BBCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBA810E980;
	Wed, 27 May 2026 19:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sr2yuNuL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950310E976
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CeFlON1ddzObh0q8oCRzBO/fL/wFFHs+8f3gQahnu0M=; b=Sr2yuNuLFK6h7CT4MCN2oa/+kR
 IxAwDrVPpv3DK6ktNbjbDB8hP2giXuh+jthsbxr8GYQSkoMlrG2z/iX6OAs7S6ubN9YqIkoQAE6Hn
 rYGk2LO3b/GjaWTckyXWiT3a9OCx3S6ePnQlRv8l5kZ88yA8wzHVPHe4ijWQhoyoCIhJlFv0ikKJp
 CtY7SMt9bdu3X3gJ2O7iKdnjtcg1LrgAw7EsE3E7/gNATU+gKYEyr8R99POgXpaJKunCRlwMg6fHH
 7l/AsZJn8gABjKbDmm16xKCgG4p6VPcx3h0kx7e1R+L3aG42rgPR22+n8wuTXrc1ma1C3nY8V2FNl
 aT8b8UyA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSK3S-00935c-74; Wed, 27 May 2026 21:36:38 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_writeback: Add unclean shutdown test
Date: Wed, 27 May 2026 12:36:09 -0700
Message-ID: <20260527193612.651624-3-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527193612.651624-1-John.Harrison@Igalia.com>
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

The current work-in-progress i915/Xe support for writeback does not
seem to clean up correctly if the official shutdown sequence is not
followed. This leads to timeouts, ERRORs and WARNINGs being produced
by the kernel. Since userland cannot be trusted, these need to be
fixed. However, if you don't test it then it doesn't work. So add a
test that the shutdown and restart of writeback connectors can occur
cleanly even if userland doesn't do it properly.

This patch re-factors the init and fini code into separate functions.
That allows them to be called in the normal place by the normal tests,
and also called explicitly from in the middle of the shutdown test
without duplicating everything. Apart from the re-init in the middle,
the shutdown test is just a copy of the 'check-output' test.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
CC: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 203 +++++++++++++++++++++++++++++-------------
 1 file changed, 140 insertions(+), 63 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9ff2f973b..e38fe35c2 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -60,6 +60,9 @@
  *
  * SUBTEST: writeback-pixel-formats
  * Description: Check the writeback format
+ *
+ * SUBTEST: writeback-cleanup
+ * Description: Check that unclean writeback shutdown does not cause problems
  */
 
 IGT_TEST_DESCRIPTION(
@@ -586,69 +589,95 @@ static const struct option long_options[] = {
 	{}
 };
 
-int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
-{
+struct kms_writeback_data_t {
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane;
 	igt_fb_t input_fb, input_fb_10bit;
 	drmModeModeInfo mode;
-	unsigned int fb_id;
+};
+
+static void do_init(struct kms_writeback_data_t *wb_data)
+{
 	int ret;
+	unsigned int fb_id;
 
-	memset(&display, 0, sizeof(display));
+	wb_data->display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-	igt_fixture() {
-		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+	kmstest_set_vt_graphics_mode();
 
-		kmstest_set_vt_graphics_mode();
+	if (drmSetClientCap(wb_data->display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+		wb_data->display.is_atomic = 1;
 
-		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
-			display.is_atomic = 1;
+	ret = drmSetClientCap(wb_data->display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
-		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+	igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
-		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+	igt_display_require(&wb_data->display, wb_data->display.drm_fd);
 
-		igt_display_require(&display, display.drm_fd);
+	igt_require(wb_data->display.is_atomic);
 
-		igt_require(display.is_atomic);
+	wb_data->output = kms_writeback_get_output(&wb_data->display);
+	igt_require(wb_data->output);
 
-		output = kms_writeback_get_output(&display);
-		igt_require(output);
+	if (wb_data->output->use_override_mode)
+		memcpy(&wb_data->mode, &wb_data->output->override_mode, sizeof(wb_data->mode));
+	else
+		memcpy(&wb_data->mode, &wb_data->output->config.default_mode, sizeof(wb_data->mode));
+
+	wb_data->plane = igt_output_get_plane_type(wb_data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(wb_data->plane);
+
+	fb_id = igt_create_fb(wb_data->display.drm_fd, wb_data->mode.hdisplay,
+			      wb_data->mode.vdisplay,
+			      get_default_fb_format(&wb_data->display, BPC_8),
+			      DRM_FORMAT_MOD_LINEAR,
+			      &wb_data->input_fb);
+	igt_assert(fb_id >= 0);
+
+	if (data.supported_colors & XRGB2101010 ||
+	    data.supported_colors & XBGR2101010) {
+		fb_id = igt_create_fb(wb_data->display.drm_fd, wb_data->mode.hdisplay,
+				      wb_data->mode.vdisplay,
+				      get_default_fb_format(&wb_data->display, BPC_10),
+				      DRM_FORMAT_MOD_LINEAR,
+				      &wb_data->input_fb_10bit);
+		igt_assert(fb_id >= 0);
+	}
 
-		if (output->use_override_mode)
-			memcpy(&mode, &output->override_mode, sizeof(mode));
-		else
-			memcpy(&mode, &output->config.default_mode, sizeof(mode));
+	igt_plane_set_fb(wb_data->plane, &wb_data->input_fb);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		igt_assert(plane);
+	if (data.list_modes)
+		list_writeback_modes(&wb_data->display);
+	if (data.dump_check)
+		commit_and_dump_fb(&wb_data->display, wb_data->output, wb_data->plane, &wb_data->input_fb, &wb_data->mode);
+}
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      get_default_fb_format(&display, BPC_8),
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb);
-		igt_assert(fb_id >= 0);
+static void do_fini(struct kms_writeback_data_t *wb_data, bool clean)
+{
+	if (clean)
+		cleanup_writeback(&wb_data->display, wb_data->output);
 
-		if (data.supported_colors & XRGB2101010 ||
-		    data.supported_colors & XBGR2101010) {
-			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-					      mode.vdisplay,
-					      get_default_fb_format(&display, BPC_10),
-					      DRM_FORMAT_MOD_LINEAR,
-					      &input_fb_10bit);
-			igt_assert(fb_id >= 0);
-		}
+	igt_remove_fb(wb_data->display.drm_fd, &wb_data->input_fb);
 
-		igt_plane_set_fb(plane, &input_fb);
+	if (data.supported_colors & XRGB2101010 ||
+	    data.supported_colors & XBGR2101010)
+		igt_remove_fb(wb_data->display.drm_fd, &wb_data->input_fb_10bit);
+
+	igt_display_fini(&wb_data->display);
+	drm_close_driver(wb_data->display.drm_fd);
+}
 
-		if (data.list_modes)
-			list_writeback_modes(&display);
-		if (data.dump_check)
-			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
+int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
+{
+	struct kms_writeback_data_t wb_data;
+
+	memset(&wb_data.display, 0, sizeof(wb_data.display));
+
+	igt_fixture() {
+		do_init(&wb_data);
 	}
+
 	/*
 	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
 	 * as we do not want to do CRC validation.
@@ -661,7 +690,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		const char *valid_chars;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		formats_blob = igt_get_writeback_formats_blob(output);
+		formats_blob = igt_get_writeback_formats_blob(wb_data.output);
 		igt_assert_f(formats_blob, "No writeback pixel formats\n");
 		valid_chars = "01234568 ABCGNRUVXY";
 
@@ -683,18 +712,19 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
+		unsigned int fb_id;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
-				      mode.vdisplay / 2,
-				      get_default_fb_format(&display, BPC_8),
+		fb_id = igt_create_fb(wb_data.display.drm_fd, wb_data.mode.hdisplay / 2,
+				      wb_data.mode.vdisplay / 2,
+				      get_default_fb_format(&wb_data.display, BPC_8),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
 
-		test_invalid_parameters(output, &input_fb, &invalid_output_fb);
+		test_invalid_parameters(wb_data.output, &wb_data.input_fb, &invalid_output_fb);
 
-		igt_remove_fb(display.drm_fd, &invalid_output_fb);
+		igt_remove_fb(wb_data.display.drm_fd, &invalid_output_fb);
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
@@ -702,7 +732,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
 			uint32_t test_format = fourcc[i];
 
-			if (is_intel_device(display.drm_fd) &&
+			if (is_intel_device(wb_data.display.drm_fd) &&
 			    (!strstr(igt_format_str(test_format), "BGR")))
 				continue;
 			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
@@ -712,7 +742,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				igt_skip_on_f(!(data.supported_colors & (1 << i)),
 					      "DRM_FORMAT_%s is not supported\n",
 					      igt_format_str(test_format));
-				writeback_fb_id(output, (bpc == 8) ? &input_fb : &input_fb_10bit);
+				writeback_fb_id(wb_data.output, (bpc == 8) ? &wb_data.input_fb : &wb_data.input_fb_10bit);
 			}
 		}
 	}
@@ -722,38 +752,85 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
 			uint32_t test_format = fourcc[i];
 
-			if (is_intel_device(display.drm_fd))
+			if (is_intel_device(wb_data.display.drm_fd))
 				if (!strstr(igt_format_str(test_format), "BGR8888"))
 					continue;
 			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
 				igt_fb_t output_fb;
 				int bpc = igt_drm_format_get_bpc(test_format);
+				unsigned int fb_id;
 
 				igt_skip_on(data.dump_check || data.list_modes);
 				igt_skip_on_f(!(data.supported_colors & (1 << i)),
 					      "DRM_FORMAT_%s is not supported\n",
 					      igt_format_str(test_format));
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-						      get_default_fb_format(&display, bpc),
+				fb_id = igt_create_fb(wb_data.display.drm_fd, wb_data.mode.hdisplay, wb_data.mode.vdisplay,
+						      get_default_fb_format(&wb_data.display, bpc),
 						      igt_fb_mod_to_tiling(0),
 						      &output_fb);
+				igt_require(fb_id > 0);
 
-				writeback_check_output(output, plane, (bpc == 8) ? &input_fb :
-						&input_fb_10bit, &output_fb, test_format);
-				igt_remove_fb(display.drm_fd, &output_fb);
+				writeback_check_output(wb_data.output, wb_data.plane, (bpc == 8) ? &wb_data.input_fb :
+						&wb_data.input_fb_10bit, &output_fb, test_format);
+				igt_remove_fb(wb_data.display.drm_fd, &output_fb);
 			}
 		}
 	}
 
-	igt_fixture() {
-		cleanup_writeback(&display, output);
-		igt_remove_fb(display.drm_fd, &input_fb);
+	igt_describe("Check cleanup");
+	igt_subtest_with_dynamic("writeback-cleanup") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
+
+			if (is_intel_device(wb_data.display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR8888"))
+					continue;
+			igt_dynamic_f("writeback-cleanup-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
+				int bpc = igt_drm_format_get_bpc(test_format);
+				unsigned int fb_id;
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				fb_id = igt_create_fb(wb_data.display.drm_fd, wb_data.mode.hdisplay, wb_data.mode.vdisplay,
+						      get_default_fb_format(&wb_data.display, bpc),
+						      igt_fb_mod_to_tiling(0),
+						      &output_fb);
+				igt_require(fb_id > 0);
+
+				writeback_check_output(wb_data.output, wb_data.plane, (bpc == 8) ? &wb_data.input_fb :
+						&wb_data.input_fb_10bit, &output_fb, test_format);
+				igt_remove_fb(wb_data.display.drm_fd, &output_fb);
 
-		if (data.supported_colors & XRGB2101010 ||
-		    data.supported_colors & XBGR2101010)
-			igt_remove_fb(display.drm_fd, &input_fb_10bit);
+				/* Shut down uncleanly */
+				do_fini(&wb_data, false);
 
-		igt_display_fini(&display);
-		drm_close_driver(display.drm_fd);
+				/* Try to restart */
+				do_init(&wb_data);
+
+				/* And re-test */
+				bpc = igt_drm_format_get_bpc(test_format);
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				fb_id = igt_create_fb(wb_data.display.drm_fd, wb_data.mode.hdisplay, wb_data.mode.vdisplay,
+						      get_default_fb_format(&wb_data.display, bpc),
+						      igt_fb_mod_to_tiling(0),
+						      &output_fb);
+				igt_require(fb_id > 0);
+
+				writeback_check_output(wb_data.output, wb_data.plane, (bpc == 8) ? &wb_data.input_fb :
+						&wb_data.input_fb_10bit, &output_fb, test_format);
+				igt_remove_fb(wb_data.display.drm_fd, &output_fb);
+			}
+		}
+	}
+
+	igt_fixture() {
+		do_fini(&wb_data, true);
 	}
 }
-- 
2.43.0

