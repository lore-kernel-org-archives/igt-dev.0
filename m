Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ACE98D0B
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:54 +0530
Message-Id: <20220814180908.2553394-38-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 37/51] tests/i915/kms_big_fb: Add support for
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
 tests/i915/kms_big_fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index d50fde45..6f12c59d 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -397,6 +397,9 @@ static bool test_pipe(data_t *data)
 	igt_plane_t *primary;
 	bool ret = false;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
+
 	if (data->format == DRM_FORMAT_C8 &&
 	    !igt_pipe_obj_has_prop(&data->display.pipes[data->pipe],
 				   IGT_CRTC_GAMMA_LUT))
@@ -472,6 +475,10 @@ max_hw_stride_async_flip_test(data_t *data)
 	igt_crc_t compare_crc, async_crc;
 
 	igt_require(data->display.is_atomic);
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
+
 	igt_output_set_pipe(data->output, data->pipe);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
@@ -582,6 +589,12 @@ static void test_scanout(data_t *data)
 		    data->format, data->modifier);
 
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		igt_display_reset(&data->display);
+
+		igt_output_set_pipe(data->output, data->pipe);
+		if (!igt_test_constraint(&data->display))
+			continue;
+
 		if (data->async_flip_test) {
 			if (max_hw_stride_async_flip_test(data))
 				return;
-- 
2.35.1
