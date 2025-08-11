Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C73CA0EC4
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 16:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB4D10E502;
	Mon, 11 Aug 2025 16:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8n+oTZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3DE10E502
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754928611; x=1786464611;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+010aN5Z8fjWA3aW6J8Fu95cIE6KaQkq8CqG3hWVcA=;
 b=C8n+oTZ1fd5DBVOSDarKHm9dVVnzd6qiIGHTmh/T+0LZNBvlDIJ48d8d
 8Bn18wJrjTb+aT9xwZxn7ZdxcZHPhi0RazWqpiDcjaoBs75BytKu3Z5xO
 oqMsQyAvszIfho44BT7iYMH/xs+smwb44Z1AagYQv8eIeBHdI1asxiXSk
 Gl8VpbgdnjoBT60osLvUHA81dvoERGRKu94GBQIIKrqiTbes86IFbl7R0
 SG76ox0jOaJxQ19Aofww8oCchJXA4s8/DnrtuJMdcUSZ+IKSNELG8IFJI
 y5ErExxU6nH/QjkAyjlg5uoYdaps5WYADdCeypnZ2QbEjqbLq5fVbtSYN g==;
X-CSE-ConnectionGUID: c3lgpJYbQMKTW6qN2B63jQ==
X-CSE-MsgGUID: oEJMCmExTzKu2GVTg0e56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57311479"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57311479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 09:10:11 -0700
X-CSE-ConnectionGUID: nXuRWgZrRfWSo7ROCgMJCg==
X-CSE-MsgGUID: Go/2fAyPTcGkB83va0Y6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196794403"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2025 09:10:09 -0700
From: himanshu.girotra@intel.com
To: satyanarayana.k.v.p@intel.com, matthew.s.atwood@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel/xe_fault_injection : Update function name for
 xe_wa_init
Date: Mon, 11 Aug 2025 21:40:08 +0530
Message-Id: <20250811161008.5355-1-himanshu.girotra@intel.com>
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
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
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

