Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3B6E96B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 22:19:35 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 18 Aug 2021 15:24:16 -0700
Message-Id: <20210818222419.210879-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/4] tests/kms_cursor_legacy: Handle
 cursor movements as slow patch for display 9+
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
Cc: Petri Latvala <petri.latvala@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

i915 is dropping frontbuffer rendering support for display 9+ so
this evasion attempts will never happen as DRM_IOCTL_MODE_CURSOR will
be converted to atomic commits that will be executed during vblanks.

v2:
- Not using data filed by fixture to generate subtest list (Petri)

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/kms_cursor_legacy.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 0f0df951b..3ddea9c35 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -303,8 +303,13 @@ enum flip_test {
 	flip_test_last = flip_test_atomic_transitions_varying_size
 };
 
-static bool cursor_slowpath(enum flip_test mode)
+static bool cursor_slowpath(igt_display_t *display, enum flip_test mode)
 {
+	/* Intel display 9 and newer will handle cursor movement as fastsets */
+	if (is_i915_device(display->drm_fd) &&
+	    intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 9)
+	    return true;
+
 	/* cursor moving doesn't take slowpath, everything else does. */
 	if (mode == flip_test_legacy || mode == flip_test_atomic)
 		return false;
@@ -600,7 +605,7 @@ static void basic_flip_cursor(igt_display_t *display,
 
 		if (miss)
 			{ /* compare nothing, already failed */ }
-		else if (!cursor_slowpath(mode))
+		else if (!cursor_slowpath(display, mode))
 			miss = delta != 0;
 		else
 			miss = delta != 0 && delta != 1;
@@ -753,7 +758,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Nor should it have delayed the following cursor update */
-		if (!cursor_slowpath(mode))
+		if (!cursor_slowpath(display, mode))
 			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
 		else
 			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
@@ -1119,7 +1124,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 			vblank_last = vbl.sequence;
 		}
 
-		if (!cursor_slowpath(mode))
+		if (!cursor_slowpath(display, mode))
 			igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
 
 		shared[0] = 1;
@@ -1558,12 +1563,11 @@ igt_main
 		igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
 			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
 
-		if (!cursor_slowpath(i)) {
-			igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
-				igt_require_gem(display.drm_fd);
-				basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
-						  BASIC_BUSY);
-			}
+		igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
+			igt_require(!cursor_slowpath(&display, i));
+			igt_require_gem(display.drm_fd);
+			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
+					  BASIC_BUSY);
 		}
 	}
 
-- 
2.32.0
