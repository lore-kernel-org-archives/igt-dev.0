Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323F10E23D
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 00:30:04 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/2] drm-uapi/xe: Add IP version to GT query
Date: Thu,  7 Dec 2023 16:29:43 -0800
Message-ID: <20231208002944.1290951-2-matthew.d.roper@intel.com>
In-Reply-To: <20231208002944.1290951-1-matthew.d.roper@intel.com>
References: <20231208002944.1290951-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

v2:
 - s/revid/rev/ to match rename on kernel series

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm-uapi/xe_drm.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 590f7b7af..19048956b 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -396,8 +396,16 @@ struct drm_xe_gt {
 	 * memory and memory living in a different tile.
 	 */
 	__u64 far_mem_regions;
+	/** @ip_ver_major: Graphics/media IP major version on GMD_ID platforms */
+	__u16 ip_ver_major;
+	/** @ip_ver_minor: Graphics/media IP minor version on GMD_ID platforms */
+	__u16 ip_ver_minor;
+	/** @ip_ver_rev: Graphics/media IP revision version on GMD_ID platforms */
+	__u16 ip_ver_rev;
+	/** @pad2: MBZ */
+	__u16 pad2;
 	/** @reserved: Reserved */
-	__u64 reserved[8];
+	__u64 reserved[7];
 };
 
 /**
-- 
2.43.0
