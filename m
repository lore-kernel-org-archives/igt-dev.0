Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D40C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035CE10E859;
	Wed,  7 May 2025 16:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwcMj4PV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF51A10E85D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633890; x=1778169890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ok8GHlNvYoTGgp6BdA/L/iGOoaTsHw4lJX8PGoCgol4=;
 b=KwcMj4PV/SdqMMkbVGw14SvjcsHWXwrUrp/GReQPw0NgJlJ/dod8dWXT
 bfq1CfC/MXcMX4NghJSqI/pDCjI1ehkqDMc/Gh5ezqrvMmg6g2ll8yiWO
 zX3IED8FYyVsgfITuQzK562kJLmsOMEMlb6T7p1ZN1fEOPOWOTsblDiK7
 hthlwzTBPmy4tO1n0K0eSI1UlT8ag5e4f/pbzH4LVJ0gc5XW4hyHRlhsM
 xFUA4jmq2Ili+Jn+2ALSc9Q4slmOMX5HrAaOklLW5oermYEDepyreJtlq
 pz9BuUmn62fL++92VaQ6u+Rcuxpkjjxw7Kg39kEjsTY5kIf537u4xbLUb w==;
X-CSE-ConnectionGUID: XdxaTpIVRxG9foKcQREKDQ==
X-CSE-MsgGUID: 4MUdcfPvSGKLZicgI7FisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519334"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:49 -0700
X-CSE-ConnectionGUID: P/fOG3k/RiilGNAFBvDxGQ==
X-CSE-MsgGUID: Zydj24TjRrCgsFHRnRBbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200962"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 07/15] lib/igt_dummyload: Avoid pthread_cancel use by
 introducing an exit flag
Date: Wed,  7 May 2025 16:01:40 +0000
Message-ID: <20250507160148.53857-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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
 2 files changed, 5 insertions(+), 3 deletions(-)

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
-- 
2.34.1

