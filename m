Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8D10E8E0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:50 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:19 +0000
Message-Id: <20231109155410.7-7-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 06/57] drm-uapi/xe: Extend uAPI to query HuC
 micro-controler firmware version
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

Align with commit ("drm/xe/uapi: Extend uAPI to query HuC micro-controler firmware version")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index e6878b688..8b98db8b1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -487,6 +487,7 @@ struct drm_xe_query_topology_mask {
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
 #define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+#define DRM_XE_QUERY_UC_TYPE_HUC		1
 	__u16 uc_type;
 
 	/** @reserved: Reserved */
-- 
2.34.1
