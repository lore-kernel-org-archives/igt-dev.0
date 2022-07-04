Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35388B40E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jul 2022 16:34:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Mon,  4 Jul 2022 22:02:42 +0530
Message-Id: <20220704163242.373772-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_dither: Set max_bpc before exiting the
 subtest
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

Before exiting the subtest, we must reset the connector's "max_bpc"
property to it's default value, else it may effect the consequent
subtests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 02896b37..f180c873 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -128,6 +128,7 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	igt_display_t *display = &data->display;
 	dither_status_t status;
 	int bpc, ret;
+	bool constraint;
 
 	igt_info("Dithering test execution on %s PIPE_%s\n",
 			output->name, kmstest_pipe_name(pipe));
@@ -148,6 +149,13 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	else
 		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
 
+	if (ret)
+		goto cleanup;
+
+	constraint = i915_clock_constraint(data, pipe, output, output_bpc);
+	if (!constraint)
+		goto cleanup;
+
 	igt_require_f(!ret, "%s don't support %d-bpc\n",
 				output->name, output_bpc);
 
@@ -174,12 +182,17 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	* Otherwise, previously updated value will stay forever and
 	* may cause the failures for next/other subtests.
 	*/
+cleanup:
 	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_remove_fb(data->drm_fd, &data->fb);
 
+	igt_require_f(!ret, "%s don't support %d-bpc\n", output->name, output_bpc);
+	igt_require_f(constraint, "No supported mode found to use %d-bpc on %s\n",
+				  output_bpc, output->name);
+
 	/* Compute the result. */
 	if (fb_bpc > output_bpc)
 		igt_assert_f(status.dither, "(fb_%dbpc > output_%dbpc): Dither should be enabled\n",
-- 
2.35.1
