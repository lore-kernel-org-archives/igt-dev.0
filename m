Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD6FC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8010E455;
	Tue, 29 Apr 2025 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjeRw0+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D910E455
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745956740; x=1777492740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8vV+srqfc2RdEzjYguHFiacJaqtSV9QigkUIevUW+js=;
 b=TjeRw0+Rh471hIJ/Ofe7KMEcpf637AsoSI63eOuVISMAE+7Vy0/umast
 WApBcrLm43Yvjn3QX7yXkv371fK3mBfrJ8sbw7s89FfXJcS2RnLov9BfB
 xiUXvb+f1k2QMDpv+SdB5vFV+/e8eVMH9DXovVrLIfOCD1dZVlrAQp1zP
 SedENEhhKkMC7TeWiMOHIcooLp1dVAcrjrR2p+QEyrWXd7vn2OZO4rR5V
 0OdAChdJI+RoVTwVExuRHVBLqCiTOrKWlfWIdd7qyv+KDDohFlIjkqOjo
 6kQA3y6Uw4FoYkaHiIwWXcwNfNja/9Z2uDLBYDA2PSFdT+u2YUKg0tkaP w==;
X-CSE-ConnectionGUID: 7lkRiDIUTlu6bbeu7W1xLA==
X-CSE-MsgGUID: KvJRM0pvTnGQ4aF3EGfirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46843141"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="46843141"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:59:00 -0700
X-CSE-ConnectionGUID: DoS4B5wFQ5OOs6zxYUwOag==
X-CSE-MsgGUID: BTr05tlaQpK1jmIyI/zPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133831337"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 12:58:58 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 3/5] Avoid use of pthread_cancel by introducing an exit flag
Date: Tue, 29 Apr 2025 19:57:43 +0000
Message-ID: <20250429195745.40982-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429195745.40982-1-jeevaka.badrappan@intel.com>
References: <20250429195745.40982-1-jeevaka.badrappan@intel.com>
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

Android build fails due to pthread_cancel unavailability.
Replace pthread_cancel with thread exit based on an exit flag.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_dummyload.c | 6 +++---
 lib/igt_dummyload.h | 2 ++
 lib/xe/xe_spin.c    | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 3cf80b762..38249afb7 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -530,7 +530,7 @@ static void *timer_thread(void *data)
 	/* Wait until we see the timer fire, or we get cancelled */
 	do {
 		read(spin->timerfd, &overruns, sizeof(overruns));
-	} while (!overruns);
+	} while (!overruns && !spin->exit_thread);
 
 	igt_spin_end(spin);
 	return NULL;
@@ -565,7 +565,7 @@ void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns)
 	timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
 	igt_assert(timerfd >= 0);
 	spin->timerfd = timerfd;
-
+	spin->exit_thread = false;
 	pthread_attr_init(&attr);
 	pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
 	pthread_attr_setschedpolicy(&attr, SCHED_FIFO);
@@ -631,7 +631,7 @@ void igt_spin_end(igt_spin_t *spin)
 static void __igt_spin_free(int fd, igt_spin_t *spin)
 {
 	if (spin->timerfd >= 0) {
-		pthread_cancel(spin->timer_thread);
+		spin->exit_thread = true;
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
 		close(spin->timerfd);
 	}
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index b771011af..07b21227d 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -26,6 +26,7 @@
 #define __IGT_DUMMYLOAD_H__
 
 #include <stdint.h>
+#include <stdatomic.h>
 #include <time.h>
 
 #include "drmtest.h"
@@ -75,6 +76,7 @@ typedef struct igt_spin {
 
 	struct timespec last_signal;
 	pthread_t timer_thread;
+	atomic_bool exit_thread;
 	int timerfd;
 
 	int out_fence;
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index a92903b6b..2fb688179 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -264,7 +264,7 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	igt_assert(spin->driver == INTEL_DRIVER_XE);
 
 	if (spin->timerfd >= 0) {
-		pthread_cancel(spin->timer_thread);
+		spin->exit_thread = true;
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
 		close(spin->timerfd);
 	}
-- 
2.49.0

