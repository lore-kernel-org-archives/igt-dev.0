Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C902C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 16:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926510E07A;
	Wed,  5 Jun 2024 16:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9O8JXl4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EABC10E190
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717606140; x=1749142140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cu6j01saQwefcOWBor7drOHReqQDE/0NYhc+/areO4o=;
 b=h9O8JXl4MDpIq13PO+PC68ZNAesucVDyf71S3AzN4vcExRn/bzrbRpAk
 1LhgPHjwKZiboIeZKV3fNHCcj8Sf9piB7gZd4YlKtNXHPANe0i9ftQFGu
 Du7YjKwUlF3COiZpqxlFNpBswrv/0JAGH18zCUSc89voTZ8IRPy6dM0kM
 6CuOTM3QZaMYS/9eI4ujLDZQxXYsqDG/PRh/Rte7EfDUlGa9X1hk092jI
 S9yDfAb5QE4K8NO814ccHIcamKvqwgRDi4pU9d6ocWIV1g66/638X8/c+
 eIS4+9+kEbFED6vg+dI/8lFg01D5BolV9KjBKU2Zs9jF4agwbpUpc7u8b Q==;
X-CSE-ConnectionGUID: RfQ/lDo/QHObt+Ap1OzYmA==
X-CSE-MsgGUID: a0x/zqsOTCuHzApB8hEnKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14072473"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14072473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:49:00 -0700
X-CSE-ConnectionGUID: zbYDmfakQAC1qMaknDBYjA==
X-CSE-MsgGUID: OaDlzcVZQFe265rTP3cXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37666108"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:48:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v2 1/2] lib/xe: Add sync and async xe_force_gt_reset
 options
Date: Wed,  5 Jun 2024 09:33:43 -0700
Message-Id: <20240605163344.2747072-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
References: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
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

Add a new xe_force_gt_reset function, xe_force_gt_reset_sync, renaming
the original xe_force_gt_reset to xe_force_gt_reset_async.  This allows
the user to decide whether or not they want to initiate a synchronous or
asynchronous gt reset.  The asynchronous reset function was otherwise
unchanged, but the synchronous reset function operates by calling a new
debugfs function.

For now, default to using the asynchronous version for all current use
cases.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_gt.c              |  2 +-
 lib/xe/xe_ioctl.c           | 15 ++++++++++++++-
 lib/xe/xe_ioctl.h           |  3 ++-
 tests/intel/xe_exec_reset.c |  8 ++++----
 tests/intel/xe_gt_freq.c    |  2 +-
 tests/intel/xe_wedged.c     |  2 +-
 6 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 743d7a26ec..36e8fde363 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
 	int gt;
 
 	xe_for_each_gt(xe_fd, gt)
-		xe_force_gt_reset(xe_fd, gt);
+		xe_force_gt_reset_async(xe_fd, gt);
 }
 
 /**
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 934c877ebc..6e3234cd3d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	return timeout;
 }
 
-void xe_force_gt_reset(int fd, int gt)
+void xe_force_gt_reset_async(int fd, int gt)
 {
 	char reset_string[128];
 	struct stat st;
@@ -541,3 +541,16 @@ void xe_force_gt_reset(int fd, int gt)
 		 minor(st.st_rdev), gt);
 	system(reset_string);
 }
+
+void xe_force_gt_reset_sync(int fd, int gt)
+{
+	char reset_string[128];
+	struct stat st;
+
+	igt_assert_eq(fstat(fd, &st), 0);
+
+	snprintf(reset_string, sizeof(reset_string),
+		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
+		 minor(st.st_rdev), gt);
+	system(reset_string);
+}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 4d08402e0b..b27c0053f0 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -91,6 +91,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-void xe_force_gt_reset(int fd, int gt);
+void xe_force_gt_reset_async(int fd, int gt);
+void xe_force_gt_reset_sync(int fd, int gt);
 
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e47c3730dd..05d63c0ba5 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, gt);
+		xe_force_gt_reset_async(fd, gt);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset_async(fd, eci->gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset_async(fd, eci->gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
 	while (!*(t->exit)) {
 		usleep(250000);	/* 250 ms */
 		(*t->num_reset)++;
-		xe_force_gt_reset(t->fd, t->gt);
+		xe_force_gt_reset_async(t->fd, t->gt);
 	}
 }
 
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index ff99b46a08..d2e4d1a09c 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
-		xe_force_gt_reset(fd, gt_id);
+		xe_force_gt_reset_async(fd, gt_id);
 
 		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index aa4a452bfc..a4fc53869e 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -31,7 +31,7 @@ static void force_wedged(int fd)
 	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
 	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
 
-	xe_force_gt_reset(fd, 0);
+	xe_force_gt_reset_async(fd, 0);
 	sleep(1);
 }
 
-- 
2.25.1

