Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C77ACD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 04:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F35C10E726;
	Wed, 27 May 2026 04:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNgPa117";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638410E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 04:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779857787; x=1811393787;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IUEG65OmlUFbqBEbedSvuVImBFsu5HWXd9gYC9N43T0=;
 b=RNgPa117U9LyWC9TNN41dXsJYGSPa1iiRMBnU8xb/q3jBQrSc9i6a+JS
 1V0CIx547qCSjFDJ1j6XVjHimcdPc9qgbdbavV5//sB9STitKzeWRc+0J
 K2y1xfABgr40yk12qGgyh3fTFyskSQSW4qckVqe2KlZGkkg4sFJSVlQ8H
 HrBsttlAeyJuhGyziPrVJibly1b/xap3OdEdosZ7G6PszrCsRv2XWD1+o
 fd+vXDSYP/LATRPWRXaTMyPVd3mcYGL5uvrhi30ItcNQFKAlQQbQNSq1W
 m9cF3b88eW+d2cZct8tBVbgXv7M8hZNtc0pGfKElhmrRi/xrAdisO1D7w w==;
X-CSE-ConnectionGUID: u8YVALkeSAS0A+ad8Q/+Rg==
X-CSE-MsgGUID: X0KcE7fvT6qVcFC0IuUn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79715736"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79715736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:56:27 -0700
X-CSE-ConnectionGUID: ooUL1jKMR3SiIrKWYNgNbA==
X-CSE-MsgGUID: Rl/drASWSISXH7Hvf0+atA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265729250"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:56:26 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel: ctx_restore rollback on invalid input
Date: Wed, 27 May 2026 10:31:25 +0530
Message-ID: <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
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

