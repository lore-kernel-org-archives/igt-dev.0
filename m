Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7610E214
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:43 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:21 +0000
Message-Id: <20231114134426.7-4-francois.dugast@intel.com>
In-Reply-To: <20231114134426.7-1-francois.dugast@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 3/8] drm-uapi/xe: Change rsvd to pad in struct
 drm_xe_class_instance
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

Align with commit ("drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 68d005202..32f6cf631 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -141,7 +141,8 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
-	__u16 rsvd;
+	/** @pad: MBZ */
+	__u16 pad;
 };
 
 /**
-- 
2.34.1
