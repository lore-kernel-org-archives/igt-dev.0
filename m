Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7757C89ABE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 15:20:51 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon, 20 Jul 2020 20:50:35 +0530
Message-Id: <20200720152045.10787-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
References: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/11] lib/igt_kms: Add support for display
 with non-contiguous pipes
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

Add support for non-contiguous pipe display by allocating
upper bound pipes array for display. With non-contiguous pipes
display, pipe mapping is always not same as crtc mapping, For i915 pipe
is enum id of i915's crtc object and it is not equal to crtc offset
of a pipe in mode config list. Hence allocating upper bound array
for igt_pipe and reading pipe id using GET_PIPE_FROM_CRTC_ID ioctl.

Example:
With a non-contiguous pipes PIPE_A & PIPE_D
are enabled, PIPE_C & PIPE_B disabled configuration,
the pipe enum for PIPE_A & D will be '0' and '3' and crtc offsets
are '0' & '1' in mode config list, to ordering crtcs in drm with
enabled pipes allocating upper bound pipes array.

v6:
    Updated commit description as per review comments <Hiler, Arkadiusz>

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-------
 lib/igt_kms.h | 14 +++++++----
 2 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 27f85859..5a80d17f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1873,6 +1873,21 @@ void igt_display_reset(igt_display_t *display)
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
 
+/* Get crtc mask for a pipe using crtc id */
+static int
+__get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
+{
+	int offset;
+
+	for (offset = 0; offset < resources->count_crtcs; offset++)
+	{
+		if(pipe->crtc_id == resources->crtcs[offset])
+			break;
+	}
+
+	return (1 << offset);
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -1889,12 +1904,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
 	int i;
+	bool is_i915_dev;
 
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");
 
 	display->drm_fd = drm_fd;
+	is_i915_dev = is_i915_device(drm_fd);
 
 	resources = drmModeGetResources(display->drm_fd);
 	if (!resources)
@@ -1918,13 +1935,39 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 #endif
 
 	/*
-	 * We cache the number of pipes, that number is a physical limit of the
-	 * hardware and cannot change of time (for now, at least).
+	 * With non-contiguous pipes display, crtc mapping is not always same
+	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
+	 * hence allocating upper bound igt_pipe array to support non-contiguos
+	 * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID ioctl
+	 * for a pipe to do pipe ordering with respect to crtc list.
 	 */
-	display->n_pipes = resources->count_crtcs;
+	display->n_pipes = IGT_MAX_PIPES;
 	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
+	for (i = 0; i < resources->count_crtcs; i++) {
+		igt_pipe_t *pipe;
+
+		if (is_i915_dev) {
+			struct drm_i915_get_pipe_from_crtc_id get_pipe;
+
+			get_pipe.pipe = 0;
+			get_pipe.crtc_id =  resources->crtcs[i];
+			do_ioctl(display->drm_fd,
+					DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
+			pipe = &display->pipes[get_pipe.pipe];
+			pipe->pipe = get_pipe.pipe;
+		}
+		else {
+			pipe = &display->pipes[i];
+			pipe->pipe = i;
+		}
+
+		/* pipe is enabled/disabled */
+		pipe->enabled = true;
+		pipe->crtc_id = resources->crtcs[i];
+	}
+
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
@@ -1955,25 +1998,26 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	for_each_pipe(display, i) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		igt_plane_t *plane;
-		int p = 1;
+		int p = 1, crtc_mask = 0;
 		int j, type;
 		uint8_t last_plane = 0, n_planes = 0;
 
-		pipe->crtc_id = resources->crtcs[i];
 		pipe->display = display;
-		pipe->pipe = i;
 		pipe->plane_cursor = -1;
 		pipe->plane_primary = -1;
 		pipe->planes = NULL;
 
 		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
 
+		/* Get valid crtc index from crtcs for a pipe */
+		crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
+
 		/* count number of valid planes */
 		for (j = 0; j < display->n_planes; j++) {
 			drmModePlane *drm_plane = display->planes[j].drm_plane;
 			igt_assert(drm_plane);
 
-			if (drm_plane->possible_crtcs & (1 << i))
+			if (drm_plane->possible_crtcs & crtc_mask)
 				n_planes++;
 		}
 
@@ -1987,7 +2031,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 			igt_plane_t *global_plane = &display->planes[j];
 			drmModePlane *drm_plane = global_plane->drm_plane;
 
-			if (!(drm_plane->possible_crtcs & (1 << i)))
+			if (!(drm_plane->possible_crtcs & crtc_mask))
 				continue;
 
 			type = global_plane->type;
@@ -2409,12 +2453,18 @@ static bool output_is_internal_panel(igt_output_t *output)
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
 {
-	unsigned full_pipe_mask = (1 << (display->n_pipes)) - 1, assigned_pipes = 0;
+	unsigned full_pipe_mask, assigned_pipes = 0;
 	igt_output_t *output;
 	int i, j;
 
 	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display->n_pipes);
 
+	for (i = 0; i < display->n_pipes; i++) {
+		igt_pipe_t *pipe = &display->pipes[i];
+		if (pipe->enabled)
+			full_pipe_mask |= (1 << i);
+	}
+
 	/*
 	 * Try to assign all outputs to the first available CRTC for
 	 * it, start with the outputs restricted to 1 pipe, then increase
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 416e737c..f9bbddc5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -341,6 +341,8 @@ typedef struct igt_plane {
 struct igt_pipe {
 	igt_display_t *display;
 	enum pipe pipe;
+	/* pipe is enabled or not */
+	bool enabled;
 
 	int n_planes;
 	int plane_cursor;
@@ -510,8 +512,9 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  * depends upon runtime probing of the actual kms driver that is being tested.
  * Use #for_each_pipe_static instead.
  */
-#define for_each_pipe(display, pipe)					\
-	for (pipe = 0; assert(igt_can_fail()), pipe < igt_display_get_n_pipes(display); pipe++)
+#define for_each_pipe(display, pipe) \
+	for_each_pipe_static(pipe) \
+		for_each_if((display)->pipes[(pipe)].enabled)
 
 /**
  * for_each_pipe_with_valid_output:
@@ -530,8 +533,9 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	for (int con__ = (pipe) = 0; \
 	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
 	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
-		for_each_if ((((output) = &(display)->outputs[con__]), \
-			     igt_pipe_connector_valid((pipe), (output))))
+		 for_each_if((display)->pipes[pipe].enabled) \
+			for_each_if ((((output) = &(display)->outputs[con__]), \
+						igt_pipe_connector_valid((pipe), (output))))
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 					   igt_output_t **chosen_outputs);
@@ -549,7 +553,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 #define for_each_pipe_with_single_output(display, pipe, output) \
 	for (igt_output_t *__outputs[(display)->n_pipes], \
 	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
-	     __output < &__outputs[(display)->n_pipes]; __output++) \
+		 __output < &__outputs[(display)->n_pipes]; __output++) \
 		for_each_if (*__output && \
 			     ((pipe) = (__output - __outputs), (output) = *__output, 1))
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
