Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28410C3ABDD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D600210E952;
	Thu, 15 May 2025 19:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQBnlgP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5910E952
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338771; x=1778874771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Y0wfIMDX03D+DgxjnkoqtQ8AdAn77PM/cSmiFyvRek=;
 b=dQBnlgP5DkSyPxEMdownKgZY9LCgMXx5NOS1yRU7uvCNGKj2oDoROMFG
 p5QeqgSytTydCpQGOaiwr5baZOcDI7C8lHCXjN1a/mNvHzH7BlU7dxe01
 u3ed54SB3IV4uThcs2NYo/Nvggio8nYnGYmm7DFbITf/RwBNsurxsEWP3
 wy69wx/tWKDdRBtvxGLPIHQjNyTtg3Qu6tcGivIEeEgqqQX/hRlKHRtjk
 2YBS8cQLNPH6sxQ4yDCXWexKsJ84jh2BWJXrXV2tYBwYndwiZuYfoDSq1
 B5QI/AGlXjx05mYMx7gZbD1g/YTNZD4hU7XoLsyPrPSVvCO3TSkRXbZHw A==;
X-CSE-ConnectionGUID: 6vdio5KIR2uF2lltM7BTMA==
X-CSE-MsgGUID: skZmA3B2RGeVURWji8JDSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454474"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:51 -0700
X-CSE-ConnectionGUID: 8SnlZkdRSa+2pbCM5TqbUw==
X-CSE-MsgGUID: R+5SKwPrRTS579NVTb/40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347376"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:48 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 08/14] lib/xe/xe_spin: Avoid pthread_cancel use by introducing
 an exit flag
Date: Thu, 15 May 2025 19:52:01 +0000
Message-ID: <20250515195207.106414-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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
2.34.1

