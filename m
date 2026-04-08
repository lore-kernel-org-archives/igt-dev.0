Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA73FD5F8C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 07:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4110E3AC;
	Wed,  8 Apr 2026 07:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBBL+hBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C13A10E3AC
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775632464; x=1807168464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qP42sEu3lgMLQmsYNvdaV/uQeJN5z8EeuT8yhA3k+0Q=;
 b=aBBL+hBnxUaNZqBryjLcGnYhJZu6Sijq9XS/5VWKAhKYwgqI0AQtU2X7
 qZWXABVkz8ZGayJC/2PaCab2WhWEyX3MINWQy0EQ2soSxBfzRE638NaZH
 Ox8ev7I/Si3csxKju8DN4qNsFcnLfVMsjrOANXWNUD1mbYsfn+q+rYhPk
 wrLMaeitDyOMNRTzv0Mkpjn6p6auu/AUMh6MojpUh5nEYLUbWFxH+IA/X
 T+P5aAJCZQRoCMdaiMmxJJcWL4Z0LNWnYhJPKmh/TZkHKQY9sOR+s1hf1
 1Fy/KpPqVNvI+gS/dClgSIxW/PXiFEfA4QJnpM6Ez566xulhFOZYqxOPx A==;
X-CSE-ConnectionGUID: mwki2yJnT+6gXGu8VxX/fQ==
X-CSE-MsgGUID: eGeQIk1QSHyVo7iB3HQ5mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64154380"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="64154380"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 00:14:23 -0700
X-CSE-ConnectionGUID: 8cBfhD5NT1i92ucMvfNXVw==
X-CSE-MsgGUID: 6D4uqfBHQoWu9gQQTPYpWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="225213454"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 08 Apr 2026 00:14:23 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH] tests/intel: only check multi-LRC support for parallel
 submission paths
Date: Wed,  8 Apr 2026 00:14:16 -0700
Message-ID: <20260408071416.808087-1-x.wang@intel.com>
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

The previous commit "tests/intel: skip or adjust tests for non-multi-LRC
engine classes" unconditionally guarded balancer test functions with
xe_engine_class_supports_multi_lrc(), causing virtual (non-parallel)
subtests to be skipped on engine classes that have multiple placements
but do not support multi-LRC.

Only parallel submission requires multi-LRC support; virtual balancer
tests should still run whenever num_placements >= 2 regardless of
multi-LRC capability.

Fix this by making the multi-LRC check conditional on the PARALLEL flag
in test_exec(), test_cm(), test_balancer(), and utilization_multi().
Remove the check entirely from test_all_active() which is a pure virtual
test.  In xe_exec_threads, move the filter into the caller threads() so
that VIRTUAL threads are still spawned while PARALLEL threads are skipped
for non-multi-LRC classes.

Fixes: 09d91fcf2961 ("tests/intel: skip or adjust tests for non-multi-LRC engine classes")
Cc: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_drm_fdinfo.c    | 3 ++-
 tests/intel/xe_exec_balancer.c | 8 +++++---
 tests/intel/xe_exec_reset.c    | 3 ++-
 tests/intel/xe_exec_threads.c  | 7 ++++++-
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 3c113ed5d..8449a4f17 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -673,7 +673,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	igt_assert(virtual ^ parallel);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
+	if (num_placements < 2 ||
+	    (parallel && !xe_engine_class_supports_multi_lrc(fd, class)))
 		return;
 
 	igt_debug("Target class: %s\n", engine_map[class]);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 3c6ec45f1..4aaef7666 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -57,7 +57,7 @@ static bool test_all_active(int fd, int gt, int class)
 	int i, num_placements;
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
+	if (num_placements < 2)
 		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -187,7 +187,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
+	if (num_placements < 2 ||
+	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
 		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -402,7 +403,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
+	if (num_placements < 2 ||
+	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
 		return false;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 95191139d..66580ea44 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -184,7 +184,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		fd = drm_open_driver(DRIVER_XE);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
+	if (num_placements < 2 ||
+	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
 		return;
 
 	vm = xe_vm_create(fd, 0, 0);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 7b8100c5b..40a6c0c6d 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -85,7 +85,6 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	igt_assert_lt(1, num_placements);
-	igt_assert(xe_engine_class_supports_multi_lrc(fd, class));
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
@@ -1211,6 +1210,12 @@ static void threads(int fd, int flags)
 					continue;
 
 				while (*data_flags >= 0) {
+					if ((*data_flags & PARALLEL) &&
+					    !xe_engine_class_supports_multi_lrc(fd, class)) {
+						data_flags++;
+						continue;
+					}
+
 					threads_data[i].mutex = &mutex;
 					threads_data[i].cond = &cond;
 					if (flags & SHARED_VM)
-- 
2.43.0

