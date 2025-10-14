Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B76CCD192
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 13:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BFE10E081;
	Tue, 14 Oct 2025 13:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNk4zHbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C9910E081
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760449114; x=1791985114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZkBnGIDe+nCCAOjwrR7WWN0LC9LTo8MoZ/Et9K+13AA=;
 b=XNk4zHbOYJNohiKYxo5u/Jt08Q0ApbjI62ZlFghywZ9sdKwpM7BVljpX
 zoBx6hOQwBATYo46hA44KVOjP99Zf89G9KEqG1EtVI/V0IVvRFF6fmIr7
 xH9O2079PIRsidbo00jhsThZIH3vgTtKDdZXiUpYZcinZu3otppYDVdh3
 R7pRTtCPsa79GkT6jpKYNSiGkVgPAKogPxP03L66i1uqV1uP5QYNGk4se
 KxMyxBj80u6DFtVW5m8tKm+oDfCu8LwNa6FjVE/EfqaXIW0sPmgNH3w9/
 b+bTkjsGOQyfYCmqwTfoPGqC6miu3uM0+sq1CMLRct6hL98amu41ZO3jK g==;
X-CSE-ConnectionGUID: TfhzC7OlScOExBGOMP66wg==
X-CSE-MsgGUID: aw0cdcpRSeK3qUX8u9z14Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66264410"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66264410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 06:38:34 -0700
X-CSE-ConnectionGUID: JZqZwf2JQjyS8xBLejNiNA==
X-CSE-MsgGUID: fv6gEuUrQjSnF3eph+Vaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181897962"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 06:38:30 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Tue, 14 Oct 2025 19:05:11 +0530
Message-ID: <20251014133510.1151474-2-sk.anirban@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..a9bc9a017 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -214,10 +214,18 @@ static void __restore_sysfs_freq(int dirfd)
 
 static void restore_sysfs_freq(int sig)
 {
-	int dirfd, gt;
+	int sysfs_restore, dirfd, gt, fd;
 
-	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require_gem(fd);
+	sysfs_restore = igt_sysfs_open(fd);
+	igt_assert(sysfs_restore != -1);
+
+	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
 		__restore_sysfs_freq(dirfd);
+
+	close(sysfs_restore);
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

