Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11310E7A1
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 10:09:40 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 12:09:01 +0200
Message-ID: <20231026100909.13317-7-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
References: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/6] drm-uapi/virtgpu: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Sync virtgpu drm-uapi header with drm-next commit ("52920704df878050123dfeb469aa6ab8022547c1")

v1: split virtgpu and vmwgfx to separate patch (Kamil)
v2: correct spelling in commit description, split virtgpu
  into separate patch, added new e-mails to Cc (Kamil)

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>
---
 include/drm-uapi/virtgpu_drm.h | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/drm-uapi/virtgpu_drm.h b/include/drm-uapi/virtgpu_drm.h
index b9ec26e9c..7b158fcb0 100644
--- a/include/drm-uapi/virtgpu_drm.h
+++ b/include/drm-uapi/virtgpu_drm.h
@@ -47,12 +47,15 @@ extern "C" {
 #define DRM_VIRTGPU_WAIT     0x08
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
+#define DRM_VIRTGPU_CONTEXT_INIT 0x0b
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
+#define VIRTGPU_EXECBUF_RING_IDX	0x04
 #define VIRTGPU_EXECBUF_FLAGS  (\
 		VIRTGPU_EXECBUF_FENCE_FD_IN |\
 		VIRTGPU_EXECBUF_FENCE_FD_OUT |\
+		VIRTGPU_EXECBUF_RING_IDX |\
 		0)
 
 struct drm_virtgpu_map {
@@ -61,6 +64,7 @@ struct drm_virtgpu_map {
 	__u32 pad;
 };
 
+/* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag is set. */
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
 	__u32 size;
@@ -68,6 +72,8 @@ struct drm_virtgpu_execbuffer {
 	__u64 bo_handles;
 	__u32 num_bo_handles;
 	__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT) */
+	__u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_IDX) */
+	__u32 pad;
 };
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
@@ -75,6 +81,8 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
+#define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
+#define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -173,6 +181,29 @@ struct drm_virtgpu_resource_create_blob {
 	__u64 blob_id;
 };
 
+#define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
+#define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
+#define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+struct drm_virtgpu_context_set_param {
+	__u64 param;
+	__u64 value;
+};
+
+struct drm_virtgpu_context_init {
+	__u32 num_params;
+	__u32 pad;
+
+	/* pointer to drm_virtgpu_context_set_param array */
+	__u64 ctx_set_params;
+};
+
+/*
+ * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
+ * effect.  The event size is sizeof(drm_event), since there is no additional
+ * payload.
+ */
+#define VIRTGPU_EVENT_FENCE_SIGNALED 0x90000000
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -212,6 +243,10 @@ struct drm_virtgpu_resource_create_blob {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_CREATE_BLOB,	\
 		struct drm_virtgpu_resource_create_blob)
 
+#define DRM_IOCTL_VIRTGPU_CONTEXT_INIT					\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
+		struct drm_virtgpu_context_init)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.42.0
