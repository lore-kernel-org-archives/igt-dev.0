Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407210E1B5
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 06:54:43 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 12:24:05 +0530
Message-Id: <20230531065407.362625-2-swati2.sharma@intel.com>
In-Reply-To: <20230531065407.362625-1-swati2.sharma@intel.com>
References: <20230531065407.362625-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests:
 s/igt_is_dsc_supported/igt_is_dsc_supported_by_sink
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

Rename helper.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c               | 6 +++---
 lib/igt_dsc.h               | 2 +-
 tests/i915/kms_dsc_helper.c | 2 +-
 tests/kms_invalid_mode.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 9e1ab9b1..6cbd8bae 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -42,13 +42,13 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
 }
 
 /*
- * igt_is_dsc_supported:
+ * igt_is_dsc_supported_by_sink:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
  *
- * Returns: True if DSC is supported for the given connector, false otherwise.
+ * Returns: True if DSC is supported for the given connector/sink, false otherwise.
  */
-bool igt_is_dsc_supported(int drmfd, char *connector_name)
+bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name)
 {
 	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
 }
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 9608aad4..241fc0ac 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -9,7 +9,7 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
-bool igt_is_dsc_supported(int drmfd, char *connector_name);
+bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index 02d1a484..1adf920b 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -55,7 +55,7 @@ void kms_dsc_exit_handler(int sig)
 
 bool check_dsc_on_connector(int drmfd, igt_output_t *output)
 {
-	if (!igt_is_dsc_supported(drmfd, output->name)) {
+	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
 		igt_debug("DSC not supported on connector %s\n",
 			  output->name);
 		return false;
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index ec048305..63da3a1c 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -61,7 +61,7 @@ can_bigjoiner(data_t *data)
 		igt_debug("Platform supports uncompressed bigjoiner\n");
 		return true;
 	} else if (intel_display_ver(devid) >= 11) {
-		return igt_is_dsc_supported(data->drm_fd, data->output->name);
+		return igt_is_dsc_supported_by_sink(data->drm_fd, data->output->name);
 	}
 
 	return false;
-- 
2.25.1
