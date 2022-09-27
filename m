Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3B10E87C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 01:23:01 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 06:47:46 +0530
Message-Id: <20220927011747.18882-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220927011747.18882-1-nidhi1.gupta@intel.com>
References: <20220927011747.18882-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/kms_writeback: Test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_writeback.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9d134585..708fa5cd 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -494,10 +494,12 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&display, display.drm_fd);
+		igt_display_reset(display);
 
 		igt_require(display.is_atomic);
 
+		igt_skip_on(data.dump_check || data.list_modes);
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 
@@ -533,7 +535,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		drmModePropertyBlobRes *formats_blob;
 		const char *valid_chars;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		formats_blob = get_writeback_formats_blob(output);
 		valid_chars = "01234568 ABCGNRUVXY";
 
@@ -556,7 +557,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
 				      DRM_FORMAT_XRGB8888,
@@ -573,7 +573,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-fb-id") {
 		igt_fb_t output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
@@ -589,7 +588,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-check-output") {
 		igt_fb_t output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
-- 
2.36.0
