Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD4D6E155
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2020 12:46:38 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 23 Sep 2020 15:46:33 +0300
Message-Id: <20200923124633.2382061-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t] tests/kms_*: Limit number of concurrent
 planes to three
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

To increase test executino speed and to leave stress testing
for kms_stress IGT test, this patch introduces a limit to test
only three planes concurrently.

The patch is sent as an RFC as a basis of discussion wheter or not
limiting the plane count in tests is a good idea or not. This change
has its drawbacks. We may not test for example bandwidth limitation
anymore as available bandwidth is sufficient for testing with 3 planes.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/igt_kms.h                 |  6 ++++++
 tests/kms_atomic_transition.c | 28 ++++++++++++++++------------
 tests/kms_concurrent.c        |  2 ++
 tests/kms_plane_multiple.c    |  2 ++
 4 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f41eadaf..0141ecfd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -418,6 +418,8 @@ typedef struct {
 	uint16_t tile_h_size, tile_v_size;
 } igt_tile_info_t;
 
+#define MAX_PLANES_TO_TEST	3
+
 void igt_display_require(igt_display_t *display, int drm_fd);
 void igt_display_fini(igt_display_t *display);
 void igt_display_reset(igt_display_t *display);
@@ -592,6 +594,10 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
 		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
 
+#define for_max_planes_on_pipe(display, pipe, plane, max_planes)			\
+	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
+		     j__ < max_planes; j__++)
+
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
 /**
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..8b17bd0c 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -132,7 +132,7 @@ wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	* because most of the modeset operations must be fast
 	* later on.
 	*/
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST) {
 		int i = plane->index;
 
 		if (!mask || !(parms[i].mask & mask)) {
@@ -179,7 +179,7 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -216,7 +216,8 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
-	uint32_t n_planes = display->pipes[pipe].n_planes;
+	uint32_t n_planes = display->pipes[pipe].n_planes > MAX_PLANES_TO_TEST
+				? MAX_PLANES_TO_TEST : display->pipes[pipe].n_planes;
 	uint32_t n_overlays = 0, overlays[n_planes];
 	igt_plane_t *plane;
 	uint32_t iter_mask = 3;
@@ -229,7 +230,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	if (cursor_height >= mode->vdisplay)
 		cursor_height = mode->vdisplay;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -368,7 +369,8 @@ static void prepare_fencing(igt_display_t *display, enum pipe pipe)
 
 	igt_require_sw_sync();
 
-	n_planes = display->pipes[pipe].n_planes;
+	n_planes = display->pipes[pipe].n_planes > MAX_PLANES_TO_TEST
+			? MAX_PLANES_TO_TEST : display->pipes[pipe].n_planes;
 	timeline = calloc(sizeof(*timeline), n_planes);
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
 	thread = calloc(sizeof(*thread), n_planes);
@@ -376,7 +378,7 @@ static void prepare_fencing(igt_display_t *display, enum pipe pipe)
 	seqno = calloc(sizeof(*seqno), n_planes);
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
@@ -384,7 +386,7 @@ static void unprepare_fencing(igt_display_t *display, enum pipe pipe)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST)
 		close(timeline[plane->index]);
 
 	free(timeline);
@@ -445,7 +447,9 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	igt_plane_t *plane;
 	igt_pipe_t *pipe_obj = &display->pipes[pipe];
 	uint32_t iter_max, i;
-	struct plane_parms parms[pipe_obj->n_planes];
+	int n_planes = pipe_obj->n_planes > MAX_PLANES_TO_TEST ?
+		       MAX_PLANES_TO_TEST : pipe_obj->n_planes;
+	struct plane_parms parms[n_planes];
 	unsigned flags = 0;
 	int ret;
 
@@ -533,7 +537,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 		}
 
 		/* force planes to be part of commit */
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST) {
 			if (parms[plane->index].mask)
 				igt_plane_set_position(plane, 0, 0);
 		}
@@ -555,7 +559,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 		if (type == TRANSITION_MODESET_FAST &&
 		    n_enable_planes > 1 &&
-		    n_enable_planes < pipe_obj->n_planes)
+		    n_enable_planes < n_planes)
 			continue;
 
 		igt_output_set_pipe(output, pipe);
@@ -583,7 +587,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 				if (type == TRANSITION_MODESET_FAST &&
 				    n_enable_planes > 1 &&
-				    n_enable_planes < pipe_obj->n_planes)
+				    n_enable_planes < n_planes)
 					continue;
 
 				if (!wm_setup_plane(display, pipe, j, parms, fencing))
@@ -716,7 +720,7 @@ static void refresh_primaries(igt_display_t *display, int mask)
 		if (!((1 << pipe) & mask))
 			continue;
 
-		for_each_plane_on_pipe(display, pipe, plane)
+		for_max_planes_on_pipe(display, pipe, plane, MAX_PLANES_TO_TEST)
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 				igt_plane_set_position(plane, 0, 0);
 	}
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 573631e0..e1b975b7 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -286,6 +286,8 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	int connected_outs;
 	int n_planes = data->display.pipes[pipe].n_planes;
 
+	n_planes = n_planes > MAX_PLANES_TO_TEST ? MAX_PLANES_TO_TEST : n_planes;
+
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 8310981c..db996288 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -362,6 +362,8 @@ test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
 	igt_output_t *output;
 	int n_planes = data->display.pipes[pipe].n_planes;
 
+	n_planes = n_planes > MAX_PLANES_TO_TEST ? MAX_PLANES_TO_TEST : n_planes;
+
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
