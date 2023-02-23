Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B0A10E4CE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:16:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:39:57 +0530
Message-Id: <20230223151018.2565040-31-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 30/51] tests/kms_rotation_crc: Add support for
 Bigjoiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 72c20d5a4..295aed762 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -215,6 +215,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	cleanup_crtc(data);
 
 	igt_output_set_pipe(output, pipe);
+	igt_require(i915_pipe_output_combo_valid(display));
+
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
 	/* create the pipe_crc object for this pipe */
@@ -479,6 +481,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_output_t *output;
 	enum pipe pipe;
 	int pipe_count = 0, connected_outputs = 0;
+	bool found = false;
 
 	if (is_amdgpu_device(data->gfx_fd))
 		igt_require(plane_type != DRM_PLANE_TYPE_OVERLAY &&
@@ -496,6 +499,13 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_plane_t *plane;
 		int i, j, c;
 
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
+		found = true;
 		mode = igt_output_get_mode(output);
 
 		/*
@@ -586,6 +596,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			igt_pipe_crc_stop(data->pipe_crc);
 		}
 	}
+	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
 typedef struct {
@@ -804,12 +815,22 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
+	bool found = false;
+
+	igt_display_require_output(display);
 
 	for_each_valid_output_on_pipe(display, pipe, output) {
 		int i, j, k, l, flipsw, fliphw;
+
+		igt_display_reset(display);
+
 		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
+		found = true;
+
 		mode = igt_output_get_mode(output);
-		igt_display_require_output(display);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -952,6 +973,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 			igt_remove_fb(data->gfx_fd, &planeconfigs[c].fbs[d][MULTIPLANE_ROTATED]);
 		}
 	}
+
+	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
 static void test_plane_rotation_exhaust_fences(data_t *data,
-- 
2.39.1
