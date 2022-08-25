Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167310E1E3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 21:10:47 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 Aug 2022 02:36:11 +0530
Message-Id: <20220825210611.19636-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220825210611.19636-1-nidhi1.gupta@intel.com>
References: <20220825210611.19636-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test Cleanup
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
 tests/kms_writeback.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 2508b1e1..0c6c64b3 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -169,6 +169,7 @@ static void detach_crtc(igt_display_t *display, igt_output_t *output)
 	if (get_writeback_fb_id(output) == 0)
 		return;
 
+	igt_display_fini(&display);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
@@ -580,6 +581,9 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		     "the combination of possible bad options");
 	igt_subtest_with_dynamic("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
+		igt_display_reset(&display);
+		igt_display_commit(&display);
+
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
@@ -597,6 +601,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
 	igt_subtest_with_dynamic("writeback-fb-id") {
 		igt_fb_t output_fb;
+		igt_display_reset(&display);
+		igt_display_commit(&display);
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
@@ -613,6 +619,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_describe("Check writeback output with CRC validation");
 	igt_subtest_with_dynamic("writeback-check-output") {
 		igt_fb_t output_fb;
+		igt_display_reset(&display);
+		igt_display_commit(&display);
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-- 
2.36.0
