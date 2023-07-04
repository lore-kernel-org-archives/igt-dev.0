Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABA910E30B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 17:31:48 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 23:01:05 +0530
Message-Id: <20230704173107.842296-8-swati2.sharma@intel.com>
In-Reply-To: <20230704173107.842296-1-swati2.sharma@intel.com>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 7/9] tests/i915/kms_dsc: enable validation for vdsc
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

Fractional BPP support comes from DSC1.2. To test Fractional BPP, debugfs entry
(force_dsc_fractional_bpp) is introduced. From the IGT; we are setting this
debugfs entry. However, before setting this debugfs entry, we are checking
capability i.e. Fractional BPP is supported by platform and sink both. In driver,
if force_dsc_fractional_bpp is set then while iterating over output bpp with
fractional step size we will continue if output_bpp is computed as integer and
allow DSC iff compressed bpp is fractional.

v2: -change in igt_describe (Ankit)
v3: -rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c        | 22 ++++++++++++++
 tests/i915/kms_dsc_helper.c | 60 +++++++++++++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  4 +++
 3 files changed, 86 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index d1935dcd3..26d6e2ffb 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -41,6 +41,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_BPC		(1<<0)
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
+#define TEST_DSC_FRACTIONAL_BPP (1<<3)
 
 typedef struct {
 	int drm_fd;
@@ -148,6 +149,12 @@ static void update_display(data_t *data, uint32_t test_type)
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
 
@@ -207,6 +214,7 @@ static void update_display(data_t *data, uint32_t test_type)
 				enabled ? "ON" : "OFF");
 
 	restore_force_dsc_en();
+	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
 		current_bpc = get_status(data->drm_fd, data->pipe);
@@ -254,6 +262,10 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						    data->output, data->output_format))
 			continue;
 
+		if (!(check_dsc_fractional_bpp_on_connector(data->disp_ver,
+							    data->drm_fd, data->output)))
+			continue;
+
 		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
 			continue;
 
@@ -370,6 +382,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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
index 61f76ddee..bbc160caa 100644
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
@@ -143,3 +146,60 @@ bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *outpu
 
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
index 2109bd767..cd563d9ff 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -34,5 +34,9 @@ void force_dsc_output_format(int drmfd, igt_output_t *output,
 			     enum dsc_output_format output_format);
 bool is_dsc_output_format_supported(int disp_ver, int drmfd, igt_output_t *output,
 				    enum dsc_output_format output_format);
+void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
+void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_fractional_bpp_en(void);
+bool check_dsc_fractional_bpp_on_connector(int disp_ver, int drmfd, igt_output_t *output);
 
 #endif
-- 
2.25.1
