Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF16E882
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:26 +0300
Message-Id: <20211013221727.6392-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] tests/i915/kms_flip_tiling: Stick
 pipe_crc into data_t
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

Dunno why the pipe_crc has its own variable visible throughout
the whole file. Just stuff it into data_t where everything else
lives.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_flip_tiling.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 8eecb20c49b9..604f01dd3766 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -39,29 +39,24 @@ typedef struct {
 	int gen;
 	uint32_t testformat;
 	struct igt_fb fb[2];
+	igt_pipe_crc_t *pipe_crc;
 } data_t;
 
-static igt_pipe_crc_t *_pipe_crc;
-
-static igt_pipe_crc_t *pipe_crc_new(data_t *data, int pipe)
+static void pipe_crc_free(data_t *data)
 {
-	if (_pipe_crc) {
-		igt_pipe_crc_free(_pipe_crc);
-		_pipe_crc = NULL;
-	}
+	if (!data->pipe_crc)
+		return;
 
-	_pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
-	igt_assert(_pipe_crc);
-
-	return _pipe_crc;
+	igt_pipe_crc_free(data->pipe_crc);
+	data->pipe_crc = NULL;
 }
 
-static void pipe_crc_free(void)
+static void pipe_crc_new(data_t *data, int pipe)
 {
-	if (_pipe_crc) {
-		igt_pipe_crc_free(_pipe_crc);
-		_pipe_crc = NULL;
-	}
+	pipe_crc_free(data);
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(data->pipe_crc);
 }
 
 static int try_commit(igt_display_t *display)
@@ -75,11 +70,10 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
-	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t reference_crc, crc;
 	int fb_id, ret;
 
-	pipe_crc = pipe_crc_new(data, pipe);
+	pipe_crc_new(data, pipe);
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
@@ -104,7 +98,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_require_f(try_commit(&data->display) == 0,
 		      "commit failed with " IGT_MODIFIER_FMT "\n",
 		      IGT_MODIFIER_ARGS(modifier[1]));
-	igt_pipe_crc_collect_crc(pipe_crc, &reference_crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &reference_crc);
 
 	/* Commit the first fb. */
 	igt_plane_set_fb(primary, &data->fb[0]);
@@ -124,7 +118,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	kmstest_wait_for_pageflip(data->drm_fd);
 
 	/* Get a crc and compare with the reference. */
-	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(&reference_crc, &crc);
 }
 
@@ -135,7 +129,7 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	/* Clean up. */
 	igt_plane_set_fb(primary, NULL);
-	pipe_crc_free();
+	pipe_crc_free(data);
 	igt_output_set_pipe(output, PIPE_ANY);
 	igt_display_commit(&data->display);
 
-- 
2.32.0
