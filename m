Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04CCCD18E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 19:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AD410E236;
	Tue, 14 Oct 2025 19:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjfPonPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C057C10E236
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470097; x=1792006097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QNZ0z1PYnSdu0t2bSmVmkTxdqpWPac+4l2dRMLpgR+4=;
 b=BjfPonPYrmFoKoVEp0W2exiIjvA6JuqcLt5i35BmcYfC4NlOi4518HOv
 HnxgFhZEYofN3AIHcfx7LLaMvbXbRLjjY5M/y3O4WQC7muiCvk2x38lAS
 XTB9uf9CsGGK3UkSggQD+dbGHPWEcrxgjD+G+mhA/M5N9loGa1IGWXFRd
 gz4qr37usym0KAgntZK9OKZaG9kxR05b6+YPAi2k2gMPcNUnGHmEUUN5h
 AJeCE4Tya+aiwzTL6aDrEaIFUuUXYqWcsym4+SjjgZ3gvPnnWciVsJGwS
 3IkoKoXOX2Ok/C1x6wBeJeSje8XtnJJHnxnYBac13/i96V30O0VA7Zt4o A==;
X-CSE-ConnectionGUID: cOPNBvRFSdqSvZ9Zs3YekA==
X-CSE-MsgGUID: RxIbgJDLSsSX7BKWIx0Huw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61672203"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="61672203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:28:16 -0700
X-CSE-ConnectionGUID: 7RGIOhsHQlmrTqPntC3euA==
X-CSE-MsgGUID: jiy5ePjJQiyoJMsXGeu1bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181972918"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:28:14 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,
 v2] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Wed, 15 Oct 2025 00:54:59 +0530
Message-ID: <20251014192458.1277774-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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
 tests/intel/gem_ctx_freq.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..6cc349b15 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -197,16 +197,22 @@ static void sysfs_range(int dirfd, int gt)
 #undef N_STEPS
 }
 
-static void __restore_sysfs_freq(int dirfd)
+static void __restore_sysfs_freq(int dirfd, int fd)
 {
 	char buf[256];
+	int len;
 
-	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
+	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
 
-	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
+	len = igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
+	}
 
-	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
+	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
 		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
 	}
@@ -214,10 +220,18 @@ static void __restore_sysfs_freq(int dirfd)
 
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
@@ -262,6 +276,8 @@ igt_main
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

