Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DF46E7F5
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:25 +0530
Message-Id: <20210512170536.4778-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 03/14] tests/kms_cursor_legacy: Fix mode
 selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

V2:
* Remove MST specific logic (Daniel)
V3:
* Add support for legacy commit (Ankit)
V4:
* Fix commit message (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_cursor_legacy.c | 50 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 4723e1ff9..571ea59cf 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -50,6 +50,27 @@ IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
 
 igt_pipe_crc_t *pipe_crc;
 
+static int try_commit(igt_display_t *display)
+{
+	return (display->is_atomic) ?
+			igt_display_try_commit_atomic(display,
+					DRM_MODE_ATOMIC_TEST_ONLY |
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL) :
+			igt_display_try_commit2(display, COMMIT_LEGACY);
+}
+
+static void override_output_modes(igt_display_t *display,
+				  igt_output_t *output1,
+				  igt_output_t *output2)
+{
+	bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+	igt_require_f(found, "No valid mode combo found.\n");
+
+	igt_output_set_pipe(output1, PIPE_NONE);
+	igt_output_set_pipe(output2, PIPE_NONE);
+}
+
 static void stress(igt_display_t *display,
 		   enum pipe pipe, int num_children, unsigned mode,
 		   int timeout)
@@ -393,6 +414,7 @@ static void flip(igt_display_t *display,
 	struct drm_mode_cursor arg[2];
 	uint64_t *results;
 	struct igt_fb fb_info, fb_info2, argb_fb, cursor_fb, cursor_fb2;
+	igt_output_t *output, *output2;
 
 	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(results != MAP_FAILED);
@@ -406,9 +428,17 @@ static void flip(igt_display_t *display,
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	igt_require(set_fb_on_crtc(display, flip_pipe, &fb_info));
-	if (flip_pipe != cursor_pipe)
-		igt_require(set_fb_on_crtc(display, cursor_pipe, &fb_info2));
+	igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
+	if (flip_pipe != cursor_pipe) {
+		igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
+
+		if (try_commit(display)) {
+			override_output_modes(display, output, output2);
+
+			igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
+			igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
+		}
+	}
 
 	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height, DRM_FORMAT_ARGB8888, 0, .5, .5, .5, &cursor_fb);
 
@@ -879,6 +909,13 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
 	igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
 
+	if (try_commit(display)) {
+		override_output_modes(display, output, output2);
+
+		igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+		igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
+	}
+
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
 	populate_cursor_args(display, pipe, arg1, &cursor_fb);
@@ -1129,6 +1166,13 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
 	igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
 
+	if (try_commit(display)) {
+		override_output_modes(display, outputs[0], outputs[1]);
+
+		igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
+		igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
+	}
+
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 
 	set_cursor_on_pipe(display, pipe[0], &cursor_fb);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
