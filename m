Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ADB10EA19
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:59 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:34 +0000
Message-Id: <20231103144359.7-40-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 39/64] fixup! drm-uapi/xe: Split xe_sync types
 from flags
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

---
 include/drm-uapi/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 87daba5b6..9ec0506d5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -908,7 +908,7 @@ struct drm_xe_sync {
 
 	/**
 	 * @timeline_value: Input for the timeline sync object. Needs to be
-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
 	 */
 	__u64 timeline_value;
 
-- 
2.34.1
