Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3DCC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8850D10E1B2;
	Tue, 29 Apr 2025 20:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoUdXJSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696AB10E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959273; x=1777495273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8vV+srqfc2RdEzjYguHFiacJaqtSV9QigkUIevUW+js=;
 b=YoUdXJSkiVi9KPBrlWJ7g5m3Rco3aswf52vkNbRK4EwKr3kfovBtaRRa
 eAtY/9RkKyXE7vwCIKrhFFSWXyOixSPaLVKNpK+FWK2PmKmNscTuyub+d
 dSu2nW6Jk1JDwh/hsqZ7Q+2zi2pLkU1tKXiM8w/LuNiImX2zmlcVx7dmi
 tOuYw/Cjb4CTZ5ZtKFEuUfTxA9Ze14AMiFoRLVfkTgVOp1vPLw3B+/+Mm
 mn3HHZ7yX56OUFeAB95GvO/zUcU/EXd68q4cRYq4tdWL+Q1B4VaWiMjEV
 nhXB6I04a356ONAVR+Wh01wfUGwnoe77eoLLOmW5q0ZMji3Wr09dRSBuZ g==;
X-CSE-ConnectionGUID: BJgwj80MSxW8k2YUiY2Weg==
X-CSE-MsgGUID: WF0XVNIiQXWc3PmFdqL/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47484541"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47484541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:41:13 -0700
X-CSE-ConnectionGUID: a8sInmZQSFCyq3GLg35ZSg==
X-CSE-MsgGUID: 9V01iILUQVGD4K5XfV+/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133832074"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 13:41:11 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 3/5] Avoid use of pthread_cancel by introducing an exit flag
Date: Tue, 29 Apr 2025 20:39:58 +0000
Message-ID: <20250429204000.41537-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
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

