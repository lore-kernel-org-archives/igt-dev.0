Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B95C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 05:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9F510E717;
	Wed,  9 Jul 2025 05:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQktwSyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285A10E717
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 05:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752038827; x=1783574827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0TEX2++zimuQ0lIRMBisyCmz7Dld3o8mSkQCSliX+vs=;
 b=hQktwSyjBLiarZIBG97DCruXcO9FeLyVuMsw+is6nOioZ7PyiQh/BtSM
 tJ41eJ4JNCMqsYSyQM7Aw/swtvlxEHgzSFCnJTaHZ2rmV88BYEwThNhnL
 bKAfJm220FhY7PGfr1sfjj+4hbWqztHwsw2GLnYgGSIVs2ZfoC/xfLN14
 rZ/0acUi/7V0OA8Ly0qKPj0FrCOYHFAcJIHVsbFlfta1gOR7EC9FPZ/6N
 k+tEr95Gydi08faSL3DHYNJfSAoIGaoRyKCGK7BRS0m+hybDDDhE/Ngvu
 y3A48mHvUHldKmbznPFuVxnhOO+HHCP71YUtmJOKi+Q9cq+4YTj3+kLdx Q==;
X-CSE-ConnectionGUID: 1mDCLaEZTPOVyrWxOtFRng==
X-CSE-MsgGUID: oc/93js5RluqG4Hyt3+8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64537115"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64537115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 22:27:07 -0700
X-CSE-ConnectionGUID: XX02QpiYSNi04ZnUmC7NpQ==
X-CSE-MsgGUID: vV0sAJwORrmcH/iMvELdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156254871"
Received: from unknown (HELO cs1n2.iind.intel.com) ([10.223.104.22])
 by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2025 22:27:05 -0700
From: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: khaled.almahallawy@intel.com, jeevaka.badrappan@intel.com,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Subject: [PATCH i-g-t] tools/intel_dp_compliance: Enabling XE driver support
Date: Wed,  9 Jul 2025 10:37:44 +0530
Message-ID: <20250709050744.3050283-1-disantkumar.isvarbhai.mistry@intel.com>
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

i915 and XE driver has different api for mapping buffer. Enabling XE driver
support by selecting XE driver specific map buffer api for XE devices.

Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
----
v2:
 - Updated commit description
---
 tools/igt_dp_compliance.h   |  1 +
 tools/intel_dp_compliance.c | 43 +++++++++++++++++++++++++------------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index 226a13662871..b4357ca55733 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -33,6 +33,7 @@
 #else
 #include <glib.h>
 #endif
+#include <xe/xe_ioctl.h>
 
 extern int drm_fd;
 
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 99196a450b45..2b2ffd402dc6 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -349,7 +349,14 @@ static void dump_info(void)
 	igt_dump_connectors_fd(drm_fd);
 	igt_dump_crtcs_fd(drm_fd);
 }
-
+static void *map_buffer(int fd, uint32_t handle, size_t size)
+{
+	if (is_xe_device(fd))
+		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
+	else
+		return gem_mmap__device_coherent(fd, handle, 0, size,
+				PROT_READ | PROT_WRITE);
+}
 static int setup_framebuffers(struct connector *dp_conn)
 {
 
@@ -361,15 +368,19 @@ static int setup_framebuffers(struct connector *dp_conn)
 	igt_assert(dp_conn->fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
+
+	dp_conn->pixmap = map_buffer(drm_fd,
 					dp_conn->fb_video_pattern.gem_handle,
-					0, dp_conn->fb_video_pattern.size,
-					PROT_READ | PROT_WRITE);
+					dp_conn->fb_video_pattern.size);
+
 	if (dp_conn->pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
+
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
 	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
 
 	/* After filling the device memory with 0s it needs to be unmapped */
@@ -391,15 +402,17 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->failsafe_fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
+	dp_conn->failsafe_pixmap = map_buffer(drm_fd,
 						 dp_conn->fb_failsafe_pattern.gem_handle,
-						 0, dp_conn->fb_failsafe_pattern.size,
-						 PROT_READ | PROT_WRITE);
+						 dp_conn->fb_failsafe_pattern.size);
+
 	if (dp_conn->failsafe_pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
+	       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
 
 	/* After filling the device framebuffer the mapped memory needs to be freed */
@@ -428,14 +441,16 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->test_pattern.fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
+
+	dp_conn->test_pattern.pixmap = map_buffer(drm_fd,
 						     dp_conn->test_pattern.fb_pattern.gem_handle,
-						     0, dp_conn->test_pattern.fb_pattern.size,
-						     PROT_READ | PROT_WRITE);
+						     dp_conn->test_pattern.fb_pattern.size);
+
 	if (dp_conn->test_pattern.pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
-- 
2.49.0

