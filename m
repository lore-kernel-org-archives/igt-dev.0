Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5F2113FE1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 08:48:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 14:16:29 +0530
Message-Id: <20220627084630.120929-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] lib/igt_kms: Add a helper to check the
 max_bpc constraints
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

The "max bpc" property only ensures that the bpc will not go beyond
the value set through this property. It does not guarantee that the
same bpc will be used for the given mode.

If clock/bandwidth constraints permit, the max bpc will be used to
show the mode, otherwise the bpc will be reduced. So, if we really
want a particular bpc set, we can try reducing the resolution, till
we get the bpc that we set in max bpc property.

This patch will add a helper to iterate over all connector modes,
and return True if there is a valid mode to use the same bpc as set
by max_bpc property, else False.

Cc: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bd606548..35504675 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5637,6 +5637,44 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
 	return (current == bpc);
 }
 
+/*
+ * igt_max_bpc_constraint
+ * @display: a pointer to an #igt_display_t structure
+ * @pipe: Display pipe
+ * @output: Target output
+ * @bpc: BPC to compare with max & current bpc
+ *
+ * The "max bpc" property only ensures that the bpc will not go beyond
+ * the value set through this property. It does not guarantee that the
+ * same bpc will be used for the given mode.
+ *
+ * So, if we really want a particular bpc set, try reducing the resolution
+ * till we get the bpc that we set in max bpc property.
+ *
+ * Returns: True if suitable mode found to use requested bpc, else False.
+ */
+bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
+			    igt_output_t *output, int bpc)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	for_each_connector_mode(output) {
+		igt_output_override_mode(output, &connector->modes[j__]);
+		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
+						output->name, bpc))
+			continue;
+
+		return true;
+	}
+
+	igt_output_override_mode(output, NULL);
+	return false;
+}
+
 /*
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3e674e74..8e26f405 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -968,6 +968,8 @@ int sort_drm_modes_by_res_asc(const void *a, const void *b);
 void igt_sort_connector_modes(drmModeConnector *connector,
 		int (*comparator)(const void *, const void*));
 
+bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
+		igt_output_t *output, int bpc);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.35.1
