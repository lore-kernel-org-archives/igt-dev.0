Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17075CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 09:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D418953E;
	Wed,  4 Sep 2024 09:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aq5kBxPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1310E70F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441211; x=1756977211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=td5HI5h4fMDuOxvENGRIcu70qLjU/Q2ui+KQ6G0g0r0=;
 b=aq5kBxPYASIs9lMgX1rTnaN78kYVfwgXLKA1PH4TBpTOBE/nbQw/fhD5
 +t2OEVSjk6q2VSeu+3DksWHc7+4/2/M0ebpJHDn7mKqty0BkscQWIMaqb
 hZ04/5/2AFwGaiR3WrQWePHwITvlBhXQSpv11oA8kNmFgFMttAICDm2py
 Dt54+MS9qY+G4FaaYPW0K/E71moDOSPVajuCYDfAGpMMSmvslLVZOOaxb
 hrrMDbpNBFe6VH0fIhmJ7LmrzxMkCVly3egT8pC0F7rOhXZhnqQiVZH2A
 3fhvagXw4AiexXU6Uh10dxVeeNai3Yeq8SmuE8eU1JB4cZAnZVcfXLfyI A==;
X-CSE-ConnectionGUID: N3dqptRLT9OEEgEGUZirww==
X-CSE-MsgGUID: xvKYuEzHRZGNTzB97lg1Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41560294"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41560294"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:13:30 -0700
X-CSE-ConnectionGUID: gQgpRegMReypM/3UybQARQ==
X-CSE-MsgGUID: 3jKqvrsgS569R+Q+LGHGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69834591"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:13:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t v5] tests/intel/xe_exec_fault_mode: Don't return early
Date: Wed,  4 Sep 2024 10:45:04 +0200
Message-ID: <20240904084504.32546-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Tests that are causing pagefaults should wait for exec to queue
ban/finish otherwise pending engine resets because of on-going
pagefaults would cause failure in subsequent tests to fail.

Not all execs will generate page faults and in such case reading ban
property is not enough but the signal should either -EIO or 0.
so read that instead.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout
v4: check for signal status to be -EIO/0.
v5: code rearrangement and other minor fixes(Andrzej)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..9cc51b7d3 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -324,9 +324,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], NSEC_PER_SEC);
 
-	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
+	if (flags & INVALID_FAULT) {
+		for (i = 0; i < n_execs; i++) {
+			int ret;
+			int64_t timeout = NSEC_PER_SEC;
+
+			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &timeout);
+			igt_assert(ret == -EIO || ret == 0);
+		}
+	} else if (!(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
-				igt_assert_eq(data[i].data, 0xc0ffee);
+			igt_assert_eq(data[i].data, 0xc0ffee);
+
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
-- 
2.42.0

