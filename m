Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AF510E094
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 06:16:42 +0000 (UTC)
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 11:44:56 +0530
Message-Id: <20230803061456.3757949-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: HDCP MST
 output color modification
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Toggle monitor colors in case of dp mst in between red and green
depending on hdcp enablement.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6cdf81a28..5e5225811 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -431,12 +431,11 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output)
+static void prepare_modeset_on_mst_output(igt_output_t *output, bool hdcp_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
-	enum pipe pipe = output->pending_pipe;
 
 	mode = igt_output_get_mode(output);
 
@@ -445,8 +444,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
-	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width, height);
+	igt_plane_set_fb(primary, hdcp_enabled ? &data.green : &data.red);
+	igt_fb_set_size(hdcp_enabled ? &data.green : &data.red, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -633,7 +632,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_pipe(output, pipe);
-		prepare_modeset_on_mst_output(output);
+		prepare_modeset_on_mst_output(output, false);
 		mst_output[dp_mst_outputs++] = output;
 	}
 
@@ -647,7 +646,7 @@ test_content_protection_mst(int content_type)
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
 		for (count = 0; count < dp_mst_outputs; count++)
-			prepare_modeset_on_mst_output(mst_output[count]);
+			prepare_modeset_on_mst_output(mst_output[count], false);
 	}
 
 	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
@@ -674,8 +673,11 @@ test_content_protection_mst(int content_type)
 	for (count = 0; count < valid_outputs; count++) {
 		ret = wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		igt_assert_f(ret, "Content Protection not enabled on %s\n", hdcp_mst_output[count]->name);
+		prepare_modeset_on_mst_output(mst_output[count], true);
 	}
 
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
 
-- 
2.25.1
