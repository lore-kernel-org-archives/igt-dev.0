Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7810E88E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:42 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:36 +0530
Message-Id: <20230112073537.27890-8-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 7/8] tests/i915/kms_dsc: Enable
 validation for VDSC Fractional BPP
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

Fractional BPP support comes from DSC1.2. To test Fractional BPP, debugfs entry
(force_dsc_fractional_bpp) is introduced. From the IGT; we are setting this
debugfs entry. However, before setting this debugfs entry, we are checking
capability i.e. Fractional BPP is supported by platform and sink both. In driver,
if force_dsc_fractional_bpp is set then while iterating over output bpp with
fractional step size we will continue if output_bpp is computed as integer and
allow DSC iff compressed bpp is fractional.

v2: change in igt_describe (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c        | 27 ++++++++++++++---
 tests/i915/kms_dsc_helper.c | 60 +++++++++++++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  4 +++
 3 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 366205a4e..fda96b5c2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -36,7 +36,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
 	TEST_DSC_BASIC,
-	TEST_DSC_BPC
+	TEST_DSC_BPC,
+	TEST_DSC_FRACTIONAL_BPP
 };
 
 typedef struct {
@@ -147,6 +148,10 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 	if (test_type == TEST_DSC_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
+	} else if (test_type == TEST_DSC_FRACTIONAL_BPP) {
+		igt_debug("DSC fractional bpp is supported on %s\n", data->output->name);
+		save_force_dsc_fractional_bpp_en(data->drm_fd, data->output);
+		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
 	}
 
 	igt_output_set_pipe(output, data->pipe);
@@ -198,9 +203,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 	if (output_format == DSC_FORMAT_YCBCR420)
 		restore_force_dsc_ycbcr420_en();
 
-	igt_debug("Reset input BPC\n");
-	data->input_bpc = 0;
-	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
+	if (test_type == TEST_DSC_BPC) {
+		igt_debug("Reset input BPC\n");
+		data->input_bpc = 0;
+		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
+	} else if (test_type == TEST_DSC_FRACTIONAL_BPP)
+		restore_force_dsc_fractional_bpp_en();
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
@@ -235,6 +243,9 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
+		if ((test_type == TEST_DSC_FRACTIONAL_BPP) && !(check_dsc_fractional_bpp_on_connector(data->disp_ver, data->drm_fd, data->output)))
+			continue;
+
 		if (test_type == TEST_DSC_BPC)
 			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(plane_format));
 		else
@@ -307,6 +318,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests fractional compressed bpp functionality if supported "
+		     "by a connector by forcing fractional_bpp on all connectors that support it "
+		     "with default parameter. While finding the optimum compressed bpp, driver will "
+		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
+		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
+	igt_subtest_with_dynamic("dsc-fractional-bpp")
+			run_test(&data, TEST_DSC_FRACTIONAL_BPP, 0, DRM_FORMAT_XRGB8888);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index 135e9cf58..5c6f1ba00 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -7,8 +7,10 @@
 
 bool force_dsc_en_orig;
 bool force_dsc_ycbcr420_en_orig;
+bool force_dsc_fractional_bpp_en_orig;
 int force_dsc_restore_fd = -1;
 int force_dsc_ycbcr420_restore_fd = -1;
+int force_dsc_fractional_bpp_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
 {
@@ -54,6 +56,7 @@ void kms_dsc_exit_handler(int sig)
 {
 	restore_force_dsc_en();
 	restore_force_dsc_ycbcr420_en();
+	restore_force_dsc_fractional_bpp_en();
 }
 
 bool check_dsc_on_connector(int drmfd, igt_output_t *output)
@@ -142,3 +145,60 @@ bool is_dsc_ycbcr420_supported(int drmfd, igt_output_t *output)
 
 	return true;
 }
+
+void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output)
+{
+	int ret;
+
+	igt_debug("Forcing DSC Fractional BPP on %s\n", output->name);
+	ret = igt_force_dsc_fractional_bpp_enable(drmfd, output->name);
+	igt_assert_f(ret > 0, "forcing dsc fractional bpp debugfs_write failed\n");
+}
+
+void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output)
+{
+	force_dsc_fractional_bpp_en_orig =
+		igt_is_force_dsc_fractional_bpp_enabled(drmfd, output->name);
+	force_dsc_fractional_bpp_restore_fd =
+		igt_get_dsc_fractional_bpp_debugfs_fd(drmfd, output->name);
+	igt_assert(force_dsc_fractional_bpp_restore_fd >= 0);
+}
+
+void restore_force_dsc_fractional_bpp_en(void)
+{
+	if (force_dsc_fractional_bpp_restore_fd < 0)
+		return;
+
+	igt_debug("Restoring DSC Fractional BPP enable\n");
+	igt_assert(write(force_dsc_fractional_bpp_restore_fd, force_dsc_fractional_bpp_en_orig ? "1" : "0", 1) == 1);
+
+	close(force_dsc_fractional_bpp_restore_fd);
+	force_dsc_fractional_bpp_restore_fd = -1;
+}
+
+static
+bool is_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
+{
+	int bpp_prec;
+
+	bpp_prec = igt_get_dsc_fractional_bpp_supported(drmfd, connector_name);
+
+	if (bpp_prec == 1)
+		return false;
+
+	return true;
+}
+
+bool check_dsc_fractional_bpp_on_connector(int disp_ver, int drmfd, igt_output_t *output)
+{
+	if (disp_ver >= 14) {
+		if (!is_dsc_fractional_bpp_supported(drmfd, output->name)) {
+			igt_debug("DSC fractional bpp not supported on connector %s\n",
+				   output->name);
+			return false;
+		} else
+			return true;
+	}
+
+	return false;
+}
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
index 83905fafe..b46a08928 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -35,5 +35,9 @@ void force_dsc_ycbcr420_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_ycbcr420_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_ycbcr420_en(void);
 bool is_dsc_ycbcr420_supported(int drmfd, igt_output_t *output);
+void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
+void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_fractional_bpp_en(void);
+bool check_dsc_fractional_bpp_on_connector(int disp_ver, int drmfd, igt_output_t *output);
 
 #endif
-- 
2.25.1
