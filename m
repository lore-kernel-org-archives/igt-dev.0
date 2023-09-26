Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8E10E3D7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:33 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:51 +0000
Message-Id: <20230926130054.6-22-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 21/24] drm-uapi/xe: Align with uAPI update
 query HuC micro-controler firmware version
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

Align with commit ("drm/xe: Extend uAPI to query HuC micro-controler firmware version")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9931232f2..69b5189ab 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
 struct drm_xe_query_uc_fw_version {
 	/** @uc: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.34.1
