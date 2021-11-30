Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6C6ECAA
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 07:38:39 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 Nov 2021 09:38:02 +0200
Message-Id: <20211130073803.46388-3-jouni.hogander@intel.com>
In-Reply-To: <20211130073803.46388-1-jouni.hogander@intel.com>
References: <20211130073803.46388-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_psr2_su: add biplanar
 selective update tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add biplanar formats (NV12, p010) into selective update test.

v2: Add back skipping of frontbuffer rendering tests
v3: Use hyphen instead of underscore in testnames
v4: Split offset change to own patch

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_su.c | 72 ++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 16301031..d79a1e58 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -51,6 +51,23 @@ enum operations {
 	LAST
 };
 
+static const uint32_t formats_page_flip[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_INVALID,
+};
+
+static const uint32_t formats_frontbuffer[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_INVALID,
+};
+
+static const uint32_t *formats[] = {
+				    [PAGE_FLIP] = formats_page_flip,
+				    [FRONTBUFFER] = formats_frontbuffer,
+};
+
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -69,6 +86,7 @@ typedef struct {
 	igt_output_t *output;
 	struct igt_fb fb[2];
 	enum operations op;
+	uint32_t format;
 	cairo_t *cr;
 	int change_screen_timerfd;
 	uint32_t screen_changes;
@@ -112,7 +130,7 @@ static void prepare(data_t *data)
 	/* all green frame */
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
+			    data->format,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb[0]);
@@ -122,7 +140,7 @@ static void prepare(data_t *data)
 
 		igt_create_color_fb(data->drm_fd,
 				    data->mode->hdisplay, data->mode->vdisplay,
-				    DRM_FORMAT_XRGB8888,
+				    data->format,
 				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 1.0, 0.0,
 				    &data->fb[1]);
@@ -264,6 +282,7 @@ igt_main
 					 data.debugfs_fd, PSR_MODE_2),
 			      "Error enabling PSR2\n");
 		data.op = FRONTBUFFER;
+		data.format = DRM_FORMAT_XRGB8888;
 		prepare(&data);
 		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
 		cleanup(&data);
@@ -284,31 +303,34 @@ igt_main
 	}
 
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
-		igt_describe("Test that selective update works when screen changes");
-		igt_subtest_f("%s", op_str(data.op)) {
-
-			if (data.op == FRONTBUFFER &&
-			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
-				/*
-				 * FIXME: Display 12+ platforms now have PSR2
-				 * selective fetch enabled by default but we
-				 * still can't properly handle frontbuffer
-				 * rendering, so right it does full frame
-				 * fetches at every frontbuffer rendering.
-				 * So it is expected that this test will fail
-				 * in display 12+ platform fow now.
-				 */
-				igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+		const uint32_t *format = formats[data.op];
+
+		while (*format != DRM_FORMAT_INVALID) {
+			data.format = *format++;
+			igt_describe("Test that selective update works when screen changes");
+			igt_subtest_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
+				if (data.op == FRONTBUFFER &&
+				    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+					/*
+					 * FIXME: Display 12+ platforms now have PSR2
+					 * selective fetch enabled by default but we
+					 * still can't properly handle frontbuffer
+					 * rendering, so right it does full frame
+					 * fetches at every frontbuffer rendering.
+					 * So it is expected that this test will fail
+					 * in display 12+ platform for now.
+					 */
+					igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+				}
+				prepare(&data);
+				run(&data);
+				cleanup(&data);
 			}
-
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
 		}
-	}
 
-	igt_fixture {
-		close(data.debugfs_fd);
-		display_fini(&data);
+		igt_fixture {
+			close(data.debugfs_fd);
+			display_fini(&data);
+		}
 	}
 }
-- 
2.25.1
