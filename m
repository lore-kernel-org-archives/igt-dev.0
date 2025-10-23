Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937BCCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 11:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A4A10E3CB;
	Thu, 23 Oct 2025 11:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXCZmV7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2284310E3CB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761218219; x=1792754219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N61rQm9XvhMhFKalG/twQv23dpovZBa1J9bzEtAn5j8=;
 b=CXCZmV7Xb8YqkchGCuA5ydS8wLCPgVT7EkIHR/P/rVSqNTKiu4TilIM+
 0ssT0BdMzheR2lZZzMga/j/CY4sfRhy+B6Sn2stXlm/i8cmHlrzY8vR57
 wZBJ6vbHalx2k9yPThQkqNSDEP4fzrg5yi6a4HbybL5dv7efiMmmcj+rJ
 bQw5Q2Ef+UeOxrflU+6f3AuPoB/mO31C9OOV6veY1zMISmw+xLdZzL6/6
 zM0t+jXwBq/KtuWrIA9TCXMfKWFB/O4UldRkgtkLZyd5wE79crvCT34/U
 xGnhMKRmCN/NedgfuE6OJ29APqbqB4IiOkbMUvEOTHke5+J4wXcNWiNM7 A==;
X-CSE-ConnectionGUID: EaGDT/DjTxe8Fm4jGYA7jg==
X-CSE-MsgGUID: Hi4yZVD/RbWatHJtGzIvtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62593398"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="62593398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:16:59 -0700
X-CSE-ConnectionGUID: UYXMIE2bSC6XXG/HyU/m2w==
X-CSE-MsgGUID: Q7RAV/IDSrGOdOjFrpElRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184200164"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:16:56 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v2,
 1/2] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Thu, 23 Oct 2025 16:43:00 +0530
Message-ID: <20251023111258.2108907-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023111258.2108907-4-sk.anirban@intel.com>
References: <20251023111258.2108907-4-sk.anirban@intel.com>
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
    Fix buffer length issue

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..fef2dda2c 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -197,11 +197,11 @@ static void sysfs_range(int dirfd, int gt)
 #undef N_STEPS
 }
 
-static void __restore_sysfs_freq(int dirfd)
+static void __restore_sysfs_freq(int dirfd, int fd)
 {
 	char buf[256];
 
-	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
+	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
 
 	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
@@ -214,10 +214,18 @@ static void __restore_sysfs_freq(int dirfd)
 
 static void restore_sysfs_freq(int sig)
 {
-	int dirfd, gt;
+	int dirfd, gt, fd;
 
-	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
-		__restore_sysfs_freq(dirfd);
+	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require_gem(fd);
+	sysfs = igt_sysfs_open(fd);
+	igt_assert(sysfs != -1);
+
+	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
+		__restore_sysfs_freq(dirfd, fd);
+
+	close(sysfs);
+	drm_close_driver(fd);
 }
 
 static void __disable_boost(int dirfd)
@@ -262,6 +270,8 @@ igt_main
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

