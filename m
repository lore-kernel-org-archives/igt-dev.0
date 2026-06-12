Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C63ACD98CC
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 00:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8294C10F1DC;
	Fri, 12 Jun 2026 00:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDH7DyBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284D10F1DC
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781225362; x=1812761362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3idHQHR+rqXpeW5Jj9OH01FOOwcK/qUqEHmTE37S7oc=;
 b=cDH7DyBnIZgxQcjC9x+pP2PwN6Y0YuSUnseF3yUnAtNi4VJSmnUK3lnZ
 Z8FetZbGkZe3mR4Mi90/pzXYiQuUulDD5ZGHqPzWzpm/7/+LLkyL7/SOd
 Z4cfqVtPZteIBKAVKBbb74IGE4tJC0UQV6Xvm1IHCY440nIBWGCNCHIZ4
 TWZ8omyznGyrD1gFhKgODyDg90C4kCjww1SvfSDItw608QZjvO4s0PPqW
 0VMnMe2W+V1rViZ55CBhkViUs6o2PV+lLOuMbzi1ZAm4VzFlWJToi2Lr+
 i74Pgx8BNNI+bf7uBIoNnVSMP13iNvxk41qXLCAePtP+CmubHSd/YDtYB Q==;
X-CSE-ConnectionGUID: l1xfdZ0mQTK0bDtuN4Vc5g==
X-CSE-MsgGUID: liUHh6CFSmaRZ1oR0fdPAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82163529"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="82163529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 17:49:20 -0700
X-CSE-ConnectionGUID: nOwMUcDcT8e0sVX/5rJ8Bg==
X-CSE-MsgGUID: I2BRiuFGSyCybC2+/LoyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270333452"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 17:49:19 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: skip compression subtests
 early in main thread
Date: Fri, 12 Jun 2026 00:49:11 +0000
Message-Id: <20260612004911.2003505-1-shuicheng.lin@intel.com>
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

The long-spin-comp-reuse-many-preempt-threads subtest fails on
platforms without FlatCCS support (e.g. CRI). When threads() spawns
worker threads that call xe_legacy_test_mode() with the COMPRESSION
flag, each worker reaches intel_get_pat_idx_uc_comp() which has
igt_assert(HAS_FLATCCS()). That assertion fails on platforms
without FlatCCS and the subtest is reported as a failure rather
than a clean skip.

Fix this by calling igt_require(HAS_FLATCCS()) from the main thread
in threads() before spawning any pthreads. On platforms without
FlatCCS, the subtest will be cleanly skipped. On platforms with
FlatCCS, the check passes and execution continues normally.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 20be33736..4639620ac 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -846,6 +846,9 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	int n_engines = 0, i = 0;
 	bool go = false;
 
+	if (flags & COMPRESSION)
+		igt_require(HAS_FLATCCS(intel_get_drm_devid(fd)));
+
 	xe_for_each_engine(fd, hwe) {
 		if (hwe->gt_id && (flags & GT0))
 			continue;
-- 
2.43.0

