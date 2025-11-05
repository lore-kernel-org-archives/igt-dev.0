Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983E3CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 14:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7F10E75F;
	Wed,  5 Nov 2025 14:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcLrw9TA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5258310E75D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762351525; x=1793887525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4tcOyYoodDcfrPFHjKQha0YsfLkgOK7rqGgIih3WL+s=;
 b=QcLrw9TAdr8569+WFF9EQZyxus8xT3p4nNtz2DN17xIT4P1S6l1x8D0P
 Ciag78yVCPgSt+z9Sv7rcuDqzve5igGLXZH/I83ozVtm+Id3F9g1AA4A5
 k95AZyGet7w/lNoyi0vPDpMzVKrHTVryjV4pr6Nz51SkIfwTXmk9kNkuq
 Q/nv0ducbzTxNXZdCp5BIfWgHqAOFViomzyqcfEiTpcRoF2pEIY+2T9VU
 7KCn2y4NiBXFes3fbueTM1qCicpdjaoQMQNTzN4mhsAWEOYozzR0CJHaK
 qZiJ2ae2aHjbBAibQsplBPZcDjxEHoM0mUGmUV/bD1jDa+dxOQeeImSYT Q==;
X-CSE-ConnectionGUID: lbJ6mSJ4QCaa/TnPvSh3Hw==
X-CSE-MsgGUID: h1iNMZb6S3atg+63NvUAbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74758109"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="74758109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:25 -0800
X-CSE-ConnectionGUID: 9/Ky5WdrTLCuAFvEmIiwPQ==
X-CSE-MsgGUID: /i5sYhq6THu3sGz4HaYUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187131322"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:22 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v4,
 1/2] tests/intel/gem_ctx_freq: Fix frequency restoration in exit
 handler
Date: Wed,  5 Nov 2025 19:30:30 +0530
Message-ID: <20251105140029.1796233-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105140029.1796233-4-sk.anirban@intel.com>
References: <20251105140029.1796233-4-sk.anirban@intel.com>
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

The exit handler was failing to restore frequencies as it was being called
after the driver was closed. Reopen the driver in the exit handler to
ensure proper frequency restoration.

v2: Use global sysfs variable (Riana)
v3: Remove igt_require_gem (Kamil)
    Use local sysfs variable (Kamil)
    Fix subject line (Kamil)
v4: Fix restore function (Riana)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..bb890d195 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -197,13 +197,13 @@ static void sysfs_range(int dirfd, int gt)
 #undef N_STEPS
 }
 
-static void __restore_sysfs_freq(int dirfd)
+static void __restore_sysfs_freq(int dirfd, int sysfs_fd, int fd)
 {
 	char buf[256];
 
-	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
+	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
 
-	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
+	if (igt_sysfs_read(sysfs_fd, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
 
 	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
@@ -214,10 +214,17 @@ static void __restore_sysfs_freq(int dirfd)
 
 static void restore_sysfs_freq(int sig)
 {
-	int dirfd, gt;
+	int sysfs_fd, dirfd, gt, fd;
 
-	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
-		__restore_sysfs_freq(dirfd);
+	fd = drm_open_driver(DRIVER_INTEL);
+	sysfs_fd = igt_sysfs_open(fd);
+	igt_assert(sysfs_fd != -1);
+
+	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
+		__restore_sysfs_freq(dirfd, sysfs_fd, fd);
+
+	close(sysfs_fd);
+	drm_close_driver(fd);
 }
 
 static void __disable_boost(int dirfd)
@@ -262,6 +269,8 @@ igt_main
 				sysfs_range(dirfd, gt);
 	}
 
-	igt_fixture
+	igt_fixture {
+		close(sysfs);
 		drm_close_driver(i915);
+	}
 }
-- 
2.43.0

