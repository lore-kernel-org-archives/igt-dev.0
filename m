Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB7CC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 17:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E110E488;
	Wed, 14 Feb 2024 17:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h72eOQH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFC110E214
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707930819; x=1739466819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WHeaqg9AOwHta1kvr5M92zZiFvUNalEI+FDf5+MKQOg=;
 b=h72eOQH+kBUW49dQLdy0u3WxvOnWjeYHhW4wAWRPsz6KFFdJRYpqhqqM
 W5ES3UNt8djl17DncjrFyMnDTWnXoJAxZ/A0SUCfxFXO+q6qkNNU5g6Qr
 8EZcKoHVDpWftSSkb8Av3CCVeBUK9RZrEuOMBmAKcT/eViPs9nc07wzES
 DCOhHGPNmL7qasek/kAYsm7HCMpwOnnP1fnKiKNkQ0UfG0Bw/iF0xGm16
 6DGvYMoyc39R3LyhIU+BP+g0ZpKZ8NeRcMMboFz0h0suRng0zkWr7jFDY
 BD7wkDY/LZk1VXKKL+tE7Zv8qKVdYnorghdzz6lKao5utIwMyXGALmFKT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2114096"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2114096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 09:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3324125"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 09:13:36 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/i915_drm: sync with drm-intel-gt-next
Date: Wed, 14 Feb 2024 09:13:18 -0800
Message-ID: <20240214171319.148482-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Sync drm-uapi header i915_drm.h with with b11236486749 ("drm/i915: Add GuC submission interface version query").

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm-uapi/i915_drm.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index ce9fa2812..fe3cf9bca 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -693,7 +693,7 @@ typedef struct drm_i915_irq_wait {
 #define I915_PARAM_HAS_EXEC_FENCE	 44
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to capture
- * user specified bufffers for post-mortem debugging of GPU hangs. See
+ * user-specified buffers for post-mortem debugging of GPU hangs. See
  * EXEC_OBJECT_CAPTURE.
  */
 #define I915_PARAM_HAS_EXEC_CAPTURE	 45
@@ -1606,7 +1606,7 @@ struct drm_i915_gem_busy {
 	 * is accurate.
 	 *
 	 * The returned dword is split into two fields to indicate both
-	 * the engine classess on which the object is being read, and the
+	 * the engine classes on which the object is being read, and the
 	 * engine class on which it is currently being written (if any).
 	 *
 	 * The low word (bits 0:15) indicate if the object is being written
@@ -1815,7 +1815,7 @@ struct drm_i915_gem_madvise {
 	__u32 handle;
 
 	/* Advice: either the buffer will be needed again in the near future,
-	 *         or wont be and could be discarded under memory pressure.
+	 *         or won't be and could be discarded under memory pressure.
 	 */
 	__u32 madv;
 
@@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3246,7 +3248,7 @@ struct drm_i915_query_topology_info {
  * 	// enough to hold our array of engines. The kernel will fill out the
  * 	// item.length for us, which is the number of bytes we need.
  * 	//
- * 	// Alternatively a large buffer can be allocated straight away enabling
+ *	// Alternatively a large buffer can be allocated straightaway enabling
  * 	// querying in one pass, in which case item.length should contain the
  * 	// length of the provided buffer.
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
@@ -3256,7 +3258,7 @@ struct drm_i915_query_topology_info {
  * 	// Now that we allocated the required number of bytes, we call the ioctl
  * 	// again, this time with the data_ptr pointing to our newly allocated
  * 	// blob, which the kernel can then populate with info on all engines.
- * 	item.data_ptr = (uintptr_t)&info,
+ *	item.data_ptr = (uintptr_t)&info;
  *
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
  * 	if (err) ...
@@ -3286,7 +3288,7 @@ struct drm_i915_query_topology_info {
 /**
  * struct drm_i915_engine_info
  *
- * Describes one engine and it's capabilities as known to the driver.
+ * Describes one engine and its capabilities as known to the driver.
  */
 struct drm_i915_engine_info {
 	/** @engine: Engine class and instance. */
@@ -3566,6 +3568,16 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * struct drm_i915_query_guc_submission_version - query GuC submission interface version
+ */
+struct drm_i915_query_guc_submission_version {
+	__u32 branch;
+	__u32 major;
+	__u32 minor;
+	__u32 patch;
+};
+
 /**
  * DOC: GuC HWCONFIG blob uAPI
  *
-- 
2.43.1

