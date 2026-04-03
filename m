Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE64D6AAFA
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 01:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3710F386;
	Fri,  3 Apr 2026 01:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMxv4Cpc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC7410F362
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775180444; x=1806716444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADD8pPnSpGvNOSR9cQkMOAFdiz+mZcgxywv8cD8y0SU=;
 b=QMxv4Cpcw1BIES6hi08/i3dSw9zYyYy4bj89+GrwDw8BLso+u1fhQUoI
 ExB2xOxTjNwewqQlYDSOhNU/BkRgLzMKXTy+L1KRUNvb7xJDu9h9D6ojD
 QGiEIfy8N/DkEIXPsFprY90C9JgbKxt5U+5ip18WYHVk3+prXhdYqHVJ/
 e1HrL1Kf0PqSNherpPie4sotV0o6elVVTSChGL6SaILfPZS4QY+HJB88B
 bjVEBkvifpI1yVt1QTL7lK++ZTJ2FLosAOUM6MupIo0jGZj74KE+qzRYQ
 fs42ij9Mj/f/6HYgcqVQFjpQGDZxlZ108J+RlNdoq1eka46IFf2HqKt4w g==;
X-CSE-ConnectionGUID: YtTBzB8lQ2ankGwFzJQyYQ==
X-CSE-MsgGUID: u+skBAvWQ162BY87vWBj1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="98861874"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="98861874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:40:43 -0700
X-CSE-ConnectionGUID: G4V+eCl3Tx6HZ0Pi2QfVUg==
X-CSE-MsgGUID: UocwTgPzRYaVAWY3KwR9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="224291589"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2026 18:40:41 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 5/5] tests/intel: skip multi-LRC tests for engine classes that
 do not support it
Date: Thu,  2 Apr 2026 18:40:40 -0700
Message-ID: <20260403014040.310758-6-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
References: <20260403014040.310758-1-x.wang@intel.com>
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

xe_engine_class_supports_multi_lrc() now queries the kernel-reported
capability via debugfs.  Guard the balancer and multi-LRC codepaths in
xe_exec_balancer, xe_exec_reset, xe_exec_threads and xe_drm_fdinfo with
this check so that tests are skipped rather than failing on engine
classes whose hardware does not support multi-LRC submission.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_drm_fdinfo.c    | 2 +-
 tests/intel/xe_exec_balancer.c | 6 +++---
 tests/intel/xe_exec_reset.c    | 2 +-
 tests/intel/xe_exec_threads.c  | 1 +
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 411ca6ec4..3c113ed5d 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -673,7 +673,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	igt_assert(virtual ^ parallel);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2)
+	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
 		return;
 
 	igt_debug("Target class: %s\n", engine_map[class]);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 9cd641b4e..3c6ec45f1 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -57,7 +57,7 @@ static bool test_all_active(int fd, int gt, int class)
 	int i, num_placements;
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2)
+	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
 		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -187,7 +187,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2)
+	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
 		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -402,7 +402,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2)
+	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
 		return false;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7aaee31dd..95191139d 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -184,7 +184,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		fd = drm_open_driver(DRIVER_XE);
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
-	if (num_placements < 2)
+	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
 		return;
 
 	vm = xe_vm_create(fd, 0, 0);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index ab9565beb..7b8100c5b 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -85,6 +85,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	igt_assert_lt(1, num_placements);
+	igt_assert(xe_engine_class_supports_multi_lrc(fd, class));
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
-- 
2.43.0

