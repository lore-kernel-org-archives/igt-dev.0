Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AFEC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056C810EB4B;
	Fri, 16 May 2025 17:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNPNXOmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5306D10EB4B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415553; x=1778951553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1P4GDY1F9w600Xhx1kCzE1tvdjxAjPuNGWC8t/4auQ=;
 b=LNPNXOmOsJtbiNQJa/KK55IVbVS+9+XATYF2/+6W7JqYpw0ilDgWkS8u
 CbImYeRlWVTHqkwTsr5m0XKGOnK5hRpkQDTOLj0LOW911x9UyXoAOpm76
 iuD2GenTXMLydBm+7kxCI5MuSoustPHJCQ8xTKDSKqns49Meg9rj5ywDC
 xhGl1XtwCUiMhTh1FshIMFL2wQevA4W2WR4iSfItqBTjt3b5UEB0MNjIb
 wQgP7Gh8+tLPC1xyI+/Vu+Mz3tUOYUJ/C3+W09MgoKuYlGFF2Xq0LLggc
 gx5jqiSEU/uSgcz5JhDq6KASTWsHwYs/lUeRzLMTanIvtsnkZlxy3iktE g==;
X-CSE-ConnectionGUID: TTCCKzjMTZGEsnxM0w5Jww==
X-CSE-MsgGUID: arpKO62/SIGntW0zMkiTQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297111"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:32 -0700
X-CSE-ConnectionGUID: x3TjS7CiSv64k2Jf7fjjCA==
X-CSE-MsgGUID: Z7AIBZAHRdeOAkDSTaWu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793509"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:29 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 08/14] lib/xe/xe_spin: Avoid pthread_cancel use by
 introducing an exit flag
Date: Fri, 16 May 2025 17:11:47 +0000
Message-ID: <20250516171153.74079-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

