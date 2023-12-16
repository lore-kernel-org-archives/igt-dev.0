Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 15 Dec 2023 16:40:22 -0800
Subject: [PATCH i-g-t 2/4] lib: Add support for solid_fill and pixel_source
 plane properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231215-solid-fill-v1-2-12932f9f452d@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
In-Reply-To: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20231216004022.o7Rsa8HW2KaSZnYHXTOjJqu6Gmj5nASGVwydyIMr3f0@z>

Add corresponding IGT macros for solid_fill and pixel_source DRM
properties, and change IGT commit behavior to allow for NULL FB commits.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 37 ++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  4 ++++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a604dc..6a339766ca31 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -669,6 +669,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
 	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
 	[IGT_PLANE_FB_ID] = "FB_ID",
+	[IGT_PLANE_SOLID_FILL] = "solid_fill",
+	[IGT_PLANE_PIXEL_SOURCE] = "pixel_source",
 	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
 	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
 	[IGT_PLANE_TYPE] = "type",
@@ -3417,6 +3419,12 @@ static igt_output_t *igt_pipe_get_output(igt_pipe_t *pipe)
 	return NULL;
 }
 
+static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
+{
+	return plane->values[IGT_PLANE_SOLID_FILL];
+}
+
+
 static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 {
 	return plane->values[IGT_PLANE_FB_ID];
@@ -3648,7 +3656,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	struct igt_display *display = primary->pipe->display;
 	igt_output_t *output = igt_pipe_get_output(pipe);
 	drmModeModeInfo *mode;
-	uint32_t fb_id, crtc_id;
+	uint32_t fb_id, solid_fill_id, crtc_id;
 	int ret;
 
 	/* Primary planes can't be windowed when using a legacy commit */
@@ -3665,12 +3673,14 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 
 	crtc_id = pipe->crtc_id;
 	fb_id = output ? igt_plane_get_fb_id(primary) : 0;
-	if (fb_id)
+	solid_fill_id = output ? igt_plane_get_solid_fill_id(primary) : 0;
+
+	if (fb_id || solid_fill_id)
 		mode = igt_output_get_mode(output);
 	else
 		mode = NULL;
 
-	if (fb_id) {
+	if (fb_id || solid_fill_id) {
 		uint32_t src_x = primary->values[IGT_PLANE_SRC_X] >> 16;
 		uint32_t src_y = primary->values[IGT_PLANE_SRC_Y] >> 16;
 
@@ -4935,6 +4945,27 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
 }
 
+void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
+		int solid_fill_id)
+{
+	igt_pipe_t *pipe = plane->pipe;
+	igt_display_t *display = pipe->display;
+	int width = rect->x2 - rect->x1;
+	int height = rect->y2 - rect->y1;
+
+	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
+			solid_fill_id ? pipe->crtc_id : 0);
+	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, solid_fill_id);
+
+	plane->gem_handle = 0;
+
+	LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", kmstest_pipe_name(pipe->pipe),
+	    plane->index, solid_fill_id);
+
+	igt_plane_set_position(plane, rect->x1, rect->y1);
+	igt_plane_set_size(plane, width, height);
+}
+
 /**
  * igt_plane_set_fb:
  * @plane: Plane
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b42f..9c05272abe1e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
 #define IGT_PLANE_COORD_CHANGED_MASK 0xff
 
        IGT_PLANE_FB_ID,
+       IGT_PLANE_SOLID_FILL,
+       IGT_PLANE_PIXEL_SOURCE,
        IGT_PLANE_CRTC_ID,
        IGT_PLANE_IN_FENCE_FD,
        IGT_PLANE_TYPE,
@@ -537,6 +539,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 
 void igt_pipe_request_out_fence(igt_pipe_t *pipe);
 
+void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
+		int solid_fill_id);
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
 void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
 void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);

-- 
2.43.0
