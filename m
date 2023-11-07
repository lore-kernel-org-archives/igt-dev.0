Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C510E635
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 17:44:02 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 18:43:45 +0100
Message-ID: <20231107174349.60255-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 1/5] include/drm-uapi: sync core headers
 with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next commit ("f2cab4b318ee8023f4ad640b906ae268942a7db4")

These are documentation updates and two additional formats in
drm_fourcc.h

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/drm.h        | 20 ++++++++++++++++++++
 include/drm-uapi/drm_fourcc.h |  2 ++
 include/drm-uapi/drm_mode.h   | 16 ++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248d..05e996df5 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -1128,6 +1128,26 @@ extern "C" {
 #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_page_flip)
 #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_cmd)
 
+/**
+ * DRM_IOCTL_MODE_CREATE_DUMB - Create a new dumb buffer object.
+ *
+ * KMS dumb buffers provide a very primitive way to allocate a buffer object
+ * suitable for scanout and map it for software rendering. KMS dumb buffers are
+ * not suitable for hardware-accelerated rendering nor video decoding. KMS dumb
+ * buffers are not suitable to be displayed on any other device than the KMS
+ * device where they were allocated from. Also see
+ * :ref:`kms_dumb_buffer_objects`.
+ *
+ * The IOCTL argument is a struct drm_mode_create_dumb.
+ *
+ * User-space is expected to create a KMS dumb buffer via this IOCTL, then add
+ * it as a KMS framebuffer via &DRM_IOCTL_MODE_ADDFB and map it via
+ * &DRM_IOCTL_MODE_MAP_DUMB.
+ *
+ * &DRM_CAP_DUMB_BUFFER indicates whether this IOCTL is supported.
+ * &DRM_CAP_DUMB_PREFERRED_DEPTH and &DRM_CAP_DUMB_PREFER_SHADOW indicate
+ * driver preferences for dumb buffers.
+ */
 #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create_dumb)
 #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_dumb)
 #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_destroy_dumb)
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 6b6235f7a..9b2504802 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -323,6 +323,8 @@ extern "C" {
  * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
  */
 #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV30		fourcc_code('N', 'V', '3', '0') /* non-subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index ea1b639bc..128d09138 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -1032,13 +1032,25 @@ struct drm_mode_crtc_page_flip_target {
 	__u64 user_data;
 };
 
-/* create a dumb scanout buffer */
+/**
+ * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
+ * @height: buffer height in pixels
+ * @width: buffer width in pixels
+ * @bpp: bits per pixel
+ * @flags: must be zero
+ * @handle: buffer object handle
+ * @pitch: number of bytes between two consecutive lines
+ * @size: size of the whole buffer in bytes
+ *
+ * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
+ * the kernel fills @handle, @pitch and @size.
+ */
 struct drm_mode_create_dumb {
 	__u32 height;
 	__u32 width;
 	__u32 bpp;
 	__u32 flags;
-	/* handle, pitch, size will be returned */
+
 	__u32 handle;
 	__u32 pitch;
 	__u64 size;
-- 
2.42.0
