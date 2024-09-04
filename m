Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3265CD484A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 14:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624B610E656;
	Wed,  4 Sep 2024 14:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l138dnh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CE10E656
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725459476; x=1756995476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5fo9jT8UrAZICI5TocoKQIF+Zidyn6hq5Nez7EUvew=;
 b=l138dnh925uKZOX7SWr5QyEsIajCoNXmoFhOjlI7nQqEifyioc4cSIUd
 XX+34GASUnQxZcChVwDSPYurIyA2PdfIrRjBqyYCBAgenOkPlbkB9SqAy
 P1RU6dVNYSj5iX8gpBcRSM8gdVHc78KLbsE6QEJfMCKZZly4j7tSvFAI1
 1DWI8/ZmPXlQhloYngR7c2JEPQkWsC8D2vm/ZV5Wl6ZmFm34m4V3YxA0X
 M4cWPjsOjXm62JLH1lVQgLGLTZksdStNcxWoZiSKl37t8uQDAG9pXw+jZ
 sEMOdERoKpZWrbUeeDUoVO4b03Pz7zk24nAKdW4F49Wb+/lCRosop8Ug0 w==;
X-CSE-ConnectionGUID: +nlkleJ5Q1e68x+Ok2GnVg==
X-CSE-MsgGUID: kGGqW/pISO2gmdp+BsrYbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24278262"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24278262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:17:42 -0700
X-CSE-ConnectionGUID: q1cN3uEpQAqKIYjeCBmZdA==
X-CSE-MsgGUID: AvUy/jm4Qz2XpqTxY3tt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65515386"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:17:41 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t v6] tests/intel/xe_exec_fault_mode: Don't return early
Date: Wed,  4 Sep 2024 15:49:16 +0200
Message-ID: <20240904134916.13126-1-nirmoy.das@intel.com>
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

Tests that are causing pagefaults should wait for exec queue to
ban/finish otherwise pending engine resets because of on-going
pagefaults would cause failure in subsequent tests to fail.

Not all execs will generate page faults and in such case reading ban
property is not enough but the signal should either -EIO or 0.
so read that instead.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout
v4: check for signal status to be -EIO/0.
v5: code rearrangement and other minor fixes(Andrzej)
v6: commit message fix(Tejas)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
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

