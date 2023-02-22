Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461410E1C0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 11:53:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Feb 2023 17:25:23 +0530
Message-Id: <20230222115524.10512-2-swati2.sharma@intel.com>
In-Reply-To: <20230222115524.10512-1-swati2.sharma@intel.com>
References: <20230222115524.10512-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_hdr: Add negative test for
 invalid metadata sizes
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

Negative test is added in which HDR output metadata prop is
set with invalid sizes.

v2: -Fixed nitpicks (Kamil)
    -Add cleanup (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/kms_hdr.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 655c3e14f..46b28b960 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -50,6 +50,7 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_SWAP = 1 << 3,
+	TEST_INVALID_METADATA_SIZES = 1 << 4,
 };
 
 /* BPC connector state. */
@@ -327,6 +328,18 @@ static void set_hdr_output_metadata(data_t *data,
 				     meta ? sizeof(*meta) : 0);
 }
 
+/* Sets the HDR output metadata prop with invalid size. */
+static int set_invalid_hdr_output_metadata(data_t *data,
+					   struct hdr_output_metadata const *meta,
+					   size_t length)
+{
+	igt_output_replace_prop_blob(data->output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? length : 0);
+
+	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
 /* Converts a double to 861-G spec FP format. */
 static uint16_t calc_hdr_float(double val)
 {
@@ -518,6 +531,21 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->fd, &afb);
 }
 
+static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
+{
+	struct hdr_output_metadata hdr;
+	size_t metadata_size = sizeof(hdr);
+
+	fill_hdr_output_metadata_st2048(&hdr);
+
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
+
+	test_fini(data);
+}
+
 /* Returns true if an output supports HDR metadata property. */
 static bool has_hdr(igt_output_t *output)
 {
@@ -565,6 +593,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 						test_static_toggle(data, pipe, output, flags);
 					if (flags & TEST_SWAP)
 						test_static_swap(data, pipe, output);
+					if (flags & TEST_INVALID_METADATA_SIZES)
+						test_invalid_metadata_sizes(data, output);
 				}
 
 				/* One pipe is enough */
@@ -613,6 +643,10 @@ igt_main
 	igt_subtest_with_dynamic("static-swap")
 		test_hdr(&data, TEST_SWAP);
 
+	igt_describe("Tests invalid HDR metadata sizes");
+	igt_subtest_with_dynamic("invalid-metadata-sizes")
+		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.fd);
-- 
2.25.1
