Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E65AD730AC
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 07:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E1A10F0CE;
	Fri,  3 Apr 2026 07:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMLsb1Cw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F93D10E089
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775200406; x=1806736406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Evb8f8mpfcyMuzdRKynggvzZ18DpQ2nM3iHRUTo7RRM=;
 b=IMLsb1CwyrCRc0fEUTGpx7mieCzoCLK8zaijCMx5CcI/0FHc7dbouKoz
 mjcJnQxfKhrtQG9AKuJqhXA2Soph5xeU0BP409L0kwzLw2RsLennWWgh2
 esNI2u+2i2dr5UhaQjkupmasb3Eh7OfBtkoZvGHHP0JDEFC2QAZEw/Nio
 vu65UwC8OR8w5BzFwYbAPsJREcS7LxjxlF8G+XBg3KMx/JUE2jidjMRDa
 1QO6+SVkNSiUlrvsp2LvNJYAwicfDB7GWI6hVTX3t5bxxtsC6wKMmOPsM
 O86hOIZ2qjihYBmO/sMTC0/VcE2SfQZzxrLUgo0HXXQxpbnWUue50hEGb w==;
X-CSE-ConnectionGUID: NqAj2QxdQEae8k6dmF3uyA==
X-CSE-MsgGUID: 1paDRlg4Tzire+S4EQhdjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76151712"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76151712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:13:26 -0700
X-CSE-ConnectionGUID: TYRgmGinSr2yTsPyipWOEw==
X-CSE-MsgGUID: Vr9jqMoaTuui44YHgxhozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228819971"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 00:13:25 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] tests/intel: skip or adjust tests for non-multi-LRC
 engine classes
Date: Fri,  3 Apr 2026 00:13:22 -0700
Message-ID: <20260403071322.366766-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403071322.366766-1-x.wang@intel.com>
References: <20260403071322.366766-1-x.wang@intel.com>
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

Use xe_engine_class_supports_multi_lrc() to guard multi-LRC test paths:

- xe_exec_balancer: skip tests requiring multi-LRC if the engine class
  does not support it
- xe_exec_reset: same guard for the balancer subtest
- xe_drm_fdinfo: skip utilization_multi() for non-multi-LRC classes
- xe_exec_threads: assert multi-LRC support before test_balancer()
- xe_exec_multi_queue: only validate parallel-queue rejection (-EINVAL)
  for engine classes that support multi-LRC; non-multi-LRC classes do
  not accept the MULTI_GROUP flag at all so the check is irrelevant

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_drm_fdinfo.c       | 2 +-
 tests/intel/xe_exec_balancer.c    | 6 +++---
 tests/intel/xe_exec_multi_queue.c | 2 +-
 tests/intel/xe_exec_reset.c       | 2 +-
 tests/intel/xe_exec_threads.c     | 1 +
 5 files changed, 7 insertions(+), 6 deletions(-)

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
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index b5ded0633..ca96099d3 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -112,7 +112,7 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 
 	/* Multi-Queue can't be a parallel queue */
 	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
-	if (n > 1)
+	if (n > 1 && xe_engine_class_supports_multi_lrc(fd, class))
 		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
 
 	/* Specifying multiple MULTI_GROUP property is invalid */
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

