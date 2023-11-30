Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F5F10E72D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 16:13:40 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 08:02:52 -0800
Message-Id: <20231130160253.3787505-2-jonathan.cavitt@intel.com>
In-Reply-To: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
References: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/2] lib/i915: Add
 DRM_I915_QUERY_L3BANK_COUNT query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add local specifications for DRM_I915_QUERY_L3BANK_COUNT query.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/i915_drm_local.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index af0176500d..9257c519bb 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -22,6 +22,19 @@ extern "C" {
 #define I915_ENGINE_CLASS_COMPUTE 4
 
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
+#define DRM_I915_QUERY_L3BANK_COUNT		7
+
+/**
+ * DOC: L3 Bank Count Query uAPI
+ *
+ * The L3 bank count query called through the query id
+ * DRM_I915_QUERY_L3BANK_COUNT and returns the count of
+ * the available L3 Banks on a given engine.
+ *
+ * The count itself is an integer, and since no additional
+ * data is returned, the count is returned as such.
+ */
+
 
 #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
 #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
-- 
2.25.1
