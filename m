Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05682C4828D
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 00:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7F310ED9A;
	Fri,  2 Feb 2024 00:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKJjjMWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E246F10EDA7
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706834741; x=1738370741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8f31svj0Es3WqKZFF/CyfVMj+1eKBQD6ZnbePBCYTD4=;
 b=JKJjjMWp4nCYVMdV3IUW3FyyIkRAcRebOrV/0Xk1o+T+W9R8g2kmQY8H
 o3ORDTlN98vdXpSTdvkEd4dYkhyOrEzBVFpEst4MaJZmh4UTWAEd1RkLF
 wJZXQrmgn5Ns8x/GY4AKzKHhXZCdMzJvIgFm1o4J5zO50falCM9gxG34N
 6H1IweqMVQA8WEHFyCWuFAEBpryRIU0uHAj0ZYQ0J1IQzqqJlbWOPS7w/
 b3rkYwMALTjhOi49c3pgV2R0Dz9gLOp5kqLNF2rABYkZNT9V3RxYls3MK
 tzb8uoMEMD6seR3OvEb+u1SsadoaohvTXG86zb9gN/rQ0s4dL+cHbqg/0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="227723"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="227723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4519401"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:45:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel module
Date: Thu,  1 Feb 2024 16:45:29 -0800
Message-ID: <20240202004529.552806-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202004529.552806-1-lucas.demarchi@intel.com>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
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

https://patchwork.freedesktop.org/series/126786/ groups all the live
tests into a single kernel module. Use that module to run any of the
tests triggered by igt.

To make the live kunit tests work, rename the subtests so they match
what the kernel uses.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
 tests/intel/xe_live_ktest.c              | 25 ++++++++++--------------
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..797a78563 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -227,9 +227,9 @@ igt@kms_psr@psr-sprite-plane-onoff
 igt@core_hotunplug@unbind-rebind
 
 # Run KUnit tests at the end
-igt@xe_live_ktest@bo
-igt@xe_live_ktest@dmabuf
-igt@xe_live_ktest@migrate
+igt@xe_live_ktest@xe_bo
+igt@xe_live_ktest@xe_dmabuf
+igt@xe_live_ktest@xe_migrate
 
 # Move fault_mode tests at the end to unblock execution
 igt@xe_exec_fault_mode@twice-basic
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 5f5f1dff7..d65378858 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -9,38 +9,33 @@
  * Functionality: kunit
  * Test category: functionality test
  *
- * SUBTEST: bo
+ * SUBTEST: xe_bo
  * Description:
  *	Kernel dynamic selftests to check if GPU buffer objects are
  *	being handled properly.
  * Functionality: bo
  *
- * SUBTEST: dmabuf
+ * SUBTEST: xe_dmabuf
  * Description: Kernel dynamic selftests for dmabuf functionality.
  * Functionality: dmabuf
  *
- * SUBTEST: migrate
+ * SUBTEST: xe_migrate
  * Description:
  *	Kernel dynamic selftests to check if page table migrations
  *	are working properly.
  * Functionality: migrate
  *
- * SUBTEST: mocs
+ * SUBTEST: xe_mocs
  * Description:
  *	Kernel dynamic selftests to check mocs configuration.
  * Functionality: mocs
  */
 
-struct kunit_tests {
-	const char *kunit;
-	const char *name;
-};
-
-static const struct kunit_tests live_tests[] = {
-	{ "xe_bo_test",		"bo" },
-	{ "xe_dma_buf_test",	"dmabuf" },
-	{ "xe_migrate_test",	"migrate" },
-	{ "xe_mocs_test",	"mocs" },
+static const char *live_tests[] = {
+	"xe_bo",
+	"xe_dmabuf",
+	"xe_migrate",
+	"xe_mocs"
 };
 
 igt_main
@@ -48,5 +43,5 @@ igt_main
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
+		igt_kunit("xe_live_test", live_tests[i], NULL);
 }
-- 
2.43.0

