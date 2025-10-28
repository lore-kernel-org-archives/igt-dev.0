Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E31CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 19:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFE210E650;
	Tue, 28 Oct 2025 19:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGLs8/Vn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF4510E64D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761680388; x=1793216388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eilRlXMG0WZa64LEYk/ctQM8cbQpLI+Uo41VKfoAU9w=;
 b=BGLs8/Vn/T5UzG+pzEEHFuZHjo1GUPMiShSbRTb+x80dQq3soK0A/iEj
 CnzdauqmXEE7ID9TzQpqLN5J0mr2RPrrAM9Mnk5B1auDrSwKPqkv3vZB1
 yySlc9ygnjAh5vdGhytm+gOetMikHD7EUdBsWbmNaug6o00Gm0BBXByhj
 /+QW6Is9326lczU3dpP+EWy2T28eiCbcoHlERPQV/5gOFb7L45flsvkHd
 Dc/+NgI8vV4d9hFjZCXxX1/52HZGQUxR78Hx3T+FKyvt4sV/sMjVu+XwV
 xUZA6rVr7eq6MkEQsTENx0e1PMwd4HMJ7qRy6QE73nSP6KnD0SkN8qFtj w==;
X-CSE-ConnectionGUID: ArU4R6eaQzKBhPxJzvO7pA==
X-CSE-MsgGUID: JOy2wdm8QcOBMDqLofDrKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63700419"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63700419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:48 -0700
X-CSE-ConnectionGUID: ogNmlQvIRayM1f6SmmfmbA==
X-CSE-MsgGUID: 76dgtzl6QRml6DjBnbgS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185079881"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:46 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 1/2] tests/intel/gem_ctx_freq: Fix frequency restoration in exit
 handler
Date: Wed, 29 Oct 2025 01:05:21 +0530
Message-ID: <20251028193519.3273563-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028193519.3273563-4-sk.anirban@intel.com>
References: <20251028193519.3273563-4-sk.anirban@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..ea6ba9ad9 100644
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
+		__restore_sysfs_freq(dirfd, fd);
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

