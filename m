Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C6DFD9E21
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 23:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC60010E09B;
	Thu, 26 Feb 2026 23:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIuP1ZnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A4D10E09B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772147442; x=1803683442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MKxO3ltVKgXH3jOB1URsj2QtZvWLPaeQfDjLrI1gb/4=;
 b=VIuP1ZnA2FFmK3SC4J5eLmrwiaL9Rj+2q8Oq8RZ6kVCey6BFOZLkvZpn
 m9f/ESKJc7yzhYThNRGx6bDynz697a2oiUQEowV34LFPIcUStZd/W0gyH
 PX20WsYJmU/uoT+pcESiaKW020aSIGh8s3OjwYKSC1DPuMu2GYK0Ea+Xp
 ksMEcP4xCacAnzxTwelpA3iqkyAtfMEyxxJgHIRYa9Zlpaq9lqE9oDt5q
 x9/Ejx9YBoYeFza95nrpVi2BRlKUfDwg3OaCVpC7PPS4+nbUQroGYkp0b
 QPuIKGRYEc8al5gpKGbsOsNVAGfqgZ/e8cJOEGg9z0sUNtu/Lo1haqUAv A==;
X-CSE-ConnectionGUID: cLo8za9xR5WTR/Dgh0laig==
X-CSE-MsgGUID: 9o7V0UEETcm4VdeeZqgEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73098481"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73098481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:10:39 -0800
X-CSE-ConnectionGUID: uZh2Z0RUSemaPXlfO5RnIA==
X-CSE-MsgGUID: ++YmOTKoTtiIM7LYg6/yZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="254491051"
Received: from dut4086lnl.fm.intel.com ([10.105.10.85])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:10:37 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] tests/intel/kms: Drop unneeded igt_device_set_master calls
Date: Thu, 26 Feb 2026 23:10:37 +0000
Message-ID: <20260226231036.83942-2-jonathan.cavitt@intel.com>
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

In kms_fbcon_fbt, igt_set_device_master is already called on the target
fd by drm_open_driver_master, so doing so again in the subtest function
is unnecessary.

In kms_pm_rpm, we call __drm_open_driver and igt_set_device_master while
asserting the return of the former is not -1.  This is already
accomplished by drm_open_driver_master, which also has additional guards
in place for i915, so just call that instead.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 1 -
 tests/intel/kms_pm_rpm.c    | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 36de84f985..e44be15f60 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -371,7 +371,6 @@ static void restore_fbcon(struct drm_info *drm)
 
 static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 {
-	igt_device_set_master(drm->fd);
 	kmstest_set_vt_graphics_mode();
 
 	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 5f24fd49b1..e16218ceeb 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -750,9 +750,7 @@ static bool setup_environment(void)
 	if (has_runtime_pm)
 		goto out;
 
-	drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
-	igt_require(drm_fd != -1);
-	igt_device_set_master(drm_fd);
+	drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 	debugfs = igt_debugfs_dir(drm_fd);
 	igt_require(debugfs != -1);
-- 
2.43.0

