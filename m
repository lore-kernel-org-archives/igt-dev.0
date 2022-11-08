Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE3C10E53A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 23:57:53 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 20:57:19 -0300
Message-Id: <20221108235724.126287-2-mcanal@igalia.com>
In-Reply-To: <20221108235724.126287-1-mcanal@igalia.com>
References: <20221108235724.126287-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] include/drm-uapi: Update to the latest
 v3d_drm.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update to the latest master version of the DRM UAPI header file from
git://anongit.freedesktop.org/drm/drm-misc:
    a108772d03d8 Merge drm/drm-next into drm-misc-next

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/drm-uapi/v3d_drm.h | 78 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/include/drm-uapi/v3d_drm.h b/include/drm-uapi/v3d_drm.h
index 4104f22f..3dfc0af8 100644
--- a/include/drm-uapi/v3d_drm.h
+++ b/include/drm-uapi/v3d_drm.h
@@ -58,6 +58,67 @@ extern "C" {
 						   struct drm_v3d_perfmon_get_values)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
+#define DRM_V3D_SUBMIT_EXTENSION		  0x02
+
+/* struct drm_v3d_extension - ioctl extensions
+ *
+ * Linked-list of generic extensions where the id identify which struct is
+ * pointed by ext_data. Therefore, DRM_V3D_EXT_ID_* is used on id to identify
+ * the extension type.
+ */
+struct drm_v3d_extension {
+	__u64 next;
+	__u32 id;
+#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
+	__u32 flags; /* mbz */
+};
+
+/* struct drm_v3d_sem - wait/signal semaphore
+ *
+ * If binary semaphore, it only takes syncobj handle and ignores flags and
+ * point fields. Point is defined for timeline syncobj feature.
+ */
+struct drm_v3d_sem {
+	__u32 handle; /* syncobj */
+	/* rsv below, for future uses */
+	__u32 flags;
+	__u64 point;  /* for timeline sem support */
+	__u64 mbz[2]; /* must be zero, rsv */
+};
+
+/* Enum for each of the V3D queues. */
+enum v3d_queue {
+	V3D_BIN,
+	V3D_RENDER,
+	V3D_TFU,
+	V3D_CSD,
+	V3D_CACHE_CLEAN,
+};
+
+/**
+ * struct drm_v3d_multi_sync - ioctl extension to add support multiples
+ * syncobjs for commands submission.
+ *
+ * When an extension of DRM_V3D_EXT_ID_MULTI_SYNC id is defined, it points to
+ * this extension to define wait and signal dependencies, instead of single
+ * in/out sync entries on submitting commands. The field flags is used to
+ * determine the stage to set wait dependencies.
+ */
+struct drm_v3d_multi_sync {
+	struct drm_v3d_extension base;
+	/* Array of wait and signal semaphores */
+	__u64 in_syncs;
+	__u64 out_syncs;
+
+	/* Number of entries */
+	__u32 in_sync_count;
+	__u32 out_sync_count;
+
+	/* set the stage (v3d_queue) to sync */
+	__u32 wait_stage;
+
+	__u32 pad; /* mbz */
+};
 
 /**
  * struct drm_v3d_submit_cl - ioctl argument for submitting commands to the 3D
@@ -135,12 +196,16 @@ struct drm_v3d_submit_cl {
 	/* Number of BO handles passed in (size is that times 4). */
 	__u32 bo_handle_count;
 
+	/* DRM_V3D_SUBMIT_* properties */
 	__u32 flags;
 
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
 
 	__u32 pad;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
 };
 
 /**
@@ -210,6 +275,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CSD,
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
+	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 };
 
 struct drm_v3d_get_param {
@@ -248,6 +314,11 @@ struct drm_v3d_submit_tfu {
 	__u32 in_sync;
 	/* Sync object to signal when the TFU job is done. */
 	__u32 out_sync;
+
+	__u32 flags;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
 };
 
 /* Submits a compute shader for dispatch.  This job will block on any
@@ -276,6 +347,13 @@ struct drm_v3d_submit_csd {
 
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+
+	__u32 flags;
+
+	__u32 pad;
 };
 
 enum {
-- 
2.38.1
