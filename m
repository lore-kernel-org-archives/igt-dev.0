Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509C6E51C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:27 +0300
Message-Id: <20211013221727.6392-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] tests/i915/kms_flip_tiling: Keep CRC
 running all the time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Don't start/stop the CRC capture at every step. This speeds
up the test significantly.  We also avoid blinking off the
pipe obviously, and we also make sure to keep the old fbs
around to avoid pointless extra commits due to rmfb turning
off the plane whe the current fb vanishes.

The whole test is now ~16s on glk looping over all possible
ordered modifier pairs. Could probably restrict this to a
single pipe as well, further cutting that down by almost
another 2/3. But eg. on GLK not all pipes have all the modifiers
so could perhaps lose a bit of coverrage that way. And we're
only few seconds slower than the starting point when the test
only checked a subset of modifier pairs rather than the full set.
So perhaps acceptable.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_flip_tiling.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 604f01dd3766..08f707f5cb4a 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -47,16 +47,19 @@ static void pipe_crc_free(data_t *data)
 	if (!data->pipe_crc)
 		return;
 
+	igt_pipe_crc_stop(data->pipe_crc);
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 }
 
 static void pipe_crc_new(data_t *data, int pipe)
 {
-	pipe_crc_free(data);
+	if (data->pipe_crc)
+		return;
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
+	igt_pipe_crc_start(data->pipe_crc);
 }
 
 static int try_commit(igt_display_t *display)
@@ -68,14 +71,12 @@ static int try_commit(igt_display_t *display)
 static void
 test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
 {
+	struct igt_fb old_fb[2] = { data->fb[0], data->fb[1] };
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	igt_crc_t reference_crc, crc;
 	int fb_id, ret;
 
-	pipe_crc_new(data, pipe);
-	igt_output_set_pipe(output, pipe);
-
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane(output, 0);
@@ -98,7 +99,8 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_require_f(try_commit(&data->display) == 0,
 		      "commit failed with " IGT_MODIFIER_FMT "\n",
 		      IGT_MODIFIER_ARGS(modifier[1]));
-	igt_pipe_crc_collect_crc(data->pipe_crc, &reference_crc);
+	pipe_crc_new(data, pipe);
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &reference_crc);
 
 	/* Commit the first fb. */
 	igt_plane_set_fb(primary, &data->fb[0]);
@@ -118,8 +120,11 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	kmstest_wait_for_pageflip(data->drm_fd);
 
 	/* Get a crc and compare with the reference. */
-	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc);
 	igt_assert_crc_equal(&reference_crc, &crc);
+
+	igt_remove_fb(data->drm_fd, &old_fb[0]);
+	igt_remove_fb(data->drm_fd, &old_fb[1]);
 }
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
@@ -131,7 +136,6 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_fb(primary, NULL);
 	pipe_crc_free(data);
 	igt_output_set_pipe(output, PIPE_ANY);
-	igt_display_commit(&data->display);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
 	igt_remove_fb(data->drm_fd, &data->fb[1]);
@@ -161,6 +165,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_plane_t *plane;
 
+			pipe_crc_free(&data);
 			igt_output_set_pipe(output, pipe);
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -191,9 +196,9 @@ igt_main
 						      igt_fb_modifier_name(modifier[0]),
 						      igt_fb_modifier_name(modifier[1]))
 						test_flip_tiling(&data, pipe, output, modifier);
-					test_cleanup(&data, pipe, output);
 				}
 			}
+			test_cleanup(&data, pipe, output);
 		}
 	}
 
-- 
2.32.0
