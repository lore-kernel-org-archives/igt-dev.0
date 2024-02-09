Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191A5C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522410F97C;
	Fri,  9 Feb 2024 18:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1Aks+x3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE25510F97C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503717; x=1739039717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6B8wCKH5qDr4BL7GZP0IY3nA1Q7bEnF6acr7ScOshg=;
 b=F1Aks+x3g6miOs6y4mAbdecUKJmtSXNuolwujCaDS9jPOO4xakSeMWU9
 8j3TB63Ajx9b8XWk4krFJExz9CL+XCoLGnh8E7CZg4MTGrujrS6ztZdqy
 Biv1pGv1sOh8nCj1LnXs8Ld3IBiRiDdJMvinLaPQT7UPVNEW9ZAuHtlbZ
 KVr5DSZH7ucLq9KcdGYwsuqUKBd9Qu0cWFBTq6g4eEz6NSJxj5aTpIImO
 0l8635vOCb1/VG5aFENWg7hGGUp2nXhuBqweRam9FDQXKwVjs4zZrEZmz
 G8+5TV8cxTt9kKdHJuiteHZfRhfjSR303bdByl56aOLq6RofDdDyRlITU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12049306"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="12049306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6647750"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/8] tests/prime_nv_test: switch over to intel_buf_init()
Date: Fri,  9 Feb 2024 18:34:26 +0000
Message-ID: <20240209183433.375099-1-matthew.auld@intel.com>
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

We want to get rid of intel_buf_init_using_handle(), in favour of always
passing in the real bo size, otherwise it is quite tricky to figure out
what exactly to set for buf->bo_size (which eventually get plugged into
vm_bind) when the caller is the one who created the bo. Trying to guess
the page alignment is unsafe without knowing more about the actual
object.  In this case it seems simplest to switch over to
intel_buf_init. Should be no functional change here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/prime_nv_test.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index bc2579604..eb5e2d8ea 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -273,13 +273,11 @@ static void test_i915_import_pread_pwrite(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-static uint32_t create_bo(uint32_t val, int width, int height)
+static void fill_bo(uint32_t intel_handle, uint32_t val, int width, int height)
 {
-	uint32_t intel_handle;
 	int size = width * height;
 	uint32_t *ptr, *currptr;
 
-	intel_handle = gem_create(intel_fd, 4*width*height);
 	igt_assert(intel_handle);
 
         /* gtt map doesn't have a write parameter, so just keep the mapping
@@ -293,15 +291,12 @@ static uint32_t create_bo(uint32_t val, int width, int height)
 		*currptr++ = val;
 
 	gem_munmap(ptr, size);
-
-	return intel_handle;
 }
 
 /* use intel hw to fill the BO with a blit from another BO,
    then readback from the nouveau bo, check value is correct */
 static void test_i915_blt_fill_nv_read(void)
 {
-	uint32_t dst_handle, src_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t *ptr;
@@ -312,18 +307,18 @@ static void test_i915_blt_fill_nv_read(void)
 
 	ibb = intel_bb_create(intel_fd, 4096);
 
-	src_handle = create_bo(0xaa55aa55, w, h);
-	dst_handle = gem_create(intel_fd, BO_SIZE);
+	intel_buf_init(bops, &src, w, h, 32, 0,
+		       I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_buf_init(bops, &dst, w, 256, 32, 0,
+		       I915_TILING_NONE, I915_COMPRESSION_NONE);
 
-	prime_fd = prime_handle_to_fd(intel_fd, dst_handle);
+	fill_bo(src.handle, 0xaa55aa55, w, h);
+
+	prime_fd = prime_handle_to_fd(intel_fd, dst.handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
 
-	intel_buf_init_using_handle(bops, src_handle, &src, w, h, 32, 0,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	intel_buf_init_using_handle(bops, dst_handle, &dst, w, 256, 32, 0,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
 	intel_bb_copy_intel_buf(ibb, &dst, &src, w * h * 4);
 
 	igt_assert(nouveau_bo_map(nvbo, NOUVEAU_BO_RDWR, nclient) == 0);
@@ -335,8 +330,6 @@ static void test_i915_blt_fill_nv_read(void)
 	intel_buf_destroy(&src);
 	intel_buf_destroy(&dst);
 	intel_bb_destroy(ibb);
-	gem_close(intel_fd, dst_handle);
-	gem_close(intel_fd, src_handle);
 }
 
 /* test 8 use nouveau to do blit */
-- 
2.43.0

