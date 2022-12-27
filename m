Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289C10E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 08:35:41 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Dec 2022 14:07:40 +0530
Message-Id: <20221227083741.14644-2-swati2.sharma@intel.com>
In-Reply-To: <20221227083741.14644-1-swati2.sharma@intel.com>
References: <20221227083741.14644-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_hdr: Add negative test for
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 655c3e14..629a45a7 100644
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
@@ -518,6 +531,19 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->fd, &afb);
 }
 
+static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
+{
+	struct hdr_output_metadata hdr;
+	size_t metadata_size = sizeof(&hdr);
+
+	fill_hdr_output_metadata_st2048(&hdr);
+
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
+	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + sizeof(struct hdr_output_metadata)), -EINVAL);
+}
+
 /* Returns true if an output supports HDR metadata property. */
 static bool has_hdr(igt_output_t *output)
 {
@@ -565,6 +591,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 						test_static_toggle(data, pipe, output, flags);
 					if (flags & TEST_SWAP)
 						test_static_swap(data, pipe, output);
+					if (flags & TEST_INVALID_METADATA_SIZES)
+						test_invalid_metadata_sizes(data, output);
 				}
 
 				/* One pipe is enough */
@@ -613,6 +641,10 @@ igt_main
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
2.17.1
