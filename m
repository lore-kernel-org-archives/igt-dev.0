Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A2606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WRkyt4r4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC92B10E7E9;
	Thu, 19 Nov 2026 00:53:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268C1120EF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795049421; x=1826585421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJNf4l9rFVrtq/O6C75n+bneUlMLRjv69VdSXi9e0Cw=;
 b=WRkyt4r4SEYTPCEIWexwEh+uEmAhf3TI0uVE9YICwZDY9Uqw90y1mmgK
 sPIb1PD5PmFYN1E5jQ5jetdhyq5LrdObkakcqm4OuYCI3oKQgAwlvAdan
 C7qWtYXd9uvIpdv88taQLTRYlj955fu9IcsqimZrSpZdeG+zhPO7tan8R
 Uf81OubY5Nyp031lzFtM57An43n7pmkkWVNVAVICigEP9Vw4ejP+u/Lwv
 lurSdIfvO8UCvhDuWzgBjGqOblCMClqDeAa7quW1z2DpknXkGnIu5G9bU
 x3is1T3A7zlycx7aTsC3rzNIm5DokWWegPd5oCFAGSXLjE4qXqoVep9Ct A==;
X-CSE-ConnectionGUID: wruckXb0SHakC7WG8DBF3Q==
X-CSE-MsgGUID: +SlcWmTZQY+1Z2MkxlDg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3771128"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3771128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:50:16 -0800
X-CSE-ConnectionGUID: +1SXcM6jTjqqxdUGtBsP7g==
X-CSE-MsgGUID: m2UstMoERZmmxIvFlZEheQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10679601"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 16:50:16 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 1/3] lib/xe/xe_gt: Add xe_gt_wait_c6_stable()
Date: Wed, 18 Nov 2026 16:50:07 -0800
Message-ID: <20261119005009.364632-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119005009.364632-1-zongyao.bai@intel.com>
References: <20261119005009.364632-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_gt_is_in_c6() only reports the instantaneous GT idle state, so waiting
for it once (e.g. igt_wait(xe_gt_is_in_c6())) can succeed on a transient
visit to C6 while the GT is still woken up repeatedly by deferred work
of a previous test (such as the teardown of resources released at fd
close).

Add xe_gt_wait_c6_stable() which requires the GT to stay in gt-c6 in
every 10ms sample during a window of @stable_ms and the idle residency
counter to advance by at least 95% of that window, restarting the window
otherwise, with an overall timeout. The window is measured conservatively
(bracketing the counter read with timestamps and allowing for the 1ms
truncation of the counter) so that being preempted does not cause a false
restart, hence @stable_ms must be at least 50.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 lib/xe/xe_gt.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h |  2 ++
 2 files changed, 92 insertions(+)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 1f0b77986..250b15f0c 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -5,7 +5,10 @@
 
 #include <fcntl.h>
 #include <limits.h>
+#include <string.h>
 #include <sys/stat.h>
+#include <time.h>
+#include <unistd.h>
 
 #include "igt_core.h"
 #include "igt_debugfs.h"
@@ -230,6 +233,93 @@ bool xe_gt_is_in_c6(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_wait_c6_stable:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ * @stable_ms: time in ms the GT has to stay in C6 without interruption,
+ *	       at least 50 since the idle residency counter has 1ms resolution
+ * @timeout_ms: maximum time in ms to wait for such a stable window
+ *
+ * Wait until @gt reports "gt-c6" in every sample (polled every 10ms) during
+ * a window of at least @stable_ms and, additionally, the idle residency
+ * counter advanced by at least 95% of that window. This is stronger than
+ * xe_gt_is_in_c6(), which can be satisfied by a single transient visit to C6
+ * while the GT is still being woken up by deferred work (e.g. the teardown of
+ * resources released by a previous test). Whenever the condition is violated
+ * the window is restarted.
+ *
+ * Returns: true if a stable window was observed within @timeout_ms, false
+ * otherwise.
+ */
+bool xe_gt_wait_c6_stable(int fd, int gt, unsigned int stable_ms,
+			  unsigned int timeout_ms)
+{
+	struct timespec t_begin, t_pre, t_post, t_win = {};
+	unsigned long res_win = 0, res;
+	char state[16];
+	bool in_window = false, ret = false;
+	int gt_fd;
+
+	igt_assert(stable_ms >= 50);
+
+	gt_fd = xe_sysfs_gt_open(fd, gt);
+	igt_assert(gt_fd >= 0);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_begin);
+	do {
+		unsigned long elapsed;
+
+		igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%15s",
+					   state) == 1);
+		/*
+		 * Bracket the residency read with timestamps: the window
+		 * is measured from the end of the first read to the start
+		 * of the last one, so being preempted around the reads can
+		 * only make the check more lenient, never fail it.
+		 */
+		clock_gettime(CLOCK_MONOTONIC, &t_pre);
+		igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_residency_ms",
+					   "%lu", &res) == 1);
+		clock_gettime(CLOCK_MONOTONIC, &t_post);
+
+		if (strcmp(state, "gt-c6")) {
+			in_window = false;
+		} else if (!in_window) {
+			t_win = t_post;
+			res_win = res;
+			in_window = true;
+		} else {
+			elapsed = igt_time_elapsed(&t_win, &t_pre) * MSEC_PER_SEC;
+			if (elapsed >= stable_ms) {
+				/* +1: the counter is truncated to whole ms */
+				if ((res - res_win + 1) * 100 >= elapsed * 95) {
+					ret = true;
+					break;
+				}
+				/* C6 counter did not follow, start over */
+				t_win = t_post;
+				res_win = res;
+			}
+		}
+
+		usleep(10 * 1000);
+		clock_gettime(CLOCK_MONOTONIC, &t_post);
+	} while (igt_time_elapsed(&t_begin, &t_post) * MSEC_PER_SEC < timeout_ms);
+
+	close(gt_fd);
+	if (ret)
+		igt_debug("GT%d C6 stable after %.0fms\n", gt,
+			  igt_time_elapsed(&t_begin, &t_post) * MSEC_PER_SEC);
+	else
+		igt_info("GT%d C6 NOT stable after %.0fms (timeout %ums)\n", gt,
+			 igt_time_elapsed(&t_begin, &t_post) * MSEC_PER_SEC,
+			 timeout_ms);
+	errno = 0;
+
+	return ret;
+}
+
 /**
  * xe_gt_dump_debug_info:
  * @fd: open xe drm file descriptor
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 9ef15d7dd..71402714d 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -21,6 +21,8 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
 bool xe_gt_is_in_c6(int fd, int gt);
+bool xe_gt_wait_c6_stable(int fd, int gt, unsigned int stable_ms,
+			  unsigned int timeout_ms);
 bool xe_gt_dump_debug_info(int fd, int gt);
 
 int xe_gt_fill_engines_by_class(int fd, int gt, int class,
-- 
2.43.0

