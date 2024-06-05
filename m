Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0808C27C53
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 15:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5501B10E0D3;
	Wed,  5 Jun 2024 15:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioLIFo24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC1D10E1AE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717601283; x=1749137283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lGn5SG7ViVbk5c3yuoiSJPuxj5pGznD45sr8yfd2uSw=;
 b=ioLIFo24JOndM8tP6iP5zuLDGVxkK86lXs5YOhlid+H1ea85Sy+aVgMB
 pTfLz8Auo89lX4eRvPjiLvQzmiodvZjccap0l7SMarukhxRrJc9ghWdcq
 lqcrZVyvIYD+i0oi3/+0d+J1kjMuA2PzNbrynIH0iYkXCoLzN2zSoPY6b
 rozMbJCcecFLosWMkKlQnzbvhyWWcOG9FiJrbdcXzQDnDiEvhQxYjthUZ
 TqF2A655J2+D8EvdfTML1cASxYM88HeWc3H5jQhJVSezd/yglgP0lyj5B
 UPEIhVxq9HBi9no2SLDdQzXOGi6a3O50D35tXR2/rcuc8+GZsplWjJXuj g==;
X-CSE-ConnectionGUID: hM5jjMeYTKmqri7/Fwhx0Q==
X-CSE-MsgGUID: FSumeiW6RcWufJa9DGLV6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11923008"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="11923008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:03 -0700
X-CSE-ConnectionGUID: NpoRDD/5Qhqws3HcJGZMtQ==
X-CSE-MsgGUID: o8kWgCqzTa++hmUM8aBAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37557685"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe: Add sync tag to xe_force_gt_reset
Date: Wed,  5 Jun 2024 08:12:47 -0700
Message-Id: <20240605151248.2736694-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
References: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
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

Add a tag to xe_force_gt_reset that allows the user to decide whether or
not they want the reset to be synchronous or not.  This is done by
having the sys call target a new synchronous reset function when the tag
is set to true.

For now, default the tag to false for all current use cases of
xe_force_gt_reset.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_gt.c              | 2 +-
 lib/xe/xe_ioctl.c           | 6 +++---
 lib/xe/xe_ioctl.h           | 2 +-
 tests/intel/xe_exec_reset.c | 8 ++++----
 tests/intel/xe_gt_freq.c    | 2 +-
 tests/intel/xe_wedged.c     | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 743d7a26ec..36beb596b5 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
 	int gt;
 
 	xe_for_each_gt(xe_fd, gt)
-		xe_force_gt_reset(xe_fd, gt);
+		xe_force_gt_reset(xe_fd, gt, false);
 }
 
 /**
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 934c877ebc..a44b65e4ff 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	return timeout;
 }
 
-void xe_force_gt_reset(int fd, int gt)
+void xe_force_gt_reset(int fd, int gt, bool sync)
 {
 	char reset_string[128];
 	struct stat st;
@@ -537,7 +537,7 @@ void xe_force_gt_reset(int fd, int gt)
 	igt_assert_eq(fstat(fd, &st), 0);
 
 	snprintf(reset_string, sizeof(reset_string),
-		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset",
-		 minor(st.st_rdev), gt);
+		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
+		 minor(st.st_rdev), gt, sync ? "_sync" : "");
 	system(reset_string);
 }
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 4d08402e0b..ff5b5d3ed0 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -91,6 +91,6 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-void xe_force_gt_reset(int fd, int gt);
+void xe_force_gt_reset(int fd, int gt, bool sync);
 
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e47c3730dd..ed67284800 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, gt);
+		xe_force_gt_reset(fd, gt, false);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset(fd, eci->gt_id, false);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset(fd, eci->gt_id, false);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
 	while (!*(t->exit)) {
 		usleep(250000);	/* 250 ms */
 		(*t->num_reset)++;
-		xe_force_gt_reset(t->fd, t->gt);
+		xe_force_gt_reset(t->fd, t->gt, false);
 	}
 }
 
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index ff99b46a08..1cfc248947 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
-		xe_force_gt_reset(fd, gt_id);
+		xe_force_gt_reset(fd, gt_id, false);
 
 		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index aa4a452bfc..4f772a0e10 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -31,7 +31,7 @@ static void force_wedged(int fd)
 	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
 	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
 
-	xe_force_gt_reset(fd, 0);
+	xe_force_gt_reset(fd, 0, false);
 	sleep(1);
 }
 
-- 
2.25.1

