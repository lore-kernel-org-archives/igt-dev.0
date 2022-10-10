Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C00410E1AB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 09:41:11 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 15:05:47 +0530
Message-Id: <20221010093547.14296-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] RFC: kms_content_protection: Add a test for
 HDCP-MST with suspend resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: suraj.kandpal@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

adding new test to validate HDCP-MST with suspend resume
test check for valid output which supports MST and HDCP
then commits and check if the content protection is enabled
before and after suspend-resume.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c | 90 +++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index aa28b7bf..701c65fc 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -48,6 +48,7 @@ struct data {
 #define CP_MEI_RELOAD				(1 << 2)
 #define CP_TYPE_CHANGE				(1 << 3)
 #define CP_UEVENT				(1 << 4)
+#define SUSPEND_RESUME				(1 << 5)
 
 #define CP_UNDESIRED				0
 #define CP_DESIRED				1
@@ -686,6 +687,85 @@ test_content_protection_mst(int content_type)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
 }
 
+static void
+test_content_protection_mst_suspend_resume(int content_type)
+{
+	igt_display_t *display = &data.display;
+	igt_output_t *output;
+	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0;
+	enum pipe pipe;
+	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
+
+	for_each_pipe(display, pipe)
+		max_pipe++;
+
+	pipe = PIPE_A;
+
+	for_each_connected_output(display, output) {
+		if (!output_is_dp_mst(output, dp_mst_outputs))
+			continue;
+
+		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
+
+		igt_output_set_pipe(output, pipe);
+		prepare_modeset_on_mst_output(output);
+		mst_output[dp_mst_outputs++] = output;
+
+		pipe++;
+
+		if (pipe > max_pipe)
+			break;
+	}
+
+	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
+
+	if (igt_display_try_commit_atomic(display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL) != 0) {
+		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+		igt_require_f(found, "No valid mode combo found for MST modeset\n");
+
+		for (count = 0; count < dp_mst_outputs; count++)
+			prepare_modeset_on_mst_output(mst_output[count]);
+	}
+
+	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+
+	for (count = 0; count < dp_mst_outputs; count++) {
+		if (!output_hdcp_capable(mst_output[count], content_type))
+			continue;
+
+		hdcp_mst_output[valid_outputs++] = mst_output[count];
+	}
+
+	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the required HDCP support\n");
+
+	for (count = 0; count < valid_outputs; count++) {
+		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
+
+		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
+			igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for (count = 0; count < valid_outputs; count++) {
+		ret = wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		igt_assert_f(ret, "Content Protection not enabled on %s\n", hdcp_mst_output[count]->name);
+	}
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for (count = 0; count < valid_outputs; count++) {
+		ret = wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		igt_assert_f(ret, "Content Protection not enabled on %s\n", hdcp_mst_output[count]->name);
+	}
+}
+
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
@@ -817,6 +897,11 @@ static const struct {
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
+	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
+          .name = "dp-mst-suspend_resume",
+          .cp_tests = SUSPEND_RESUME,
+          .content_type = HDCP_CONTENT_TYPE_0,
+        },
 };
 
 igt_main
@@ -866,7 +951,10 @@ igt_main
 
 			igt_subtest(mst_subtests[i].name) {
 				data.cp_tests = mst_subtests[i].cp_tests;
-				test_content_protection_mst(mst_subtests[i].content_type);
+				if (data.cp_tests == SUSPEND_RESUME)
+				       test_content_protection_mst_suspend_resume(mst_subtests[i].content_type);
+				else
+					test_content_protection_mst(mst_subtests[i].content_type);
 			}
 		}
 	}
-- 
2.36.0
