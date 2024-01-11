Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37410E7D7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 07:33:24 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [v2 2/3] tests/intel/kms_dsc_helper: add dsc+big joiner helper func
Date: Thu, 11 Jan 2024 13:05:01 +0530
Message-Id: <20240111073502.151340-3-swati2.sharma@intel.com>
In-Reply-To: <20240111073502.151340-1-swati2.sharma@intel.com>
References: <20240111073502.151340-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add helper functions dsc with big joiner helper functions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 32 ++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 58057aca3..91ce21062 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -7,8 +7,10 @@
 
 static bool force_dsc_en_orig;
 static bool force_dsc_fractional_bpp_en_orig;
+static bool force_dsc_bigjoiner_en_orig;
 static int force_dsc_restore_fd = -1;
 static int force_dsc_fractional_bpp_restore_fd = -1;
+static int force_dsc_bigjoiner_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
 {
@@ -201,3 +203,33 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output)
+{
+	int ret;
+
+	igt_debug("Forcing DSC Big Joiner on %s\n", output->name);
+	ret = igt_force_bigjoiner_enable(drmfd, output->name);
+	igt_assert_f(ret == 0, "forcing dsc big joiner debugfs_write failed\n");
+}
+
+void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output)
+{
+	force_dsc_bigjoiner_en_orig =
+		igt_is_force_bigjoiner_enabled(drmfd, output->name);
+	force_dsc_bigjoiner_restore_fd =
+		igt_get_bigjoiner_debugfs_fd(drmfd, output->name);
+	igt_assert(force_dsc_bigjoiner_restore_fd >= 0);
+}
+
+void restore_force_dsc_bigjoiner_en(void)
+{
+	if (force_dsc_bigjoiner_restore_fd < 0)
+		return;
+
+	igt_debug("Restoring DSC Big Joiner enable\n");
+	igt_assert(write(force_dsc_bigjoiner_restore_fd, force_dsc_bigjoiner_en_orig ? "1" : "0", 1) == 1);
+
+	close(force_dsc_bigjoiner_restore_fd);
+	force_dsc_bigjoiner_restore_fd = -1;
+}
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 4dbd88fe7..b2f8ea1ca 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -38,5 +38,8 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output);
+void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_bigjoiner_en(void);
 
 #endif
-- 
2.25.1
