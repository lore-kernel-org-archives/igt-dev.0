Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C658C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 18:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B55610EA41;
	Mon,  6 Jul 2026 18:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iahdaomJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3AA10EA41
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783361879; x=1814897879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kn0JG0NY9T0YETiyNsIb6KnT62rYVY2tbMNoXt7zcmY=;
 b=iahdaomJtrN4QqxE6IoKih2HMc4InrL84DBjRc9IpVVdKTonGTs/rILP
 HxtDhYr2m34c2Wz0Fdr4sDeeFTDffOlX/u6qEQpo1nAyfT9bv5skLSAqe
 +3AGnzrtE5neBrdMpU4vGleXHtRmIrHHb8UA8DHQ/H+89G1PT+aiEKT2m
 s3+BATZ7gFUMcK64gRhD7e8j0B+D4nFkj7waPhlPWCkrCyMUOhFZPYeXV
 in7pIbRy3lG9eVX9Bg863Q9NwRoZOPvz0gI4/yOkf1GD/pDascnT8lUwQ
 2VvtcCkqoNm97x0+9KM/FYjdVbx2vwNN9F0McojMgdw5OeeZ57oFlXsVz A==;
X-CSE-ConnectionGUID: wzK/0ZjkS8Gc3Wu7KrMbdw==
X-CSE-MsgGUID: 4R1vN4hhRxSttI6w1DNxMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86552914"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="86552914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 11:17:58 -0700
X-CSE-ConnectionGUID: uEJtlzPbR9CMm2eeXHUGfg==
X-CSE-MsgGUID: Q23UvW4xTm2q602Zok3LgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="257651304"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 06 Jul 2026 11:17:58 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Ignore expected CAT
 error in fault subtest
Date: Mon,  6 Jul 2026 18:17:52 +0000
Message-Id: <20260706181752.3039184-1-shuicheng.lin@intel.com>
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

The 'fault' subtest submits an exec with a bogus batch address. The
kernel nacks the unresolvable pagefault, which the GuC escalates to a
memory CAT error and engine reset. The resulting 'CAT error' dmesg
messages are expected, not a real failure.

Emit an ignore-dmesg regex to suppress them in CI. It matches both
'Memory CAT error reported by GuC!' and 'Engine memory CAT error'
messages.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 24fc5b708d..fd7520e519 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2752,10 +2752,12 @@ int igt_main()
 	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
 		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
 
-	igt_subtest_f("fault")
+	igt_subtest_f("fault") {
+		igt_emit_ignore_dmesg_regex("CAT error");
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
 				  FAULT, NULL);
+	}
 
 	for (const struct section *s = psections; s->name; s++) {
 		igt_subtest_f("partial-%s", s->name)
-- 
2.43.0

