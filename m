Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD1A10E8DE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:49 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:14 +0000
Message-Id: <20231109155410.7-2-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 01/57] drm-uapi/xe: Add check for access
 counter granularity
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

Align with commit ("drm/xe/xe_exec_queue: Add check for access counter granularity")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6ff1106e4..66658d76c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -731,6 +731,20 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/* For use with XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
+
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define XE_ACC_GRANULARITY_128K 0
+
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define XE_ACC_GRANULARITY_2M 1
+
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define XE_ACC_GRANULARITY_16M 2
+
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define XE_ACC_GRANULARITY_64M 3
+
 /**
  * struct drm_xe_exec_queue_set_property - exec queue set property
  *
-- 
2.34.1
