Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Juston Li <juston.li@intel.com>
Date: Mon, 16 Dec 2019 19:48:37 -0800
Message-Id: <20191217034836.3936-1-juston.li@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 i-g-t 1/2] NOMERGE: Import drm.h up to
 54ecb8f7028c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Depends on ummerged kernel code for getfb2

Rest of drm.h taken from:
commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Sep 30 10:35:40 2019 -0700

    Linux 5.4-rc1

Signed-off-by: Juston Li <juston.li@intel.com>
---
 include/drm-uapi/drm.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 85c685a2075e..0b02f4c92d1e 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -643,6 +643,7 @@ struct drm_gem_open {
 #define DRM_CAP_PAGE_FLIP_TARGET	0x11
 #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
 #define DRM_CAP_SYNCOBJ		0x13
+#define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
 /** DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
@@ -729,8 +730,18 @@ struct drm_syncobj_handle {
 	__u32 pad;
 };
 
+struct drm_syncobj_transfer {
+	__u32 src_handle;
+	__u32 dst_handle;
+	__u64 src_point;
+	__u64 dst_point;
+	__u32 flags;
+	__u32 pad;
+};
+
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
+#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
@@ -741,12 +752,33 @@ struct drm_syncobj_wait {
 	__u32 pad;
 };
 
+struct drm_syncobj_timeline_wait {
+	__u64 handles;
+	/* wait on specific timeline point for every handles*/
+	__u64 points;
+	/* absolute timeout */
+	__s64 timeout_nsec;
+	__u32 count_handles;
+	__u32 flags;
+	__u32 first_signaled; /* only valid when not waiting all */
+	__u32 pad;
+};
+
+
 struct drm_syncobj_array {
 	__u64 handles;
 	__u32 count_handles;
 	__u32 pad;
 };
 
+struct drm_syncobj_timeline_array {
+	__u64 handles;
+	__u64 points;
+	__u32 count_handles;
+	__u32 pad;
+};
+
+
 /* Query current scanout sequence number */
 struct drm_crtc_get_sequence {
 	__u32 crtc_id;		/* requested crtc_id */
@@ -903,6 +935,13 @@ extern "C" {
 #define DRM_IOCTL_MODE_GET_LEASE	DRM_IOWR(0xC8, struct drm_mode_get_lease)
 #define DRM_IOCTL_MODE_REVOKE_LEASE	DRM_IOWR(0xC9, struct drm_mode_revoke_lease)
 
+#define DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT	DRM_IOWR(0xCA, struct drm_syncobj_timeline_wait)
+#define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
+#define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
+#define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
+
+#define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+
 /**
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.21.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
