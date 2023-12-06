Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968EC10E78D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 20:49:52 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 12:49:41 -0800
Message-ID: <20231206204942.1105505-2-matthew.d.roper@intel.com>
In-Reply-To: <20231206204942.1105505-1-matthew.d.roper@intel.com>
References: <20231206204942.1105505-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] drm-uapi/xe: Add IP version to GT query
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

Align with commit ("drm/xe/uapi: Add IP version and stepping to GT list
query")

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm-uapi/xe_drm.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 590f7b7af..dcb7582c8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -396,8 +396,16 @@ struct drm_xe_gt {
 	 * memory and memory living in a different tile.
 	 */
 	__u64 far_mem_regions;
+	/** @ip_ver_major: Graphics/media IP major version on GMD_ID platforms */
+	__u16 ip_ver_major;
+	/** @ip_ver_major: Graphics/media IP minor version on GMD_ID platforms */
+	__u16 ip_ver_minor;
+	/** @ip_ver_major: Graphics/media IP revision ID on GMD_ID platforms */
+	__u16 ip_ver_revid;
+	/** @pad2: MBZ */
+	__u16 pad2;
 	/** @reserved: Reserved */
-	__u64 reserved[8];
+	__u64 reserved[7];
 };
 
 /**
-- 
2.43.0
