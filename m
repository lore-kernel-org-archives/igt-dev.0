Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231710E63B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 17:44:18 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 18:43:49 +0100
Message-ID: <20231107174349.60255-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 5/5] drm-uapi/virtgpu: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next commit ("f2cab4b318ee8023f4ad640b906ae268942a7db4")

Cc: Helen Koike <helen.koike@collabora.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/virtgpu_drm.h | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/drm-uapi/virtgpu_drm.h b/include/drm-uapi/virtgpu_drm.h
index b9ec26e9c..b1d0e5656 100644
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
@@ -61,6 +64,17 @@ struct drm_virtgpu_map {
 	__u32 pad;
 };
 
+#define VIRTGPU_EXECBUF_SYNCOBJ_RESET		0x01
+#define VIRTGPU_EXECBUF_SYNCOBJ_FLAGS ( \
+		VIRTGPU_EXECBUF_SYNCOBJ_RESET | \
+		0)
+struct drm_virtgpu_execbuffer_syncobj {
+	__u32 handle;
+	__u32 flags;
+	__u64 point;
+};
+
+/* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag is set. */
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
 	__u32 size;
@@ -68,6 +82,12 @@ struct drm_virtgpu_execbuffer {
 	__u64 bo_handles;
 	__u32 num_bo_handles;
 	__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT) */
+	__u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_IDX) */
+	__u32 syncobj_stride; /* size of @drm_virtgpu_execbuffer_syncobj */
+	__u32 num_in_syncobjs;
+	__u32 num_out_syncobjs;
+	__u64 in_syncobjs;
+	__u64 out_syncobjs;
 };
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
@@ -75,6 +95,8 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
+#define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
+#define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -173,6 +195,29 @@ struct drm_virtgpu_resource_create_blob {
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
 
@@ -212,6 +257,10 @@ struct drm_virtgpu_resource_create_blob {
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
