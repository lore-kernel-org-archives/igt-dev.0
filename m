Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F13F10ED95
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:06:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:33:05 +0530
Message-Id: <20220909140331.1041095-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 26/52] tests/kms_plane_multiple: Add support
 for Bigjoiner
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
---
 tests/kms_plane_multiple.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index cbe8c189..4ab49624 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -102,6 +102,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_plane_t *primary;
 	int ret;
 
+	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -289,6 +290,9 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	bool loop_forever;
 	char info[256];
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	if (opt.iterations == LOOP_FOREVER) {
 		loop_forever = true;
 		sprintf(info, "forever");
@@ -374,12 +378,17 @@ static void run_test(data_t *data, uint64_t modifier)
 {
 	enum pipe pipe;
 	igt_output_t *output;
+	igt_display_t *display = &data->display;
 
-	if (!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
+	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
 		return;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
-		igt_display_reset(&data->display);
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 			test_plane_position(data, pipe, output, modifier);
-- 
2.35.1
