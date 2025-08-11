Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16007C87FD2
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 11:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F5810E456;
	Mon, 11 Aug 2025 11:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nS9PjA9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99210E456
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754911256; x=1786447256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7aGpxRHhOBO8dwGx+C/Jkb6mF6q5YDAGq2+d8BrdHk=;
 b=nS9PjA9b/+X/KQERrv/A+GysP8ifnc3aOiMb6A6eEZSRh5GbAD1ZKV7c
 stxnG+cfJRd63vi9mviYSpOjQJzm97YX37WwyKWVB5rg3pACeYH78VZjY
 jWHmlszMlaOSP/Sv2U2qqS1UF3cmV0L+Pcyfl0jzBc55H+V2OLoB1GMWj
 1lm0u23aPaES+LM/GCSB7vgRykjTp+pydE4FcmDHRUSaDpt5Zb/dNSyyU
 Rc+rD00xsKNwlW9mlo0lcrH9SNP8wzyqkGxgUFi2WtnmdcO2c59O6yi+e
 nV0QimpNcUYvboo8iAqvGMR8dOCk9sG8PF0/73reWFBnl3te0kxxhPzEs g==;
X-CSE-ConnectionGUID: VumXSL/LSAOrmKDwBDvAiA==
X-CSE-MsgGUID: ISeOl0ZnRt+A7MHUf9+keQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74748068"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74748068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:20:55 -0700
X-CSE-ConnectionGUID: ieARtX/tT7+j3qOUSJeBtg==
X-CSE-MsgGUID: Y2tShXyxQ9G1zbXyXi3hmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171143300"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:20:55 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_reset: Wait for spin jobs to
 start
Date: Mon, 11 Aug 2025 11:20:37 +0000
Message-Id: <20250811112037.342583-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811112037.342583-1-sobin.thomas@intel.com>
References: <20250811112037.342583-1-sobin.thomas@intel.com>
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

This fix will allow waiting for the spin jobs to be triggered
before performing the gt reset. This allows all the job
to be started on the guc ids and prevents the timeout

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_exec_reset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7ae53c679..c78850c4f 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -252,8 +252,11 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	}
 
-	if (flags & GT_RESET)
+	if (flags & GT_RESET) {
+		for (i = 0 ; i < bad_batches ; i++)
+			xe_spin_wait_started(&data[i].spin);
 		xe_force_gt_reset_async(fd, gt);
+	}
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
-- 
2.34.1

