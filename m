Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CA410E8A1
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 14:19:20 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:18:40 +0000
Message-Id: <20231011141841.7-20-francois.dugast@intel.com>
In-Reply-To: <20231011141841.7-1-francois.dugast@intel.com>
References: <20231011141841.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v1 19/20] drm-uapi/xe: Align with GuC version type
 update
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with kernel commit ("drm/xe/uapi: Be more specific around GuC Version Type")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6e29a6776..ce1a1cc2e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -468,11 +468,23 @@ struct drm_xe_query_topology_mask {
  *
  * Given a uc_type this will return the major, minor, patch and branch version
  * of the micro-controller firmware.
+ *
+ * The @uc_type can be:
+ *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
+ * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ * support multiple VF APIs with different Submission Versions. This version is
+ * negotiated by the VF KMD with GuC during VF initialization. In most of the
+ * current available GuC blobs, this is a 1-1 relationship where the Submission
+ * version could be inferred from the running version and vice-versa. However,
+ * the submission version is the most useful information for the user space
+ * perspective and needs.
+ *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
+ * in the platform. It returns 0 when HuC is not currently loaded.
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
-#define DRM_XE_QUERY_UC_TYPE_GUC	0
-#define DRM_XE_QUERY_UC_TYPE_HUC	1
+#define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+#define DRM_XE_QUERY_UC_TYPE_HUC		1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.34.1
