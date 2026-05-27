Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99D9CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 04:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7783110E72D;
	Wed, 27 May 2026 04:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQUcdgfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7B10E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 04:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779857790; x=1811393790;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZsE9o8NumIcFVWk0DQI3pG0QnZuKjrhIALVpeTWylOg=;
 b=ZQUcdgfSNZwJjcWLXySdRCOtJGlm/CHR1RTUptU7PcZG32DSuR03uMbU
 imEsk6bGkWYUyOKWJUfRF25YgpNKr59f2hYImFUn1d1MBq71qBEvbGylC
 5NUGBkTeB82D8fvCMPNwlmxsd9artESXJ4Df+40PRyhAzUzvNznA8BtEb
 2lNqJ1nOFHzGYnheblqrn7QaO+5t1eVC1Z2m2KhLbqlasZYygcqzAmrO/
 f1XHi9Wds0ztEs8lEY4DGfcX+IUyp1eRX/0rLF8Ff7xT3Cpq+j5qNH2wJ
 oqCpIszotuZB/NuRVRAjYXBXFLlO1SZPIYbZsHxcK3oz7cI2RgFIUi5CW g==;
X-CSE-ConnectionGUID: qt2LOt4rQmiQZbIQMMVU3A==
X-CSE-MsgGUID: zPtM9YF5SYWwvULtDpfHqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79715747"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79715747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:56:30 -0700
X-CSE-ConnectionGUID: PxqlJSrmS7+qbusJzzVPaA==
X-CSE-MsgGUID: lpxxKld3TwS19JqoV3d5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265729265"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:56:28 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2] tests/intel/xe_configfs: ctx_restore_*_bb rollback on
 invalid input
Date: Wed, 27 May 2026 10:31:28 +0530
Message-ID: <20260527050129.2147335-4-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
 <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
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

