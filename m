Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB907C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DE610E3A2;
	Mon, 19 May 2025 15:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aN9l2+Ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3A710E3A2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667539; x=1779203539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4W0+B+5lqy5/F2Mrb5LcjPW8n+grIJgz7wfKcwumWk=;
 b=aN9l2+Ctuh6Y5V6dc9dhBdjfZJJKOYFOZcuXpZgn9yPzJzWinl1eG6Qz
 ogRUZgCJq0fYpNfQ6ITu0ZyPt4+/JNSXywJj/V7CEpiaBgC7Vu/nv+SEE
 L7dfR17nMriwXhZH3Z2K3i6xRt0r7f3wAEZpn7JSBB6jUL0gS2fajcDsE
 MtbbiJrowQhxhiTD22Ept6adULhHPPsHlJBslWuAfAAOI2NUDW1bXAKRq
 Q8sdp28WG3VYDqbB42bxiBmA6oFeluo16w8vaWxoY4DyInGOw+4zBBOZP
 OzbKZ9S7j6dG/CRfkjk8/2lRfnpzY3HWeZEFEdQqHmGOkJIvIpGHDLvqm Q==;
X-CSE-ConnectionGUID: PFfxIccWRqClSKlWIMuFaA==
X-CSE-MsgGUID: 86v1vz9VTSWrrpenZr77sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710562"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710562"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:19 -0700
X-CSE-ConnectionGUID: v7l+C4abQOmqPKmTZ7llbQ==
X-CSE-MsgGUID: 65Q9uhslQTKwVMr63K0FOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287981"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:16 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 08/14] lib/xe/xe_spin: Avoid pthread_cancel use by
 overriding timer value
Date: Mon, 19 May 2025 15:11:29 +0000
Message-ID: <20250519151135.43874-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Replace pthread_cancel by overriding the expiration time of the timer.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_spin.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index a92903b6b..23f1dfbfd 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -7,6 +7,7 @@
  */
 
 #include <string.h>
+#include <sys/timerfd.h>
 
 #include "drmtest.h"
 #include "igt.h"
@@ -264,7 +265,16 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	igt_assert(spin->driver == INTEL_DRIVER_XE);
 
 	if (spin->timerfd >= 0) {
+#ifdef ANDROID
+		struct itimerspec its;
+
+		memset(&its, 0, sizeof(its));
+		its.it_value.tv_sec = 0;
+		its.it_value.tv_nsec = 1;
+		timerfd_settime(spin->timerfd, 0, &its, NULL);
+#else
 		pthread_cancel(spin->timer_thread);
+#endif
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
 		close(spin->timerfd);
 	}
-- 
2.49.0

