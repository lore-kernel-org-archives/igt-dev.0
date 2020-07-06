Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780F96E2E6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 04:40:45 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon,  6 Jul 2020 10:10:37 +0530
Message-Id: <20200706044038.8203-11-mohammed.khajapasha@intel.com>
In-Reply-To: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
References: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/11] lib/kms: Convert pipe id flags for a
 vblank using crtc offset
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In i915 with non-contiguous pipes display, pipes always not same
as crtc index in display pipes array. Hence reading pipe id flags
for a vblank event using crtc offset.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 31 ++++++++++++++++++-------------
 lib/igt_kms.h |  7 ++++---
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b4029757..91c54002 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1984,6 +1984,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 		pipe->enabled = true;
 		pipe->crtc_id = resources->crtcs[i];
+		pipe->crtc_offset = i;
 	}
 
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -4137,13 +4138,13 @@ void igt_pipe_request_out_fence(igt_pipe_t *pipe)
  *
  * Waits for a given number of vertical blank intervals
  */
-void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
+void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
 {
 	drmVBlank wait_vbl;
 	uint32_t pipe_id_flag;
 
 	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe_id_flag = kmstest_get_vbl_flag(pipe);
+	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
 
 	wait_vbl.request.type = DRM_VBLANK_RELATIVE;
 	wait_vbl.request.type |= pipe_id_flag;
@@ -4159,9 +4160,9 @@ void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
  *
  * Waits for 1 vertical blank intervals
  */
-void igt_wait_for_vblank(int drm_fd, enum pipe pipe)
+void igt_wait_for_vblank(int drm_fd, int crtc_offset)
 {
-	igt_wait_for_vblank_count(drm_fd, pipe, 1);
+	igt_wait_for_vblank_count(drm_fd, crtc_offset, 1);
 }
 
 /**
@@ -4384,22 +4385,26 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
 
 /**
  * kmstest_get_vbl_flag:
- * @pipe_id: Pipe to convert to flag representation.
+ * @crtc_offset: CRTC offset to convert to pipe flag representation.
  *
- * Convert a pipe id into the flag representation
+ * Convert a crtc offset into the pipe flag representation
  * expected in DRM while processing DRM_IOCTL_WAIT_VBLANK.
  */
-uint32_t kmstest_get_vbl_flag(uint32_t pipe_id)
+uint32_t kmstest_get_vbl_flag(int crtc_offset)
 {
-	if (pipe_id == 0)
-		return 0;
-	else if (pipe_id == 1)
-		return _DRM_VBLANK_SECONDARY;
+	uint32_t pipe_id;
+
+	if (crtc_offset == 0)
+		pipe_id = 0;
+	else if (crtc_offset == 1)
+		pipe_id = _DRM_VBLANK_SECONDARY;
 	else {
-		uint32_t pipe_flag = pipe_id << 1;
+		uint32_t pipe_flag = crtc_offset << 1;
 		igt_assert(!(pipe_flag & ~DRM_VBLANK_HIGH_CRTC_MASK));
-		return pipe_flag;
+		pipe_id = pipe_flag;
 	}
+
+	return pipe_id;
 }
 
 static inline const uint32_t *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 36b15147..2a2eb0e4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -353,6 +353,7 @@ struct igt_pipe {
 	uint64_t values[IGT_NUM_CRTC_PROPS];
 
 	uint32_t crtc_id;
+	uint32_t crtc_offset;
 
 	int32_t out_fence_fd;
 };
@@ -447,8 +448,8 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t w, uint32_t h);
 
-void igt_wait_for_vblank(int drm_fd, enum pipe pipe);
-void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count);
+void igt_wait_for_vblank(int drm_fd, int crtc_offset);
+void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
 
 static inline bool igt_output_is_connected(igt_output_t *output)
 {
@@ -768,7 +769,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
 
-uint32_t kmstest_get_vbl_flag(uint32_t pipe_id);
+uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
 const struct edid *igt_kms_get_base_edid(void);
 const struct edid *igt_kms_get_alt_edid(void);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
