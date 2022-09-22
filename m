Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B3910EAB6
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:03:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:17 +0530
Message-Id: <20220922160004.2041598-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 05/52] tests/kms_atomic_interruptible: Add
 support for Bigjoiner
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
 tests/kms_atomic_interruptible.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 038cb286..b3e9ddee 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -82,11 +82,15 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_plane_t *primary, *plane;
 	int block;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	/*
 	 * Make sure we start with everything disabled to force a real modeset.
 	 * igt_display_require only sets sw state, and assumes the first test
 	 * doesn't care about hw state.
 	 */
+	igt_display_reset(display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_output_set_pipe(output, pipe);
@@ -265,6 +269,21 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static bool pipe_output_combo_valid(igt_display_t *display,
+				    enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 igt_main
 {
 	igt_display_t display;
@@ -286,6 +305,9 @@ igt_main
 	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -295,6 +317,9 @@ igt_main
 	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -304,6 +329,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -313,6 +341,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -322,6 +353,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
 			break;
@@ -331,6 +365,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -340,6 +377,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!pipe_output_combo_valid(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
 			break;
-- 
2.37.3
