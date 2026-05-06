Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F688CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 20:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C930E10EEA3;
	Wed,  6 May 2026 20:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDXjpTb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D93910E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778101024; x=1809637024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MDbf4zeu8cYPUattusZZOl24AhTytEqAu14zPCS/9yE=;
 b=VDXjpTb+86rCbZ9U6GUAvJ39uW6hogHkjh0kPeNWXW17sC5AkT0lr6eZ
 Aq48qI/4eHMBzwi+E5L0P2g+kn/cSBxwoY+OQfHWUOjNoUQtB5dvPMdNG
 wx8fuibw0rpM49kACdPC/EDlCslr/ZFbCCjtnqNO101rLWgVJzGQKXBvv
 URXOE5AJop5n5w8hlD98SWXPc+FFCqDc78+592pfDdjpmIHtIwsAvcgyh
 0suhtkaSpd1exXyKplspZSpvcYSAwdBzbrBowKaoKZCTder9IIsiAjTFe
 1m/oNk3TpIarOR1mHaqrb/++UNCFLZAK58V0mbya2Q/qKPMATEyTiP/CA A==;
X-CSE-ConnectionGUID: SbqQb8lLQFGmqj7QNF0wxg==
X-CSE-MsgGUID: 1VgSk2RuRy+YTJ0yyE3DHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78073122"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78073122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 13:57:04 -0700
X-CSE-ConnectionGUID: sP4qM5DZQlq9G6kytdZF2Q==
X-CSE-MsgGUID: 6eSrGSaJTLads7rMMvi0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259687220"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 13:57:04 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] tests/xe_exec_threads: relax data check in multi-queue hang
 mode
Date: Wed,  6 May 2026 13:56:50 -0700
Message-ID: <20260506205650.20503-1-x.wang@intel.com>
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

In multi-queue hang mode, a reset of any queue in a queue group will
cause the entire group to reset. And since GuC only submits on the
primary queue, without explicit barriers or priority differences
between queues, we can't guarantee which queue hardware will pick up
on submission. As such, we don't know which queues will complete
prior to the group reset and need to check for all possible values.

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_exec_threads.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 40a6c0c6d..9331a3b88 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -707,10 +707,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	     i < n_execs; i++) {
 		int e = i % n_exec_queues;
 
-		if (flags & HANG && e == hang_exec_queue)
+		if (flags & HANG && e == hang_exec_queue) {
 			igt_assert_eq(data[i].data, 0x0);
-		else
-			igt_assert_eq(data[i].data, 0xc0ffee);
+		} else {
+			/* Multi-queue reset affects all queues; data outcome is non-deterministic */
+			if (flags & HANG && flags & MULTI_QUEUE)
+				igt_assert(data[i].data == 0x0 || data[i].data == 0xc0ffee);
+			else
+				igt_assert_eq(data[i].data, 0xc0ffee);
+		}
 	}
 
 	syncobj_destroy(fd, sync[0].handle);
-- 
2.43.0

