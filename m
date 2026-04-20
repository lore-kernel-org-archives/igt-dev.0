Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6080FF36C28
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 06:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AC810E422;
	Mon, 20 Apr 2026 06:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0wmcFTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2285C10E422
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776666918; x=1808202918;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IUEG65OmlUFbqBEbedSvuVImBFsu5HWXd9gYC9N43T0=;
 b=Z0wmcFTBx2uFruPy0/+oKU87jNRKhychLY01Gp5Ke68U8qsaJNW6WK7n
 pXJHzyhQyhkPd1m899d8Sz7wJEvVOMR8Vqfzf6OiMkcCkOt9e944Hk5Cn
 zPPhOykWGsnZc8ztGVimTSNhNE11Z5UWoxP6JLekCpvrF9uLlHlrlMupY
 qu+WL/XdLdm/zY+amdVAQeAkSSrRHN4+TnTUqfeChUnauzj/8CkmyMjI8
 MDzP3q08j/L+bz8ayfV8TVmamqmWjWJ8l4r/zbViqSxCdCMC1GiodnrLL
 bridlV3b7vrxsVZTd01RlbMXTiwJMajFnQj0z3BxL7BhZQB/FJDovEyPs w==;
X-CSE-ConnectionGUID: pjSuTvZbSuawXb4MXIwQwQ==
X-CSE-MsgGUID: YmVJjjr8R7uP0i0aJTy7Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77649308"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77649308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 23:35:18 -0700
X-CSE-ConnectionGUID: rvXCW0EQSMqE+9pIK5uEdA==
X-CSE-MsgGUID: /10f9Br+SVSSY9Zf9V9ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="233397299"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2026 23:35:17 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel: ctx_restore rollback on invalid input
Date: Mon, 20 Apr 2026 12:08:16 +0530
Message-ID: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
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

Add a test vector with a partially invalid second command in the
ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
BB is rejected and the stored BB remains empty (rollback).

Replaced the hardcoded "ctx_restore_post_bb" write with the computed
file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
invalid-case tests work for both "post" and "mid" variants.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..97ea95da8 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -225,12 +225,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-engine-instance",
 		  .in = "rcs0 reg 4F100 DEADBEEF",
 		},
+		{ .test = "invalid-second-command",
+			.in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+				"rcs cmd 11000001 4F10G DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
-- 
2.43.0

