Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13C10E066
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 11:12:46 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 13:12:28 +0200
Message-Id: <20230802111229.105472-2-aesteve@redhat.com>
In-Reply-To: <20230802111229.105472-1-aesteve@redhat.com>
References: <20230802111229.105472-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 1/2] igt_kms: add hotspot plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
capability definition until patched drm.h uapi header
is upstreamed and lands on IGT.

CURSOR_PLANE_HOTSPOT capability is enabled
conditionally, and then tracked in the igt_display
struct.

Add HOTSPOT_X and HOTSPOT_Y properties
to the atomic_plane_properties struct.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_kms.c | 10 ++++++++++
 lib/igt_kms.h |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f2b0eed57..e0959ccff 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -601,6 +601,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_CRTC_Y] = "CRTC_Y",
 	[IGT_PLANE_CRTC_W] = "CRTC_W",
 	[IGT_PLANE_CRTC_H] = "CRTC_H",
+	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
+	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
 	[IGT_PLANE_FB_ID] = "FB_ID",
 	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
 	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
@@ -2296,6 +2298,11 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
 		igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER, "Default");
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X))
+		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_X, 0);
+	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
+		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -2680,6 +2687,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
 
+	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
+		display->has_virt_cursor_plane = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1b6988c17..91355c910 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -41,6 +41,12 @@
 
 /* Low-level helpers with kmstest_ prefix */
 
+/**
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ */
+#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
+
 /**
  * pipe:
  * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a pipe.
@@ -318,6 +324,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
        IGT_PLANE_SCALING_FILTER,
+       IGT_PLANE_HOTSPOT_X,
+       IGT_PLANE_HOTSPOT_Y,
        IGT_NUM_PLANE_PROPS
 };
 
@@ -448,6 +456,7 @@ struct igt_display {
 	igt_pipe_t *pipes;
 	bool has_cursor_plane;
 	bool is_atomic;
+	bool has_virt_cursor_plane;
 	bool first_commit;
 
 	uint64_t *modifiers;
-- 
2.40.0
