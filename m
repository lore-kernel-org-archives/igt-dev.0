Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBF410EB09
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 03:33:21 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 08:57:49 +0530
Message-Id: <20220930032749.2574-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_busy: Test cleanup
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
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_busy.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2a..d7e79265 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -144,8 +144,7 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
 	igt_output_t *output;
 	int timeout;
 
-	if (modeset)
-		igt_require(dpy->is_atomic);
+	igt_display_reset(dpy);
 
 	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
 	igt_display_commit2(dpy, COMMIT_LEGACY);
@@ -230,6 +229,7 @@ static void test_hang(igt_display_t *dpy,
 	igt_output_t *output;
 	igt_plane_t *primary;
 
+	igt_display_reset(dpy);
 	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
 	igt_display_commit2(dpy, COMMIT_ATOMIC);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -274,6 +274,8 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_spin_t *t;
 	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 
+	igt_display_reset(dpy);
+	
 	output = set_fb_on_crtc(dpy, pipe, &fb);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -352,6 +354,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_pipe(&display, pipe)
 			active_pipes[last_pipe++] = pipe;
 		last_pipe--;
+
+		igt_require(display.is_atomic);
 	}
 
 	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
@@ -363,8 +367,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_pipe(&display, pipe) {
 			igt_dynamic("flip")
 				test_flip(&display, pipe, false);
-			igt_dynamic("modeset")
-				test_flip(&display, pipe, true);
+			if(display.is_atomic) {
+				igt_dynamic("modeset")
+					test_flip(&display, pipe, true);
+			}
 			break;
 		}
 	}
@@ -411,7 +417,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			igt_hang_t hang;
 			errno = 0;
 
-			igt_require(display.is_atomic);
 			hang = igt_allow_hang(display.drm_fd, 0, 0);
 
 			for_each_pipe(&display, pipe) {
-- 
2.36.0
