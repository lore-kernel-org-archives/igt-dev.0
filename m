Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4440CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 11:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5383A10EADF;
	Thu, 11 Sep 2025 11:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNrcP8PI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F39D10EADF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757591162; x=1789127162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ejlF4jJfrqveiJw2Mp+t9GO9Jt9BpOu+GJ7qnEbS6q4=;
 b=gNrcP8PIEAbD9N2Rf2ZSWk6GMH+EnE7guvD+UrW86mu5y7KjuO83Usqy
 7G8lbynxdhVNrtTzBwj0/fvgrjpOEoyPjn2ed0MrFuuOMIre15tkAEyDY
 MQA9FI/hommeV7RgE5pY/PyRYZpDU92Z4EVgzSJro7RN+wvqP57zkZVec
 iSSZm2QI3QxkSNRa/MFQx+ZMcbQAHvj5/WNeKx3PGKescS+oDdZrFujND
 l7+7zoJM3knsIjxIpItHlmQ2YjQNPGFNjtfM9Xzm13ARGIrL8d5n1xzcI
 4tHcp8UgxNn84KXQNcDsHB2U4rPYZFVIGci2deYwrWHxe+cRIkR8uDQsb w==;
X-CSE-ConnectionGUID: jBhUUbQeQrCa0wOGlv2mrA==
X-CSE-MsgGUID: uAnkYR1DRTuVfszTiq+C8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63553838"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="63553838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:46:02 -0700
X-CSE-ConnectionGUID: 9JKfcFLuTzSt2MdJTzp5jw==
X-CSE-MsgGUID: gq6cK0CBSnyUTT65bONSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178010484"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:46:00 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()
Date: Thu, 11 Sep 2025 13:45:55 +0200
Message-ID: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

PLEASE DON'T MERGE THIS. Designed for CI and discussion.

Test exercises previously captured situation where glibc main area
lock is not unlocked in case of pthread_kill().

This of course may be different mutex, like print_mutex we previously
also noticed. Blocking SIGINT only decreases probability of hitting
this in xe-eudebug-online@sigint as we have no control over glibc
allocations which might come for example during forking.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_intel_bb.c | 52 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index f2e92a024a..0e30a75e8e 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -28,6 +28,8 @@
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include <sys/types.h>
+#include <sys/wait.h>
 
 /**
  * TEST: Basic tests for intel-bb xe functionality
@@ -955,6 +957,53 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	return fails;
 }
 
+/**
+ * SUBTEST: tf
+ * Description: thread failure
+ */
+static void *myth(void *data)
+{
+	char *ptr[128];
+	(void)data;
+	igt_info("--- thread ---\n");
+
+	while (true) {
+		for (int i = 0; i < 128; i++) {
+			ptr[i] = malloc((i+1) * 4096);
+		}
+		for (int i = 0; i < 128; i++) {
+			free(ptr[i]);
+		}
+	}
+
+	return NULL;
+}
+
+static void tf(void)
+{
+	pthread_t pth;
+	int child;
+	char *ptr2;
+
+	igt_info("--- tf ---\n");
+
+	for (int n = 0; n < 20; n++) {
+		child = fork();
+		if (child) {
+			pthread_create(&pth, NULL, myth, NULL);
+			igt_info("Child %d completed\n", child);
+			waitpid(child, NULL, 0);
+			pthread_kill(pth, SIGINT);
+		} else {
+			ptr2 = malloc(16);
+			igt_info("ptr: %p\n", ptr2);
+			free(ptr2);
+			exit(0);
+		}
+		igt_info("Again...\n");
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1068,6 +1117,9 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("tf")
+		tf();
+
 	igt_fixture {
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
-- 
2.43.0

