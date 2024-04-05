Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A8C3A59D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 22:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023DC10EAD8;
	Fri,  5 Apr 2024 22:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXSELEN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A3510EAD5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 22:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712357512; x=1743893512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PuAmLPNM6RN767PHUg3D84H3q0De+MMQWGZ8vJLjQyo=;
 b=YXSELEN2zMVYqF/i/EyOPfriEFB2rMhCpbUf3cyeYPM0d41idH7a8/Hk
 J4YI61T8UhmYu1PELRViCyCy24kUtGMrDJuWXlK4jSZYspge1LIZlupXp
 C7Zzfbhh0htGwERiuGwXFA3+cmXAJ8RtQITE/NE3QpcIBf/rDAp4yS26A
 KzsB1gY9pVd9h6r2nfx7JUg9g0VsJrdjepHUC2cLlS7hn4TS52cvu7reX
 VWbWoad76bB9E6OPLVjRP0CVX/PnliqvgYmuFZdgIP7mmN61reLvepBGJ
 TOiCe+5zjNsNsecQYtD7j+RS98wWfENxiOuDfTx+1v7mhIBWMrx7vwpCx A==;
X-CSE-ConnectionGUID: SHTOaGEeS8yl6lOOwCfWMQ==
X-CSE-MsgGUID: hCzhq3auSv+YniI+I3ncqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7893982"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7893982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 15:51:51 -0700
X-CSE-ConnectionGUID: ZQFPm+foQ3y8DC9y5j2q1w==
X-CSE-MsgGUID: hStX53SyTsSgyNZDIdsf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="23998729"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 15:51:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
Date: Fri,  5 Apr 2024 15:52:15 -0700
Message-Id: <20240405225215.226833-1-matthew.brost@intel.com>
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

The test should never unbind an address used by hammer thread nor should
the exec queue in the hammer thread get banned.

This reverts commit 81462e71323ae6764d7f509f4a1bbd3e41aab13e.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ecb2a783c4..bd4973cc38 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1126,7 +1126,6 @@ static void *hammer_thread(void *tdata)
 	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
 	int b;
 	int i = 0;
-	int err = 0;
 
 	sync[0].handle = syncobj_create(t->fd, 0);
 	pthread_barrier_wait(t->barrier);
@@ -1149,15 +1148,14 @@ static void *hammer_thread(void *tdata)
 		exec.address = batch_addr;
 		if (i % 32) {
 			exec.num_syncs = 0;
-			err = __xe_exec(t->fd, &exec);
+			xe_exec(t->fd, &exec);
 		} else {
 			exec.num_syncs = 1;
-			err = __xe_exec(t->fd, &exec);
+			xe_exec(t->fd, &exec);
 			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
 						INT64_MAX, 0, NULL));
 			syncobj_reset(t->fd, &sync[0].handle, 1);
 		}
-		igt_assert(!err || err == -ECANCELED);
 		++i;
 	}
 
-- 
2.34.1

