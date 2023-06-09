Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ECE10E13F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 15:44:20 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 16:43:31 +0100
Message-Id: <20230609154336.516503-2-matthew.auld@intel.com>
In-Reply-To: <20230609154336.516503-1-matthew.auld@intel.com>
References: <20230609154336.516503-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/6] xe: sync small-bar uapi
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

We need a couple new fields for the region query and the new flag to
ensure the buffer is CPU accessible.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm-uapi/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba5..441b377b7 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -169,7 +169,9 @@ struct drm_xe_query_mem_usage {
 		__u32 max_page_size;
 		__u64 total_size;
 		__u64 used;
-		__u64 reserved[8];
+		__u64 cpu_visible_size;
+		__u64 cpu_visible_used;
+		__u64 reserved[6];
 	} regions[];
 };
 
@@ -270,6 +272,7 @@ struct drm_xe_gem_create {
 	 */
 #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
 #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
+#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
 	__u32 flags;
 
 	/**
-- 
2.40.1
