Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8C598D48
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:13:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:39:01 +0530
Message-Id: <20220814180908.2553394-45-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 44/51] tests/i915/kms_flip_tiling: Add support for
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
 tests/i915/kms_flip_tiling.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index ba9ff46e..8831245f 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -78,6 +78,9 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_crc_t reference_crc, crc;
 	int fb_id, ret;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	memcpy(&data->old_fb, &data->fb, sizeof(data->fb));
 
 	mode = igt_output_get_mode(output);
@@ -194,8 +197,12 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_plane_t *plane;
 
+			igt_display_reset(&data.display);
 			pipe_crc_free(&data);
+
 			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(&data.display))
+				continue;
 
 			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-- 
2.35.1
