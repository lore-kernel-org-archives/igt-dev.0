Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BE110EA72
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 08:46:17 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_kms: move bigjoiner_mode_found to lib.
Date: Fri, 12 Jan 2024 14:25:46 +0530
Message-Id: <20240112085547.673712-2-kunal1.joshi@intel.com>
In-Reply-To: <20240112085547.673712-1-kunal1.joshi@intel.com>
References: <20240112085547.673712-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

move bigjoiner_mode_found to lib/igt_kms with some modification

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c                | 19 +++++++++++++++++++
 lib/igt_kms.h                |  3 +++
 tests/intel/kms_big_joiner.c | 14 ++------------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..2c55af05f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6142,6 +6142,25 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 		mode->clock > max_dotclock);
 }
 
+/**
+ * bigjoiner_mode_found:
+ * @connector: libdrm connector
+ * @sort_method: comparator method
+ * @mode: libdrm mode
+ *
+ * Returns: True if big joiner found in connector modes
+ */
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int (*sort_method)(const void *, const void*),
+			  drmModeModeInfo *mode)
+{
+        igt_sort_connector_modes(connector, sort_method);
+        *mode = connector->modes[0];
+
+        return igt_bigjoiner_possible(mode,
+				      igt_get_max_dotclock(drm_fd));
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..9f5676d35 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1212,6 +1212,9 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+                                 int (*sort_method)(const void *, const void*),
+                                 drmModeModeInfo *mode);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index aba2adfbe..1858c6362 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
-static bool bigjoiner_mode_found(drmModeConnector *connector,
-				 int (*sort_method)(const void *, const void*),
-				 drmModeModeInfo *mode)
-{
-	igt_sort_connector_modes(connector, sort_method);
-	*mode = connector->modes[0];
-
-	return igt_bigjoiner_possible(mode, max_dotclock);
-}
-
 igt_main
 {
 	data_t data;
@@ -235,8 +225,8 @@ igt_main
 			 * Bigjoiner will come in to the picture when the
 			 * resolution > 5K or clock > max-dot-clock.
 			 */
-			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
-				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
+			found = (bigjoiner_mode_found(data.drm_fd, connector, sort_drm_modes_by_res_dsc, &mode) ||
+				 bigjoiner_mode_found(data.drm_fd, connector, sort_drm_modes_by_clk_dsc, &mode)) ?
 					true : false;
 
 			if (found) {
-- 
2.25.1
