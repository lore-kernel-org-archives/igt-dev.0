Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0E10E409
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 01:36:58 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 07:02:23 +0530
Message-Id: <20230726013257.265578-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230615225809.21751-1-nidhi1.gupta@intel.com>
References: <20230615225809.21751-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_vrr: New subtest for toggle
 VRR during fastsets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow VRR to be toggled during fastsets, without
the need of full modeset.

This is a separate subtest to test specifically
that driver supports toggling without modeset or not.
Test will first enable the VRR do the modeset and then
disable it without full modeset then we  verify weather
its disabled or not.

v2: move igt_require from fixture
    (Kamil)
v3: Apply modeset initially in basic-fastset subtest
    and skip it after VRR toggeling
    fixed nitpicks (Kamil)
v4: Edit commit message (Mitul)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6a766bfb9..438114769 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -45,7 +45,8 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
-	TEST_NEGATIVE = 1 << 4,
+	TEST_FASTSET = 1 << 4,
+	TEST_NEGATIVE = 1 << 5,
 };
 
 typedef struct range {
@@ -193,11 +194,14 @@ static bool vrr_capable(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
+static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
+			    bool need_modeset, bool enabled)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
 				enabled);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	if (need_modeset)
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 /* Prepare the display for testing on the given pipe. */
@@ -370,7 +374,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
 
-	set_vrr_on_pipe(data, pipe, true);
+	set_vrr_on_pipe(data, pipe, true, true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -436,7 +440,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
+	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
@@ -526,6 +530,12 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Tests that VRR basic without modeset");
+	igt_subtest_with_dynamic("flip-basic-fastset") {
+		igt_require_intel(data.drm_fd);
+		run_vrr_test(&data, test_basic, TEST_FASTSET);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1
