Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC0CC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 13:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5822510E473;
	Mon, 11 Aug 2025 13:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU4oxgcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1140110E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754917300; x=1786453300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Om8QiqoYQysezECZ0JJrW2vb/+k6WKeK+mBjDCtAgC8=;
 b=LU4oxgcdFy7BtCwhjYkpyDOrdpl8GpsTTEpwE8yi8rKxzDURryUsQCPM
 dbpxFVRXKrXKAoKtClmWGF0MAtEUs81IkQUj/xESMTf7TWYeus6+sE+1K
 eNtYTjos5JoAmaSv8R9ijXG3lESjBtpi0oMTlQFKp0FtnmgRd336i4D/z
 ye+0GPuZrynM39sQOxWb+zb30Ml3Gca2NaIPfbbfD8q6ZkL59YKsiiIv8
 CkYoqbcfa01whcBQtRwUw6UWw9XscA99D3zTJB3jv4+2ukXAHiddPXq+3
 rWQbPRKAsqkr/Yygl6+rujOoJAWmr8DKDU6StaTq/S59ffMfjVs9QuG/P Q==;
X-CSE-ConnectionGUID: 94ZJU6M7STyURQDUkp4zeA==
X-CSE-MsgGUID: czh3A6OpQHiGH9D9OXKBAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57233799"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57233799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:01:39 -0700
X-CSE-ConnectionGUID: bNDCtYO8QjKTylnypzNyZg==
X-CSE-MsgGUID: 2QFxA9aLRFqIX7jlErQeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165812303"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2025 06:01:38 -0700
From: himanshu.girotra@intel.com
To: satyanarayana.k.v.p@intel.com, matthew.s.atwood@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel/xe_fault_injection.c : Update function name for
 xe_wa_init
Date: Mon, 11 Aug 2025 18:31:37 +0530
Message-Id: <20250811130137.4006-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Update function xe_wa_init to xe_wa_gt_init as per latest kernel changes
introduced in https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/342d1f84320994ab72a6ca96e18f2985868e1cbd

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_fault_injection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 00d045cd8..04de2bfd5 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -256,7 +256,7 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
  * @xe_sriov_init:			xe_sriov_init
  * @xe_tile_init_early:			xe_tile_init_early
  * @xe_uc_fw_init:			xe_uc_fw_init
- * @xe_wa_init:				xe_wa_init
+ * @xe_wa_gt_init:			xe_wa_gt_init
  * @xe_wopcm_init:			xe_wopcm_init
  */
 static int
@@ -562,7 +562,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ "xe_sriov_init" },
 		{ "xe_tile_init_early" },
 		{ "xe_uc_fw_init" },
-		{ "xe_wa_init" },
+		{ "xe_wa_gt_init" },
 		{ "xe_wopcm_init", 0, true },
 		{ }
 	};
-- 
2.40.0

