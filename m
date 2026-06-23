Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3B4CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 20:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24A310EC7E;
	Tue, 23 Jun 2026 20:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmSpkXEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E3510EC7D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782244929; x=1813780929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/sPGzHS4kKY4iWQwFGRxe1E4Msef2eTJGH6/vxY2QGo=;
 b=NmSpkXEZTfySF5/+BOTSmmIVMCAUiNIEpVLl7G9oXrUi8peAksG3jg6f
 6HGTYaAwQVmCU10+ZSOCNjzLwM9Hx1GIXsdjlXjwCarSwacn7QahMTxSP
 rollIJ4SAiohzACBG8RzKxgo7j65SVxA5eyxJrWJR7P/8XejQkNkgrsf7
 7qWg3q32Df0nhHWjK3EliWCMdHYe2aHkLYEem2qfdzxyxD5cWcpEUyx47
 f8p6x1ZY5RDo1WXFRldP8sxZrV507JB9cP8pow7rgQoDXs7ZwxtUwWTiR
 foRbshdmW8PiU8mzI6CK8eqTIp/L5nlLapLJsD7eeOl/zKKfmAnDLDRsQ Q==;
X-CSE-ConnectionGUID: y1BfYVX/TkiADb3Bj6X4Iw==
X-CSE-MsgGUID: LJmEGb+lRF+S+VFLtB94rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105792453"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="105792453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:09 -0700
X-CSE-ConnectionGUID: Y70bsahhSY+ZoawTuWw7kA==
X-CSE-MsgGUID: 45yOCEmLTlyoXXwJ7DLN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="254700586"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:05 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 1/3] tests/dmabuf: Port dmabuf tests to KUnit
Date: Tue, 23 Jun 2026 22:01:50 +0200
Message-ID: <20260623200152.12996-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
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

commit 126c50bc2fb6 ("dma-buf: Remove the old selftest")
commit 6055c9e333cf ("dma-buf: Change st-dma-fence-chain.c to use kunit")
commit 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
commit 9baa35a39939 ("dma-buf: Change st-dma-fence.c to use kunit")
commit 15b9bde78bad ("dma-buf: Change st-dma-resv.c to use kunit")

Launch dmabuf tests as KUnit tests instead of selftests from IGT's side
to reflect the kernel changes.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
+	 * Test case wait-backward of dma-buf-fence-chain test can trigger soft
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

