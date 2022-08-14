Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259A90E80
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:21 +0530
Message-Id: <20220814180908.2553394-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 04/51] tests/kms_atomic_interruptible: Add support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_interruptible.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 038cb286..c7259bc2 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -82,6 +82,9 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_plane_t *primary, *plane;
 	int block;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	/*
 	 * Make sure we start with everything disabled to force a real modeset.
 	 * igt_display_require only sets sw state, and assumes the first test
@@ -265,6 +268,21 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static bool is_valid_combo(igt_display_t *display,
+			   enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 igt_main
 {
 	igt_display_t display;
@@ -286,6 +304,9 @@ igt_main
 	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -295,6 +316,9 @@ igt_main
 	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -304,6 +328,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -313,6 +340,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -322,6 +352,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
 			break;
@@ -331,6 +364,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -340,6 +376,9 @@ igt_main
 	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
 			break;
-- 
2.35.1
