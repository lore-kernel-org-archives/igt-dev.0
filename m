Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3CC0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0810E7B6;
	Thu, 23 Jan 2025 09:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5tjP+rG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B7A10E7B6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737625950; x=1769161950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDdfXvF0/Z9Fd+0xymmgtbJF2KrFm4gIo0Lyqh2HXoA=;
 b=E5tjP+rGpTa96zAYpTvMFjdZjJNcoI9OwyRNjo02SXv7PeYYsdilpVIn
 KyUmnxRrUtdr+aOXfPEsVyv609iyUuVoxx0ci7Z1h0A2ibiW7zKUGzoEJ
 g0SwgizMwDkMajLa60qfUfuHT54iTnmH63SoG/tF5FKkwQgsK4Kz37vqs
 H5nPJwSztt/4fmFQGa/Y9c0niXkV6+WWvp6gzZXTGl+Ax9MvhKH8pZDpv
 G5XHRwMykOVZ3AmVAKAFuQFq74s4gIOsUqIz+/y+VplcAWDGUK4Kr1OV8
 0AJuILOAdfOaI5du9wxic4r3PrOHL1+9ktumg3GeUKATtj9/lEGQLVr74 Q==;
X-CSE-ConnectionGUID: RO0wHn9NSdySIKS4Ohot8w==
X-CSE-MsgGUID: lhzuAG3PTOyv88H6qAmP5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37814776"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37814776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:30 -0800
X-CSE-ConnectionGUID: YbT/+PUJSYWUVtMi2187MA==
X-CSE-MsgGUID: DdTPJ9O9SJidIBo1Hj20lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107407525"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/xe_intel_bb: check multithreading rescans
 won't segfault
Date: Thu, 23 Jan 2025 10:52:08 +0100
Message-Id: <20250123095208.72984-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
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

This test is likely only for checking purposes, it doesn't makes
sense to merge it after series review.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/xe_intel_bb.c                | 47 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72d..7adb9a3436 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,7 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@xe_intel_bb@multithread-open
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 845052bf26..5df009f9ed 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -18,6 +18,7 @@
 
 #include "igt.h"
 #include "igt_crc.h"
+#include "igt_device_scan.h"
 #include "intel_blt.h"
 #include "intel_bufops.h"
 #include "intel_mocs.h"
@@ -950,6 +951,49 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	return fails;
 }
 
+/**
+ * SUBTEST: multithread-open
+ * Description: check device scanning when multiple threads are involved
+ */
+static void *__single_open(void *data)
+{
+	struct igt_device_card card;
+	int fd;
+
+	igt_info("Thread: %d\n", (int)to_user_pointer(data));
+
+	for (int i = 0; i < 5; i++)
+		igt_devices_scan();
+
+	igt_assert_eq(igt_device_card_match("pci:vendor=intel", &card), true);
+	igt_info("Device detail: %s, %s, %s\n", card.subsystem, card.card, card.render);
+
+	fd = igt_open_card(&card);
+	igt_info("Fd: %d\n", fd);
+	igt_assert(fd >= 0);
+	close(fd);
+
+	return NULL;
+}
+
+#define NUM_THREADS 100
+static void multithread_open(void)
+{
+	pthread_t pth[NUM_THREADS];
+	int i, ret;
+
+	for (i = 0; i < NUM_THREADS; i++) {
+		ret = pthread_create(&pth[i], NULL, __single_open,
+				     from_user_pointer(i));
+		igt_assert_eq(ret, 0);
+	}
+
+	for (i = 0; i < NUM_THREADS; i++) {
+		ret = pthread_join(pth[i], NULL);
+		igt_assert_eq(ret, 0);
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1063,6 +1107,9 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("multithread-open")
+		multithread_open();
+
 	igt_fixture {
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
-- 
2.34.1

