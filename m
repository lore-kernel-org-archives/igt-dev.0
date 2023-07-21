Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57610E199
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 13:05:12 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jul 2023 15:04:56 +0200
Message-Id: <20230721130458.64856-2-aesteve@redhat.com>
In-Reply-To: <20230721130458.64856-1-aesteve@redhat.com>
References: <20230721130458.64856-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [igt-dev] [PATCH 1/3] drm header update: temp commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, Albert Esteve <aesteve@redhat.com>, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update the drm included header to obtain
VIRTUAL_CURSOR_PLANE capability and be
able to test cursor hotspot setting.

This commit should be removed once the kernel
patch is applied and update the headers
as appropiate.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 include/drm-uapi/drm.h | 54 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4..57b261a45 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -35,7 +35,13 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
-#if   defined(__linux__)
+#if defined(__KERNEL__)
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+typedef unsigned int drm_handle_t;
+
+#elif defined(__linux__)
 
 #include <linux/types.h>
 #include <asm/ioctl.h>
@@ -830,6 +836,32 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
+ *
+ * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio and
+ * virtualbox) have additional restrictions for cursor planes (thus
+ * making cursor planes on those drivers not truly universal,) e.g.
+ * they need cursor planes to act like one would expect from a mouse
+ * cursor and have correctly set hotspot properties.
+ * If this client cap is not set the DRM core will hide cursor plane on
+ * those virtualized drivers because not setting it implies that the
+ * client is not capable of dealing with those extra restictions.
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * Setting this property on drivers which do not special case
+ * cursor planes (i.e. non-virtualized drivers) will return
+ * EOPNOTSUPP, which can be used by userspace to gauge
+ * requirements of the hardware/drivers they're running on.
+ *
+ * This capability is always supported for atomic-capable virtualized
+ * drivers starting from kernel version 6.6.
+ */
+#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
+
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
@@ -1090,6 +1122,24 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+/**
+ * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
+ *
+ * This queries metadata about a framebuffer. User-space fills
+ * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of the
+ * struct as the output.
+ *
+ * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.handles
+ * will be filled with GEM buffer handles. Planes are valid until one has a
+ * zero handle -- this can be used to compute the number of planes.
+ *
+ * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are valid
+ * until one has a zero &drm_mode_fb_cmd2.pitches.
+ *
+ * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will be set
+ * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will contain the
+ * modifier. Otherwise, user-space must ignore &drm_mode_fb_cmd2.modifier.
+ */
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
 /*
@@ -1144,6 +1194,7 @@ struct drm_event_crtc_sequence {
 };
 
 /* typedef area */
+#ifndef __KERNEL__
 typedef struct drm_clip_rect drm_clip_rect_t;
 typedef struct drm_drawable_info drm_drawable_info_t;
 typedef struct drm_tex_region drm_tex_region_t;
@@ -1185,6 +1236,7 @@ typedef struct drm_agp_binding drm_agp_binding_t;
 typedef struct drm_agp_info drm_agp_info_t;
 typedef struct drm_scatter_gather drm_scatter_gather_t;
 typedef struct drm_set_version drm_set_version_t;
+#endif
 
 #if defined(__cplusplus)
 }
-- 
2.40.0
