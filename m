Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27498CE5
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:48 +0530
Message-Id: <20220814180908.2553394-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 31/51] tests/kms_rotation_crc: Add support for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_rotation_crc.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08..52551c06 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -198,6 +198,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	cleanup_crtc(data);
 
 	igt_output_set_pipe(output, pipe);
+	igt_require(igt_test_constraint(display));
+
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
 	/* create the pipe_crc object for this pipe */
@@ -461,6 +463,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_output_t *output;
 	enum pipe pipe;
 	int pipe_count = 0, connected_outputs = 0;
+	bool found = false;
 
 	if (is_amdgpu_device(data->gfx_fd))
 		igt_require(plane_type != DRM_PLANE_TYPE_OVERLAY &&
@@ -478,6 +481,13 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		igt_plane_t *plane;
 		int i, j, c;
 
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display))
+			continue;
+
+		found = true;
 		mode = igt_output_get_mode(output);
 
 		/*
@@ -568,6 +578,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			igt_pipe_crc_stop(data->pipe_crc);
 		}
 	}
+	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
 typedef struct {
@@ -677,6 +688,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	bool have_crc; // flag if can use previously logged crc for comparison
 	igt_crc_t crclog[16] = {}; //4 * 4 rotation crc storage for packed formats
 	char *str1, *str2; // for debug printouts
+	bool found = false;
 
 	/*
 	 * These are those modes which are tested. For testing feel interesting
@@ -706,11 +718,20 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
 
+	igt_display_require_output(display);
+
 	for_each_valid_output_on_pipe(display, pipe, output) {
 		int i, j, k, l, flipsw, fliphw;
+
+		igt_display_reset(display);
+
 		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display))
+			continue;
+
+		found = true;
+
 		mode = igt_output_get_mode(output);
-		igt_display_require_output(display);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		used_w = TEST_WIDTH(mode);
@@ -890,6 +911,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 			igt_remove_fb(data->gfx_fd, &planeconfigs[c].fbs[d][MULTIPLANE_ROTATED]);
 		}
 	}
+
+	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
 static void test_plane_rotation_exhaust_fences(data_t *data,
-- 
2.35.1
