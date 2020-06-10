Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E489EAE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 19:38:14 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 11 Jun 2020 01:07:24 +0530
Message-Id: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
References: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [[RFC] i-g-t 1/1] lib/igt_kms: Add support for display
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add support for non-contiguous pipe display by allocating
upper bound pipes array for display. Set the pipe enum name
to igt pipe for enabled pipes in drm.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 30 +++++++++++++++++++++++++-----
 lib/igt_kms.h | 13 ++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index afef5939..2b1cf878 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1921,10 +1921,26 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	 * We cache the number of pipes, that number is a physical limit of the
 	 * hardware and cannot change of time (for now, at least).
 	 */
-	display->n_pipes = resources->count_crtcs;
-	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
+	display->n_pipes = IGT_MAX_PIPES;
+	display->pipes = calloc(sizeof(igt_pipe_t), IGT_MAX_PIPES);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
+	for(i = 0; i < resources->count_crtcs; i++) {
+		igt_pipe_t *pipe;
+		struct drm_i915_get_pipe_from_crtc_id get_pipe;
+
+		/* Get right pipe enum from kernel for a pipe */
+		get_pipe.pipe = 0;
+		get_pipe.crtc_id =  resources->crtcs[i];
+		do_ioctl(display->drm_fd,
+				DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
+
+		pipe = &display->pipes[get_pipe.pipe];
+		pipe->pipe = get_pipe.pipe;
+		pipe->enabled = true;
+		pipe->crtc_id = resources->crtcs[i];
+	}
+
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
@@ -1959,9 +1975,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		int j, type;
 		uint8_t last_plane = 0, n_planes = 0;
 
-		pipe->crtc_id = resources->crtcs[i];
 		pipe->display = display;
-		pipe->pipe = i;
 		pipe->plane_cursor = -1;
 		pipe->plane_primary = -1;
 		pipe->planes = NULL;
@@ -2409,12 +2423,18 @@ static bool output_is_internal_panel(igt_output_t *output)
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
 {
-	unsigned full_pipe_mask = (1 << (display->n_pipes)) - 1, assigned_pipes = 0;
+	unsigned full_pipe_mask, assigned_pipes = 0;
 	igt_output_t *output;
 	int i, j;
 
 	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display->n_pipes);
 
+	for( i = 0; i < display->n_pipes; i++) {
+		igt_pipe_t *pipe = &display->pipes[i];
+		if (pipe->enabled)
+			full_pipe_mask |= (1 << pipe->pipe);
+	}
+
 	/*
 	 * Try to assign all outputs to the first available CRTC for
 	 * it, start with the outputs restricted to 1 pipe, then increase
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 32a0e4cc..e91a2094 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -341,6 +341,7 @@ typedef struct igt_plane {
 struct igt_pipe {
 	igt_display_t *display;
 	enum pipe pipe;
+	bool enabled;
 
 	int n_planes;
 	int plane_cursor;
@@ -510,8 +511,9 @@ static inline bool igt_output_is_connected(igt_output_t *output)
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
@@ -530,8 +532,9 @@ static inline bool igt_output_is_connected(igt_output_t *output)
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
@@ -549,7 +552,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
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
