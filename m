Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FD0C5DF94
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 10:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6287310E101;
	Mon, 24 Aug 2026 10:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7K0Osg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE2310E101
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787568773; x=1819104773;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M0+SUCVlcbceHEF8hlO2DGk4g4fwusFkZzMv9kcsnhM=;
 b=M7K0Osg5lyzSu1Bycya9e7HW2m/PVqeCK2tz05pIoPu2JH75AkMzbej7
 UAlQdVvUbXEsfIF//WU7ZD5txpte3+hONiEZOSvhbMjczBvzB1boWL6Y/
 DFc3rR0d4WetewZDhgqhk7OZBxkmFl3MAaBV19vU2eEMBpG69NkdwU6HR
 BXnEDl/SJp9w8HN38ehYRi4WAnKWrXaA5HGhcsA5LwSFgbXm/ZJU6xyfv
 W/rEytWm5HPVgtaWDT+c5YSAqz0cMv5hSw/YDeK8mtOWrkXhp2XMBe4Nm
 vVhMqgHKpdQWnkR3s7iniudeu1pqAdYc3anVyH5f2NsGUFk2aN7BzEdcu A==;
X-CSE-ConnectionGUID: X9NbCmKFQMSy+1o9Ailk3A==
X-CSE-MsgGUID: 2WeL8wPvTKyBXWORdNbewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98691279"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="98691279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 03:52:52 -0700
X-CSE-ConnectionGUID: T5pdU9r/Q6S3D5jsyyqttA==
X-CSE-MsgGUID: Y9YQ2axnTcSdhxWtjeg9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="262676617"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2026 03:52:51 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	himanshu.girotra@intel.com
Subject: [PATCH] tests/intel/xe_debug: fix NULL dereference in GT
 register-save-restore debugfs check
Date: Mon, 24 Aug 2026 10:52:49 +0000
Message-Id: <20260824105249.503725-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This fixes a critical bug in the Xe debugfs validation test for the
GT register-save-restore debugfs node. The test opened the debugfs file
but checked the return value with igt_require(debugfs_fd) instead of
validating debugfs_fd >= 0. Since igt_debugfs_gt_open() returns -1
on failure, the require was incorrectly treated as true, and the
code then called fdopen(-1, "r"), leading to a NULL FILE* and a crash.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 5c045b04f..6b2cf2f37 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -581,8 +581,12 @@ static void check_gt_reg_sr(int fd, int gt)
 
 	debugfs_fd = igt_debugfs_gt_open(fd, gt, "register-save-restore-check",
 					 O_RDONLY);
-	igt_require(debugfs_fd);
+	igt_require(debugfs_fd >= 0);
 	file = fdopen(debugfs_fd, "r");
+	if (!file) {
+		close(debugfs_fd);
+		igt_skip("Failed to fdopen register-save-restore-check\n");
+	}
 	while (fgets(buf, sizeof(buf), file) != NULL) {
 		unsigned long offset = strtoul(buf, NULL, 16);
 		bool ok = false;
-- 
2.34.1

