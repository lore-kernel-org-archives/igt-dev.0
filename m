Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9310E6AE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 14:10:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 19:36:01 +0530
Message-Id: <20220906140601.23551-1-nidhi1.gupta@intel.com>
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
---
 tests/i915/kms_busy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2a..6bb9dbec 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -144,6 +144,8 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
 	igt_output_t *output;
 	int timeout;
 
+	igt_display_reset(dpy);
+
 	if (modeset)
 		igt_require(dpy->is_atomic);
 
@@ -230,6 +232,7 @@ static void test_hang(igt_display_t *dpy,
 	igt_output_t *output;
 	igt_plane_t *primary;
 
+	igt_display_reset(dpy);
 	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
 	igt_display_commit2(dpy, COMMIT_ATOMIC);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -274,6 +277,8 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_spin_t *t;
 	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 
+	igt_display_reset(dpy);
+	
 	output = set_fb_on_crtc(dpy, pipe, &fb);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-- 
2.36.0
