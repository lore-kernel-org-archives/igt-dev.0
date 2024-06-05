Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D932FC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6470D10E314;
	Wed,  5 Jun 2024 18:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hubP88pP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59F810E3B9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611249; x=1749147249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+YHbS5CrT1ew7LbaqD8KBAfza/yVuklZLXGdjaqtG8=;
 b=hubP88pPbNOD8aGbrL/q+mr4yDNMt8LpndpXONKDEOuR1ISDIYmbfmWk
 q+xvGgDbylo/aGTYcfJcPKmp9UDwWPcUFTHGfOUmgXEyQTIFa2wcU6Qzy
 8MKkEjT8xZ0aGnxHRVTu0VVf6gwygNE0qw3faE13zkQ9DkMzEdy6dV1BK
 1jefj46ynZaZYK7ltjnNOJyu0rGODpOwMW6pe0HYJroMziAP+qyRXyjB1
 kk1sYRMLve4Y+fe4jZ9FY7lSn6g2VFo9y5h2nkUMeJ0IVGjiz0o3ZgEJm
 ZvSyT1pTM3UObnFXJDNZd/b+PUcenegsrbTU7U22b7TCADJa0ixpQ5die A==;
X-CSE-ConnectionGUID: fP1o9XoUQNKrcnIx7TGJEw==
X-CSE-MsgGUID: PzXK3srKSg6BPRXT9gE/8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14084383"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14084383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:14:00 -0700
X-CSE-ConnectionGUID: u/hKuSQrRmmo8iRpWTDLeQ==
X-CSE-MsgGUID: SuU4k9iQSo2knSvNLrs7Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37659535"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v4 1/2] lib/xe: Add sync and async xe_force_gt_reset
 options
Date: Wed,  5 Jun 2024 10:58:42 -0700
Message-Id: <20240605175843.2789838-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
References: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
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

v2:
- Add *async and *sync versions of xe_force_gt_reset (Matthew Brost)

v3:
- Fix compile error

v4:
- Use helper function for xe_force_gt_reset_[sync|async] functions to
  reduce code duplication (Matthew Brost)
- Add missing revision notes

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_gt.c              |  2 +-
 lib/xe/xe_ioctl.c           | 16 +++++++++++++---
 lib/xe/xe_ioctl.h           |  3 ++-
 tests/intel/xe_exec_reset.c |  8 ++++----
 tests/intel/xe_gt_freq.c    |  2 +-
 tests/intel/xe_wedged.c     |  2 +-
 6 files changed, 22 insertions(+), 11 deletions(-)

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
index 934c877ebc..ae43ffd15e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	return timeout;
 }
 
-void xe_force_gt_reset(int fd, int gt)
+static void xe_force_gt_reset(int fd, int gt, bool sync)
 {
 	char reset_string[128];
 	struct stat st;
@@ -537,7 +537,17 @@ void xe_force_gt_reset(int fd, int gt)
 	igt_assert_eq(fstat(fd, &st), 0);
 
 	snprintf(reset_string, sizeof(reset_string),
-		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset",
-		 minor(st.st_rdev), gt);
+		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
+		 minor(st.st_rdev), gt, sync ? "_sync" : "");
 	system(reset_string);
 }
+
+void xe_force_gt_reset_async(int fd, int gt)
+{
+	xe_force_gt_reset(fd, gt, false);
+}
+
+void xe_force_gt_reset_sync(int fd, int gt)
+{
+	xe_force_gt_reset(fd, gt, true);
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

