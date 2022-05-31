Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B5910F616
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 12:01:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 17:28:03 +0530
Message-Id: <20220531115805.3941871-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
References: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 1/3] lib/igt_kms: Add helper functions to sort drm
 modes
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

Add helper function to sort drm modes based on the clock, resolution
in both ascending & descending order.

V2:
* Minor changes
V3:
* Added documentaion for helper functions

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 90 ++++++++++++++++++++++++++++++++++++++++++---------
 lib/igt_kms.h | 10 ++++++
 2 files changed, 85 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a25fac74..af4fb85b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1477,6 +1477,78 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 	igt_assert(ret != -1);
 }
 
+/**
+ * sort_drm_modes_by_clk_dsc:
+ * @a: first element
+ * @b: second element
+ *
+ * Comparator function for sorting DRM modes in descending order by clock.
+ */
+int sort_drm_modes_by_clk_dsc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
+}
+
+/**
+ * sort_drm_modes_by_clk_asc:
+ * @a: first element
+ * @b: second element
+ *
+ * Comparator function for sorting DRM modes in ascending order by clock.
+ */
+int sort_drm_modes_by_clk_asc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->clock > mode2->clock) - (mode2->clock > mode1->clock);
+}
+
+/**
+ * sort_drm_modes_by_res_dsc:
+ * @a: first element
+ * @b: second element
+ *
+ * Comparator function for sorting DRM modes in descending order by resolution.
+ */
+int sort_drm_modes_by_res_dsc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay < mode1->hdisplay);
+}
+
+/**
+ * sort_drm_modes_by_res_asc:
+ * @a: first element
+ * @b: second element
+ *
+ * Comparator function for sorting DRM modes in ascending order by resolution.
+ */
+int sort_drm_modes_by_res_asc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay > mode1->hdisplay);
+}
+
+/**
+ * igt_sort_connector_modes:
+ * @connector: libdrm connector
+ * @comparator: comparison function to compare two elements
+ *
+ * Sorts connector modes based on the @comparator.
+ */
+void igt_sort_connector_modes(drmModeConnector *connector,
+			      int (*comparator)(const void *, const void*))
+{
+	qsort(connector->modes,
+	      connector->count_modes,
+	      sizeof(drmModeModeInfo),
+	      comparator);
+}
+
 /**
  * kmstest_get_connector_default_mode:
  * @drm_fd: DRM fd
@@ -4204,16 +4276,6 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 	}
 }
 
-#define for_each_connector_mode(output)		\
-	for (int i__ = 0;  i__ < output->config.connector->count_modes; i__++)
-
-static int sort_drm_modes(const void *a, const void *b)
-{
-	const drmModeModeInfo *mode1 = a, *mode2 = b;
-
-	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
-}
-
 static
 bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 						  igt_output_t *outputs[IGT_MAX_PIPES],
@@ -4230,7 +4292,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 	for_each_connector_mode(output) {
 		int ret;
 
-		igt_output_override_mode(output, &output->config.connector->modes[i__]);
+		igt_output_override_mode(output, &output->config.connector->modes[j__]);
 
 		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
 			return true;
@@ -4271,10 +4333,8 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
 			continue;
 
 		/* Sort the modes in descending order by clock freq. */
-		qsort(output->config.connector->modes,
-		      output->config.connector->count_modes,
-		      sizeof(drmModeModeInfo),
-		      sort_drm_modes);
+		igt_sort_connector_modes(output->config.connector,
+					 sort_drm_modes_by_clk_dsc);
 
 		outputs[n_outputs++] = output;
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ba0bf4d6..0f12d825 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -637,6 +637,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
 		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
 
+#define for_each_connector_mode(output)		\
+	for (int j__ = 0;  j__ < output->config.connector->count_modes; j__++)
+
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
 /**
@@ -957,4 +960,11 @@ void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
 bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
 				char *output_name, unsigned int bpc);
 
+int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
+int sort_drm_modes_by_clk_asc(const void *a, const void *b);
+int sort_drm_modes_by_res_dsc(const void *a, const void *b);
+int sort_drm_modes_by_res_asc(const void *a, const void *b);
+void igt_sort_connector_modes(drmModeConnector *connector,
+		int (*comparator)(const void *, const void*));
+
 #endif /* __IGT_KMS_H__ */
-- 
2.35.1
