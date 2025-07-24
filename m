Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D76C83F26
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 05:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022210E87B;
	Thu, 24 Jul 2025 05:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKt3DsXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CBE10E87B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753335760; x=1784871760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HeuEh5Cf9MxKa+VMUXyzm6Rf2Zt6g0z58audPyr0xso=;
 b=IKt3DsXg1gbiL3Bfj1gn7yQeMdnm+gbhuSMaPEN/Gmh5EFMOQzml9X6e
 yknkx9txy8KuUfmzrZZ7aJ4eVuU9M1YUm1XsNsfds9ed3I4zYPDTaFRRk
 IwCO0sBVxO3R6O0pswz6gR24LHVyk1WR3Vhve26GAiYsTN6TSLDdZttC9
 9WGC46yQ5DTanXXJmL9oXcSIknm/5linKswK/3W1VPmJAAFVMYp3UyrZq
 Mj1OVbDYghwQ5gcRvuuytEuGWXIUJ8dbqfIxob037YX3SpsKcoa23Xn7J
 5dSPnCGziRHL2rxH0jjqAMPRHUVNLjvgC7N5TiqqeGQsgogIZibNt8lJv g==;
X-CSE-ConnectionGUID: bxKVbQVsSYKY39KUIrxiug==
X-CSE-MsgGUID: 5UmEm4z+RlGXbqPkrTa/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55510407"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="55510407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:42:39 -0700
X-CSE-ConnectionGUID: KVM2HeCDRnKj9CVSEW8PrQ==
X-CSE-MsgGUID: /OwRVCY+RMG6Uafn+d28Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160263710"
Received: from unknown (HELO cs1n2.iind.intel.com) ([10.223.104.22])
 by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2025 22:42:36 -0700
From: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: khaled.almahallawy@intel.com, jeevaka.badrappan@intel.com,
 ville.syrjala@intel.com, swati2.sharma@intel.com,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Subject: [PATCH i-g-t v4] tools/intel_dp_compliance: Enabling XE driver support
Date: Thu, 24 Jul 2025 10:53:39 +0530
Message-ID: <20250724052339.955668-1-disantkumar.isvarbhai.mistry@intel.com>
X-Mailer: git-send-email 2.49.0
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

i915 and XE driver have different api for mapping buffer. Enabling XE
driver support by using igt_fb_map_buffer function which call mapping
buffer api based on device type.

Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
-----------
v2 - Fixed Alignment (Kamil)
v3 - Utilizing existing lib function igt_fb_map_buffer (Syrjälä)
v4 - updating version history (Swati)
-----------
---
 tools/intel_dp_compliance.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 99196a450b45..31572f6c3ebc 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -361,15 +361,10 @@ static int setup_framebuffers(struct connector *dp_conn)
 	igt_assert(dp_conn->fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
-					dp_conn->fb_video_pattern.gem_handle,
-					0, dp_conn->fb_video_pattern.size,
-					PROT_READ | PROT_WRITE);
+	dp_conn->pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_video_pattern);
 	if (dp_conn->pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
 
 	/* After filling the device memory with 0s it needs to be unmapped */
@@ -391,15 +386,10 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->failsafe_fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
-						 dp_conn->fb_failsafe_pattern.gem_handle,
-						 0, dp_conn->fb_failsafe_pattern.size,
-						 PROT_READ | PROT_WRITE);
+	dp_conn->failsafe_pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_failsafe_pattern);
 	if (dp_conn->failsafe_pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
 
 	/* After filling the device framebuffer the mapped memory needs to be freed */
@@ -428,16 +418,10 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->test_pattern.fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
-						     dp_conn->test_pattern.fb_pattern.gem_handle,
-						     0, dp_conn->test_pattern.fb_pattern.size,
-						     PROT_READ | PROT_WRITE);
+	dp_conn->test_pattern.pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->test_pattern.fb_pattern);
 	if (dp_conn->test_pattern.pixmap == NULL)
 		return -1;
 
-	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-
 	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
 
 	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);
-- 
2.49.0

