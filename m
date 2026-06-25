Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3764CDE000
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6651210E260;
	Thu, 25 Jun 2026 19:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ1yyVQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805410E260
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782415756; x=1813951756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MxCCJ79LGvVqaW9O4FiF65YakLIpr2JnN/QpHhgusZI=;
 b=gZ1yyVQiWXa9mUECTTLwx46BbONIY3z1636MTfFeUOVYhwF196KQwCF8
 Bc6EJ17J8aiXQbHvp4vqrPXHUfg/2AWD1yBy5mAM6FJfhshRM13bRkkC3
 0/2VYQBRUm93pA8ID1Cwb5VCn3ffK5MQOjd3M3CZOr/YzNFQDkcylPAAM
 2E714//FGriWhYisyt+5Nt8FLvw5qwhJYGtD3MY0CaAlIzaEJo/Q3KR0w
 m+CltDRSnG8USC/IVt2rhofZgHh9ZIILTwIO9nIaNXvj61inMZuZk+XZP
 15AuzdHPg9k579XB/f4hj2skjI9AmX7bf7mbYaGgATR7TjGnR2AVbGHJg Q==;
X-CSE-ConnectionGUID: DcMsYXoETS2cMIRwB8m8sw==
X-CSE-MsgGUID: JnFvPymxTmm5kVBXVME2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93859246"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93859246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:15 -0700
X-CSE-ConnectionGUID: vU5+uaxsRgGo2dmUTqGoUQ==
X-CSE-MsgGUID: IO24wJTEQUePRZNsB+sF8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="252912693"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.210])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:12 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/dmabuf: Port dmabuf tests to KUnit
Date: Thu, 25 Jun 2026 21:28:49 +0200
Message-ID: <20260625192850.56004-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
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

The dmabuf tests have been moved out of the selftest mechanism into
KUnit in these commits in the kernel:

126c50bc2fb6 dma-buf: Remove the old selftest
6055c9e333cf dma-buf: Change st-dma-fence-chain.c to use kunit
465f3934381c dma-buf: Change st-dma-fence-unwrap.c to use kunit
9baa35a39939 dma-buf: Change st-dma-fence.c to use kunit
15b9bde78bad dma-buf: Change st-dma-resv.c to use kunit

Launch dmabuf tests as KUnit tests instead of selftests from IGT's side
to reflect the kernel changes.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/dmabuf.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 322981473..1baefb299 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -25,7 +25,7 @@
 #include "igt_kmod.h"
 /**
  * TEST: dmabuf
- * Description: Kernel selftests for the dmabuf API
+ * Description: KUnit tests for the dmabuf API
  * Category: Core
  * Mega feature: General Core features
  * Functionality: drm_mm
@@ -33,14 +33,16 @@
  * Feature: mapping, prime
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests
+ * SUBTEST: dma-buf-resv
  *
- * SUBTEST: all-tests@dma_fence
+ * SUBTEST: dma-buf-fence
  *
- * SUBTEST: all-tests@sanitycheck
+ * SUBTEST: dma-buf-fence-unwrap
+ *
+ * SUBTEST: dma-buf-fence-chain
  */
 
-IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
+IGT_TEST_DESCRIPTION("KUnit tests for the dmabuf API");
 
 static unsigned int bogomips(void)
 {
@@ -76,23 +78,24 @@ static unsigned int bogomips(void)
 	return igt_debug_on(!bogomips) ? UINT_MAX : ret;
 }
 
-static int wrapper(const char *dynamic_name,
-		   struct igt_ktest *tst,
-		   struct igt_kselftest_list *tl)
+int igt_main()
 {
+	igt_kunit("dmabuf_kunit", "dma-buf-resv", NULL);
+	igt_kunit("dmabuf_kunit", "dma-buf-fence", NULL);
+
 	/*
-	 * Test case wait-backward of dma_fence_chain selftest can trigger soft
+	 * Test case wait-backward of dma_fence_chain test can trigger soft
 	 * lockups on slow machines.  Since that slowness is not recognized as
 	 * a bug on the kernel side, the issue is not going to be fixed.  Based
-	 * on analysis of CI results, skip that selftest on machines slower than
+	 * on analysis of CI results, skip that test on machines slower than
 	 * 25000 BogoMIPS to avoid ever returning CI reports on that failure.
 	 */
-	igt_skip_on(!strcmp(dynamic_name, "dma_fence_chain") && bogomips() < 25000);
 
-	return igt_kselftest_execute(tst, tl, NULL, NULL);
-}
+	if (bogomips() >= 25000)
+		igt_kunit("dmabuf_kunit", "dma-buf-fence-chain", NULL);
+	else
+		igt_subtest("dma-buf-fence-chain")
+			igt_skip("BogoMips < 25000 - test is not supported\n");
 
-int igt_main()
-{
-	igt_kselftests("dmabuf_selftests", NULL, NULL, NULL, wrapper);
+	igt_kunit("dmabuf_kunit", "dma-buf-fence-unwrap", NULL);
 }
-- 
2.45.2

