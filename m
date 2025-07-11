Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5365DC8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ADB10E263;
	Fri, 11 Jul 2025 07:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr0r9tfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281FF10E263
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752218101; x=1783754101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kTBY9+5YVi0WAOm1rOqXRNFYzH4uN2ok/yrjED9uMc0=;
 b=fr0r9tfWgjMeq5iu9apppoqZB0DMqDgLAT98aMNpphH3m33d015vBI0X
 s1oUXBa3vXN9XoDDmTIPHXhDhG4U61dmzio4epjtFJhhbCmSBKM7ZLSpn
 kI6vD0s/VwDLbbNpxhNJtStA6p5RoBk8n82B+cs2VkafabSazrf7/FEAX
 tv4LpCz4WAQJM/QNPntfFhfEd12VLBDpMUfuV1inU9c0S7YyjfItysYuR
 +YMYkcaSZz+MGmliCbcgJZqrMPACTKs1yzbm6KucO8K/uAclMZ6K32Oiq
 PvxVYFqkKb/7ZfLxO8LRX3V9cMWDV6lU+SxCHnR9J0AAj0afXZwbpD6Zt A==;
X-CSE-ConnectionGUID: 1GItE/9pS4uOu7U+5de9xw==
X-CSE-MsgGUID: PxJTkQUtRCOrLo27EiJ8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54386001"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54386001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:15:01 -0700
X-CSE-ConnectionGUID: oUERKfYGQLuiegqIn8C1+g==
X-CSE-MsgGUID: 9oxL8nZNQmaLDdZwD0RU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156083056"
Received: from unknown (HELO cs1n2.iind.intel.com) ([10.223.104.22])
 by orviesa009.jf.intel.com with ESMTP; 11 Jul 2025 00:14:58 -0700
From: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: khaled.almahallawy@intel.com, jeevaka.badrappan@intel.com,
 kamil.konieczny@intel.com,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Subject: [PATCH i-g-t v2] tools/intel_dp_compliance: Enabling XE driver support
Date: Fri, 11 Jul 2025 12:26:45 +0530
Message-ID: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

i915 and XE driver have different api for mapping buffer. Enabling XE driver
support by selecting XE driver specific map buffer api for XE devices.

Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
----
v2:
 - Updated commit description
---
 tools/igt_dp_compliance.h   |  1 +
 tools/intel_dp_compliance.c | 50 ++++++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index 226a13662871..89bab0e6b8f8 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -33,6 +33,7 @@
 #else
 #include <glib.h>
 #endif
+#include "xe/xe_ioctl.h"
 
 extern int drm_fd;
 
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 99196a450b45..60f064442396 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -350,6 +350,14 @@ static void dump_info(void)
 	igt_dump_crtcs_fd(drm_fd);
 }
 
+static void *map_buffer(int fd, uint32_t handle, size_t size)
+{
+	if (is_xe_device(fd))
+		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
+	else
+		return gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
+}
+
 static int setup_framebuffers(struct connector *dp_conn)
 {
 
@@ -361,15 +369,17 @@ static int setup_framebuffers(struct connector *dp_conn)
 	igt_assert(dp_conn->fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
-					dp_conn->fb_video_pattern.gem_handle,
-					0, dp_conn->fb_video_pattern.size,
-					PROT_READ | PROT_WRITE);
+	dp_conn->pixmap = map_buffer(drm_fd,
+				     dp_conn->fb_video_pattern.gem_handle,
+				     dp_conn->fb_video_pattern.size);
+
 	if (dp_conn->pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
 	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
 
 	/* After filling the device memory with 0s it needs to be unmapped */
@@ -391,15 +401,17 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->failsafe_fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
-						 dp_conn->fb_failsafe_pattern.gem_handle,
-						 0, dp_conn->fb_failsafe_pattern.size,
-						 PROT_READ | PROT_WRITE);
+	dp_conn->failsafe_pixmap = map_buffer(drm_fd,
+					      dp_conn->fb_failsafe_pattern.gem_handle,
+					      dp_conn->fb_failsafe_pattern.size);
+
 	if (dp_conn->failsafe_pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
 	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
 
 	/* After filling the device framebuffer the mapped memory needs to be freed */
@@ -428,15 +440,17 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->test_pattern.fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
-						     dp_conn->test_pattern.fb_pattern.gem_handle,
-						     0, dp_conn->test_pattern.fb_pattern.size,
-						     PROT_READ | PROT_WRITE);
+
+	dp_conn->test_pattern.pixmap = map_buffer(drm_fd,
+						  dp_conn->test_pattern.fb_pattern.gem_handle,
+						  dp_conn->test_pattern.fb_pattern.size);
+
 	if (dp_conn->test_pattern.pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
 
-- 
2.49.0

