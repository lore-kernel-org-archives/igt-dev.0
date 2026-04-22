Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E08CF9B5F1
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 09:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221EB10E296;
	Wed, 22 Apr 2026 09:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDIOIAS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A610E296
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776849131; x=1808385131;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZsE9o8NumIcFVWk0DQI3pG0QnZuKjrhIALVpeTWylOg=;
 b=aDIOIAS6KAGMXE4yki5WGn4cVhS7tPU5Wvu7iyFKjx39yVhUt8ddzap1
 /FSkg5OjsjbAr3DEYJ9TxYRsYHtso3BlGC4GPGgiAkiuOb267fxtjZ20v
 lR6JCHgXEP2SwtYr/y+02VZDkR2nsxGM3H/RNulwoXKvSaS4/fCN0TS/F
 h+y6WhhlTT4kwbaztLxPEwbzljvDzW6ubDBDusEfoLZlHhfTCVs8klffK
 U1Us4GguDud2Y7ftKMBcW7LcdDUuITbVyoZIkYYn5rpUQnZaxvj7Ja0BI
 Kxtb8JyCfVhRSTxR+zXxbE2deqY3ZdxZtzm3cata/MgmyZBYYhzlBM7pm Q==;
X-CSE-ConnectionGUID: 8v5v/bsRQ6GnD/hH418mnw==
X-CSE-MsgGUID: OUOTVv5aREC8Djihvx7qiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77780179"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77780179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 02:12:11 -0700
X-CSE-ConnectionGUID: 6AQ2yEGMS5CfVIQkGCPtEw==
X-CSE-MsgGUID: ErgT2CyDRQiM8aqaFaCKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="227716621"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2026 02:12:10 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2] tests/intel/xe_configfs: ctx_restore_*_bb rollback on
 invalid input
Date: Wed, 22 Apr 2026 14:45:16 +0530
Message-ID: <20260422091516.1073756-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
References: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
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

Changes since v1:
- Fixed alignment issue
- Updated commit message

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..39762e030 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -225,12 +225,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-engine-instance",
 		  .in = "rcs0 reg 4F100 DEADBEEF",
 		},
+		{ .test = "invalid-second-command",
+		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+			"rcs cmd 11000001 4F10G DEADBEEF",
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

