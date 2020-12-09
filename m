Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE6D6EA04
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 13:27:48 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Wed,  9 Dec 2020 19:06:25 +0530
Message-Id: <20201209133626.26224-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition:reduce
 execution time
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

kms_atomic_transition test is taking minimum of
69.5s time to execute on CI. To reduce the execution
time this patch will add the change which will run
the test on 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane
and skip the rest of the planes.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..856378e6 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -205,6 +205,33 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
+static bool skip_plane(igt_display_t *display, igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (!is_i915_device(display->drm_fd))
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		return false;
+
+	if (intel_gen(intel_get_drm_devid(display->drm_fd)) < 11)
+		return false;
+
+	/*
+	 * Test 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane.
+	 *
+	 * Kernel registers planes in the hardware Z order:
+	 * 0,1,2 HDR planes
+	 * 3,4 SDR UV planes
+	 * 5,6 SDR Y planes
+	 */
+	return index != 0 && index != 3 && index != 5;
+}
+
 static void setup_parms(igt_display_t *display, enum pipe pipe,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
@@ -230,8 +257,12 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 		cursor_height = mode->vdisplay;
 
 	for_each_plane_on_pipe(display, pipe, plane) {
+
 		int i = plane->index;
 
+		if (skip_plane(display, plane))
+			continue;
+
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
 			parms[i].fb = primary_fb;
 			parms[i].width = mode->hdisplay;
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
