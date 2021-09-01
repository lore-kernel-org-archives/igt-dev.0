Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F976E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 10:41:34 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  1 Sep 2021 16:04:02 +0530
Message-Id: <20210901103402.1253909-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t, V4 2/2] i915_drm.h sync
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Sync to get I915_MMAP_OFFSET_FIXED define value.

Taken from kernel commit:
    commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 include/drm-uapi/i915_drm.h | 1 +
 lib/i915/i915_drm_local.h   | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a1c0030c..b46367f2 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -871,6 +871,7 @@ struct drm_i915_gem_mmap_offset {
 #define I915_MMAP_OFFSET_WC  1
 #define I915_MMAP_OFFSET_WB  2
 #define I915_MMAP_OFFSET_UC  3
+#define I915_MMAP_OFFSET_FIXED 4
 
 	/*
 	 * Zero-terminated chain of extensions.
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 0e3cef81..dd646aed 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -20,8 +20,6 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
-#define I915_MMAP_OFFSET_FIXED 4
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1
