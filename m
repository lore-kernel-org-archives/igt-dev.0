Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6969710E3F8
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Aug 2023 13:39:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Aug 2023 19:08:10 +0530
Message-Id: <20230801133811.975849-10-swati2.sharma@intel.com>
In-Reply-To: <20230801133811.975849-1-swati2.sharma@intel.com>
References: <20230801133811.975849-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v6 09/10] tests/i915/kms_dsc: enable validation for vdsc
 fractional bpp
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

Intel hardware supports fractional bpp from display_ver >= 14.
To test fractional bpp, debugfs entry (force_dsc_fractional_bpp)
is introduced. From the IGT; we are setting this debugfs entry.
However, before setting this debugfs entry, we are checking
capability i.e. fractional bpp is supported by platform and sink
both. In driver, if force_dsc_fractional_bpp is set then while
iterating over output bpp with fractional step size we will
continue if output_bpp is computed as integer and allow DSC iff
compressed bpp is fractional.

v2: -change in igt_describe (Ankit)
v3: -rebase
v4: -add wrapper for source support of fractional bpp (Ankit)
v5: -fix if() condition (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c        | 28 ++++++++++++++-
 tests/i915/kms_dsc_helper.c | 71 +++++++++++++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  4 +++
 3 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 5bdac57e2..0982cf325 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -41,6 +41,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_BPC		(1<<0)
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
+#define TEST_DSC_FRACTIONAL_BPP (1<<3)
 
 /*
  * Starting from gen11, intel driver supports DSC1.1. For validating
@@ -48,7 +49,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
  * If the sink does support DSC, we will validate different
  * scenarios by forcing dsc. Outline of the tests is as follows:
  * (i) basic modeset (ii) input bpc (iii) pixel formats
- * (iv) output formats
+ * (iv) output formats (v) fractional bpp
  * In the basic subtest, we perform modeset with default parameters.
  * Input bpc and pixel formats subtests, we perform modeset
  * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
@@ -57,6 +58,9 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
  * However, in the output-format subtest, we verify different
  * output formats (RGB/YCBCR444/YCBCR420). Also, test is added to
  * validate output formats with different input bpc (12/10/8).
+ * Lastly, fractional bpp is tested with default parameters.
+ * In this, driver will ignore integer compressed bpp value and
+ * will do modeset with fractional bpp only.
  */
 
 
@@ -161,6 +165,12 @@ static void update_display(data_t *data, uint32_t test_type)
 		force_dsc_output_format(data->drm_fd, data->output, data->output_format);
 	}
 
+	if (test_type & TEST_DSC_FRACTIONAL_BPP) {
+		igt_debug("DSC fractional bpp is supported on %s\n", data->output->name);
+		save_force_dsc_fractional_bpp_en(data->drm_fd, data->output);
+		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
+	}
+
 	igt_output_set_pipe(output, data->pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -220,6 +230,7 @@ static void update_display(data_t *data, uint32_t test_type)
 				enabled ? "ON" : "OFF");
 
 	restore_force_dsc_en();
+	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
 		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
@@ -271,6 +282,11 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						     data->output, data->output_format)))
 			continue;
 
+		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
+		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
+						      data->drm_fd, data->output)))
+			continue;
+
 		if (test_type & TEST_DSC_OUTPUT_FORMAT)
 			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
 		if (test_type & TEST_DSC_FORMAT)
@@ -381,6 +397,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Tests fractional compressed bpp functionality if supported "
+		     "by a connector by forcing fractional_bpp on all connectors that support it "
+		     "with default parameter. While finding the optimum compressed bpp, driver will "
+		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
+		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
+	igt_subtest_with_dynamic("dsc-fractional-bpp")
+			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
+				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+				 DSC_FORMAT_RGB);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index ae59edb6b..a396a8489 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -6,7 +6,9 @@
 #include "kms_dsc_helper.h"
 
 static bool force_dsc_en_orig;
+static bool force_dsc_fractional_bpp_en_orig;
 static int force_dsc_restore_fd = -1;
+static int force_dsc_fractional_bpp_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
 {
@@ -51,6 +53,7 @@ void restore_force_dsc_en(void)
 void kms_dsc_exit_handler(int sig)
 {
 	restore_force_dsc_en();
+	restore_force_dsc_fractional_bpp_en();
 }
 
 bool is_dsc_supported_by_source(int drmfd)
@@ -143,3 +146,71 @@ bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *outpu
 
 	return true;
 }
+
+void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output)
+{
+	int ret;
+
+	igt_debug("Forcing DSC Fractional BPP on %s\n", output->name);
+	ret = igt_force_dsc_fractional_bpp_enable(drmfd, output->name);
+	igt_assert_f(ret == 0, "forcing dsc fractional bpp debugfs_write failed\n");
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
+bool is_dsc_fractional_bpp_supported_by_sink(int drmfd, char *connector_name)
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
+static
+bool is_dsc_fractional_bpp_supported_by_source(int disp_ver)
+{
+	if (disp_ver < 14) {
+		igt_debug("DSC fractional bpp not supported on D13 and older platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output)
+{
+	if (is_dsc_fractional_bpp_supported_by_source(disp_ver)) {
+		if (!is_dsc_fractional_bpp_supported_by_sink(drmfd, output->name)) {
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
index 28ed56d83..4dbd88fe7 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -34,5 +34,9 @@ void force_dsc_output_format(int drmfd, igt_output_t *output,
 			     enum dsc_output_format output_format);
 bool is_dsc_output_format_supported(int disp_ver, int drmfd, igt_output_t *output,
 				    enum dsc_output_format output_format);
+void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
+void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_fractional_bpp_en(void);
+bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
 
 #endif
-- 
2.25.1
