Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895910E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 08:35:41 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Dec 2022 14:07:41 +0530
Message-Id: <20221227083741.14644-3-swati2.sharma@intel.com>
In-Reply-To: <20221227083741.14644-1-swati2.sharma@intel.com>
References: <20221227083741.14644-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_hdr: Add negative test to
 enforce HDR on non-HDR panel
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

Negative test is added to ensure HDR is not enabled on non-HDR panel.
Commit/modeset won't fail. However, in dmesg we can find
	[drm:drm_hdmi_infoframe_set_hdr_metadata [drm_display_helper]] EOTF Not Supported

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 629a45a7..18ccfce7 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -51,6 +51,7 @@ enum {
 	TEST_SUSPEND = 1 << 2,
 	TEST_SWAP = 1 << 3,
 	TEST_INVALID_METADATA_SIZES = 1 << 4,
+	TEST_INVALID_HDR = 1 << 5,
 };
 
 /* BPC connector state. */
@@ -414,6 +415,8 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (flags & TEST_INVALID_HDR)
+		igt_assert_eq(system("dmesg|grep -E \"EOTF Not Supported\""), 0);
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
@@ -565,7 +568,11 @@ static void test_hdr(data_t *data, uint32_t flags)
 		if (!has_max_bpc(output) || !has_hdr(output))
 			continue;
 
-		if (!is_panel_hdr(data, output))
+		/* For negative test, panel should be non-hdr. */
+		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
+			continue;
+
+		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
 			continue;
 
 		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
@@ -587,7 +594,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name) {
-					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
+					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND || flags & TEST_INVALID_HDR)
 						test_static_toggle(data, pipe, output, flags);
 					if (flags & TEST_SWAP)
 						test_static_swap(data, pipe, output);
@@ -645,6 +652,10 @@ igt_main
 	igt_subtest_with_dynamic("invalid-metadata-sizes")
 		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
 
+	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
+	igt_subtest_with_dynamic("invalid-hdr")
+		test_hdr(&data, TEST_INVALID_HDR);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.fd);
-- 
2.17.1
