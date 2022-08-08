Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91D11A43C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 20:39:30 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 8 Aug 2022 13:39:09 -0700
Message-ID: <20220808203909.403-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Fix build warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix the following build warnings for kms_writeback:

$ ninja -C build
ninja: Entering directory `build'
[120/1183] Compiling C object tests/kms_writeback.p/kms_writeback.c.o
../tests/kms_writeback.c: In function ‘__igt_unique____real_main480’:
../tests/kms_writeback.c:532:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  532 |                 drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
      |                 ^~~~~~~~~~~~~~~~~~~~~~
../tests/kms_writeback.c:555:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  555 |                 igt_fb_t invalid_output_fb;
      |                 ^~~~~~~~
../tests/kms_writeback.c:571:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  571 |                 igt_fb_t output_fb;
      |                 ^~~~~~~~
../tests/kms_writeback.c:586:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  86 |                 igt_fb_t output_fb;
     |                 ^~~~~~~~

Reported-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 82c244ffaa01..9d13458577b6 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -528,11 +528,14 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	 */
 	igt_describe("Check the writeback format");
 	igt_subtest("writeback-pixel-formats") {
-		igt_skip_on(data.dump_check || data.list_modes);
-		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
-		const char *valid_chars = "01234568 ABCGNRUVXY";
 		unsigned int i;
 		char *c;
+		drmModePropertyBlobRes *formats_blob;
+		const char *valid_chars;
+
+		igt_skip_on(data.dump_check || data.list_modes);
+		formats_blob = get_writeback_formats_blob(output);
+		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
 		 * We don't have a comprehensive list of formats, so just check
@@ -551,8 +554,9 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		     "(output framebuffer and fence); this test goes through"
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
-		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t invalid_output_fb;
+
+		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
 				      DRM_FORMAT_XRGB8888,
@@ -567,8 +571,9 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
 	igt_subtest("writeback-fb-id") {
-		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t output_fb;
+
+		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
@@ -582,8 +587,9 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Check writeback output with CRC validation");
 	igt_subtest("writeback-check-output") {
-		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t output_fb;
+
+		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
-- 
2.31.0
