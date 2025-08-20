Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F1ECA0EEB
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 01:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2810E02C;
	Wed, 20 Aug 2025 01:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McEtzcXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0EE10E02C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755651902; x=1787187902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x0LbE5B6wflgGbVIZhJpQxKvc/y8k6HuA8rx/2PB5f4=;
 b=McEtzcXrCOVbnogp9s0TSb6aEZtzRVWOJc5bKh8+fkYCl69qMqJI645H
 p6dXR01B1y3iEK0IoSYlHTNlaoMdo2lw2vFgSJ4FfQ7RKmbPrwCZrOcDG
 NxLRzWp7Gjkr+TDstWclHYukNHrJM6pIHnM2dJF4bKeKkt1wOOoedPu9Z
 ZvbnOXdWIT2tygabTNbS1O7h0+RXF4IKZWNJlwlINp6IkGIzz8MuTVTIX
 SF99g7+EbOLpC1jUVrNTOOSWFKDT7fhZrNsTL2QcjPgM8rJL2iGmDYovu
 jnmtgYBkYcJJOl0/lHgwfoWI4MVNR/6FviPwpuBBt/rI5jbm0nBHSncky Q==;
X-CSE-ConnectionGUID: Cyrfv8PnTueHXtvdc084ug==
X-CSE-MsgGUID: Ti2N+Op/TyOmWs3XDnHHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68512007"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68512007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 18:05:01 -0700
X-CSE-ConnectionGUID: wUMZIYyARsSM8genP9tPgA==
X-CSE-MsgGUID: xTRrha+KTteOT0Pv3fPskg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167949989"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa007.jf.intel.com with ESMTP; 19 Aug 2025 18:05:01 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Date: Wed, 20 Aug 2025 01:04:53 +0000
Message-ID: <20250820010454.923727-1-zongyao.bai@intel.com>
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

    In the test_cm() function, for cases with the INVALIDATE flag,
    use sleep 0.25 seconds to allow all tasks to complete their jobs.
    However, this time is sometimes insufficient.

    In this patch, xe_wait_ufence (referred to as "fence" for short) actions are added
    for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
    The changes are as follows:
        When flags hit nothing: => No change
             -- all n_exec tasks operate with a fence.
        When flags include INVALIDATE but do not include RACE: => No change
             -- the last n_exec task operates with a fence.
        When flags include both INVALIDATE and RACE => New in this patch
             -- n_execs/2 + 1 tasks operate with a fence.
             -- at least the last n_exec task operates with a fence

    With the changes, all n_exec tasks operate with a fence,
    allowing us to remove the sleep part.

    v2: xe_wait_ufence timeout change back to NSEC_PER_SEC

CC: Brost Matthew <matthew.brost@intel.com>
Reviewed-by: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_exec_balancer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 1747e207c..27ed91d5f 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -527,15 +527,18 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 	}
 
-	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
+	/* Wait for all execs to complete, and the xe_wait_ufence need to be run at least once. */
+	if (flags & INVALIDATE && n_execs) {
+		j = flags & RACE ? (n_execs/2 + 1) : n_execs-1;
+		if (j >= n_execs)
+			j = n_execs - 1;
+	} else {
+		j = 0;
+	}
 	for (i = j; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
 
-	/* Wait for all execs to complete */
-	if (flags & INVALIDATE)
-		usleep(250000);
-
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
-- 
2.43.0

