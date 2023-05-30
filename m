Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B01310E161
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 14:44:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 20:13:58 +0530
Message-Id: <20230530144358.355304-4-swati2.sharma@intel.com>
In-Reply-To: <20230530144358.355304-1-swati2.sharma@intel.com>
References: <20230530144358.355304-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests: add
 igt_is_dsc_supported_by_source()
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

Instead of assuming dsc is supported on gen11+ platforms,
lets use has_dsc flag in i915_capability to check hardware
support.

v2: -moved changes to lib (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c               | 23 +++++++++++++++++++++++
 lib/igt_dsc.h               |  1 +
 tests/i915/kms_dsc.c        |  2 +-
 tests/i915/kms_dsc_helper.c | 10 ++++++++++
 tests/i915/kms_dsc_helper.h |  1 +
 tests/kms_invalid_mode.c    |  3 +--
 6 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 6cbd8bae..e24abc8f 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -8,6 +8,7 @@
 #include <string.h>
 #include "igt_dsc.h"
 #include "igt_sysfs.h"
+#include "igt_core.h"
 
 static bool check_dsc_debugfs(int drmfd, char *connector_name, const char *check_str)
 {
@@ -41,6 +42,28 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
 	return ret;
 }
 
+/*
+ * igt_is_dsc_supported_by_source:
+ * @drmfd: A drm file descriptor
+ *
+ * Returns: True if DSC is supported by source, false otherwise.
+ */
+bool igt_is_dsc_supported_by_source(int drmfd)
+{
+	char buf[4096];
+	int dir, res;
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_capabilities",
+				      buf, sizeof(buf));
+	igt_require(res > 0);
+	close(dir);
+
+	return strstr(buf, "has_dsc: yes");
+}
+
 /*
  * igt_is_dsc_supported_by_sink:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 241fc0ac..b58743b5 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -9,6 +9,7 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+bool igt_is_dsc_supported_by_source(int drmfd);
 bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_enabled(int drmfd, char *connector_name);
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index d142fae2..b46c4449 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -265,7 +265,7 @@ igt_main
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		igt_require(data.disp_ver >= 11);
+		igt_require(is_dsc_supported_by_source(data.drm_fd));
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index c90d833d..61f76dde 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -53,6 +53,16 @@ void kms_dsc_exit_handler(int sig)
 	restore_force_dsc_en();
 }
 
+bool is_dsc_supported_by_source(int drmfd)
+{
+	if (!igt_is_dsc_supported_by_source(drmfd)) {
+		igt_debug("DSC not supported by source\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
 {
 	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
index f66191c7..2109bd76 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -27,6 +27,7 @@ void save_force_dsc_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_en(void);
 void kms_dsc_exit_handler(int sig);
 bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output);
+bool is_dsc_supported_by_source(int drmfd);
 bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
 bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
 void force_dsc_output_format(int drmfd, igt_output_t *output,
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 63da3a1c..e4ab65f2 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -60,9 +60,8 @@ can_bigjoiner(data_t *data)
 	if (intel_display_ver(devid) > 12) {
 		igt_debug("Platform supports uncompressed bigjoiner\n");
 		return true;
-	} else if (intel_display_ver(devid) >= 11) {
+	} else if (igt_is_dsc_supported_by_source(data->drm_fd))
 		return igt_is_dsc_supported_by_sink(data->drm_fd, data->output->name);
-	}
 
 	return false;
 }
-- 
2.25.1
