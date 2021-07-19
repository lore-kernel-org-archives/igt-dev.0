Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C29B89A56
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 12:18:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 19 Jul 2021 17:49:51 +0530
Message-Id: <20210719121953.14449-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20210719121953.14449-1-bhanuprakash.modem@intel.com>
References: <20210719121953.14449-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_kms: Rename dp_dsc to dsc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

As HDMI also supports DSC, rename *dp_dsc* to *dsc* since it is
no longer DP specific.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++------------
 lib/igt_kms.h | 12 ++++++------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2c44361a40..48873b1e45 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5223,38 +5223,38 @@ int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
 }
 
 /*
- * igt_is_dp_dsc_supported:
+ * igt_is_dsc_supported:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  *
  * Returns: True if DSC is supported for the given connector, false otherwise.
  */
-bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector)
+bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector)
 {
 	return check_dsc_debugfs(drmfd, connector, "DSC_Sink_Support: yes");
 }
 
 /*
- * igt_is_dp_fec_supported:
+ * igt_is_fec_supported:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  *
  * Returns: True if FEC is supported for the given connector, false otherwise.
  */
-bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector)
+bool igt_is_fec_supported(int drmfd, drmModeConnector *connector)
 {
 
 	return check_dsc_debugfs(drmfd, connector, "FEC_Sink_Support: yes");
 }
 
 /*
- * igt_is_dp_dsc_enabled:
+ * igt_is_dsc_enabled:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  *
  * Returns: True if DSC is enabled for the given connector, false otherwise.
  */
-bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector)
+bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector)
 {
 	return check_dsc_debugfs(drmfd, connector, "DSC_Enabled: yes");
 }
@@ -5273,26 +5273,26 @@ bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector)
 }
 
 /*
- * igt_force_dp_dsc_enable:
+ * igt_force_dsc_enable:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  *
  * Returns: 1 on success or negative error code, in case of failure.
  */
-int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector)
+int igt_force_dsc_enable(int drmfd, drmModeConnector *connector)
 {
 	return write_dsc_debugfs(drmfd, connector, "i915_dsc_fec_support", "1");
 }
 
 /*
- * igt_force_dp_dsc_enable:
+ * igt_force_dsc_enable:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  * @bpp: Compressed bpp to be used with DSC
  *
  * Returns: No. of bytes written or negative error code, in case of failure.
  */
-int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
+int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
 {
 	char buf[20] = {0};
 
@@ -5302,13 +5302,13 @@ int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
 }
 
 /*
- * igt_get_dp_dsc_debugfs_fd:
+ * igt_get_dsc_debugfs_fd:
  * @drmfd: A drm file descriptor
  * @connector: Pointer to libdrm connector
  *
  * Returns: fd of the DSC debugfs for the given connector, else returns -1.
  */
-int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
+int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
 {
 	char file_name[128] = {0};
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e87d1913e5..2b054dfc5f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -917,13 +917,13 @@ void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 
-bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector);
-bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector);
-bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector);
+bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector);
+bool igt_is_fec_supported(int drmfd, drmModeConnector *connector);
+bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector);
 bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector);
-int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector);
-int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
+int igt_force_dsc_enable(int drmfd, drmModeConnector *connector);
+int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
 				int bpp);
-int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
+int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
