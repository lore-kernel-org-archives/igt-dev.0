Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1510E4C1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:07:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:28:17 +0530
Message-Id: <20231006075819.3055887-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/4] lib/igt_kms: Expose helper to convert
 rotation to string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Expose helper to convert rotation to string.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 20 +++++++++++++-------
 lib/igt_kms.h |  1 +
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c2f3728a6..ec4cd78cd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4902,17 +4902,23 @@ void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_H, IGT_FIXED(h, 0));
 }
 
-static const char *rotation_name(igt_rotation_t rotation)
+/**
+ * igt_plane_rotation_name:
+ * @rotation: Plane rotation value (0, 90, 180, 270)
+ *
+ * Returns: Plane rotation value as a string
+ */
+const char *igt_plane_rotation_name(igt_rotation_t rotation)
 {
 	switch (rotation & IGT_ROTATION_MASK) {
 	case IGT_ROTATION_0:
-		return "0°";
+		return "0";
 	case IGT_ROTATION_90:
-		return "90°";
+		return "90";
 	case IGT_ROTATION_180:
-		return "180°";
+		return "180";
 	case IGT_ROTATION_270:
-		return "270°";
+		return "270";
 	default:
 		igt_assert(0);
 	}
@@ -4932,9 +4938,9 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 	igt_pipe_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
-	LOG(display, "%s.%d: plane_set_rotation(%s)\n",
+	LOG(display, "%s.%d: plane_set_rotation(%s°)\n",
 	    kmstest_pipe_name(pipe->pipe),
-	    plane->index, rotation_name(rotation));
+	    plane->index, igt_plane_rotation_name(rotation));
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, rotation);
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f2c3741fc..4bcaf3f73 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -536,6 +536,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
 {
 	return (plane->rotations & rotation) == rotation;
 }
+const char *igt_plane_rotation_name(igt_rotation_t rotation);
 
 void igt_wait_for_vblank(int drm_fd, int crtc_offset);
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
-- 
2.40.0
